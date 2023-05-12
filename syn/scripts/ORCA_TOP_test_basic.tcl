write -format verilog -hier -output ../outputs/${top_design}.dct.predft.vg
write -hier -format ddc -output ../outputs/${top_design}.dct.predft.ddc
save_upf ../outputs/${top_design}.dct.predft.upf


#Insert DFT  
set dftclk_ports { pclk sdram_clk sys_2x_clk }
set dftgenclk {I_CLOCKING/sys_clk_in_reg/Q }
#set_dft_signal -view existing_dft -type ScanClock -port $dftclk_ports -timing [list 45 55]

# if there are any resets or generated clocks, they should have a mux and be controllable by ports during test
set_dft_signal -port {prst_n} -active_state 0 -view existing_dft -type Reset

# This is for the te pin for test enable on a clock gating cell inserted by power compiler
set_dft_signal -view spec -port [get_ports test_si* ] -type ScanDataIn
set_dft_signal -view spec -port [get_ports test_so* ] -type ScanDataOut
set_dft_signal -port scan_enable -active_state 1 -view existing -type ScanEnable 
set_dft_signal -port test_mode -active_state 1 -view existing -type TestMode
set_dft_signal -port scan_enable -active_state 1 -view existing -type ScanEnable 
set_dft_signal -port occ_bypass -active_state 1 -view existing -type TestMode

#######################################################################################
#OCC and at speed scan
#######################################################################################


#ATE clocks

set_dft_signal -view existing_dft -type ScanClock -port ate_clk -timing [list 45 55]


#set_scan_configuration -chain_count 3
#set_scan_configuration -chain_count 30 -clock_mixing no_mix


#set_dft_clock_gating_pin CGLPPRX2_LVT -pin_name TE
set_dft_clock_gating_pin [get_cell -of_obj [get_pins -hier */TE ] ] -pin_name TE

#defining test mode signals
#set_dft_signal -view existing_dft -type TestMode -port TM_OCC

#Registers inside OCC controller must be non scan or else the internal clock will not be controlled correctly
set_scan_element false I_CLOCKING/occ_int*/clock_controller
set_scan_element false I_CLOCKING
set_scan_element false I_CLOCKING/occ_int*
set_scan_element false occ_int*

#using latch based clocking logic
set_app_var test_occ_insert_clock_gating_cells true
#set_app_var test_icg_p_ref_for_dft ICGPTX8

set_app_var test_dedicated_clock_chain_clock true

##########################################################################################

#Add top level test_occ_bypass = occ_bypass & test_mode
create_cell test_occ_bypass saed32hvt_ss0p75vn40c/AND2X1_HVT
connect_pin -from occ_bypass -to test_occ_bypass/A1 -port_name occ_bypass
connect_pin -from test_mode -to test_occ_bypass/A2 -port_name test_mode
create_net test_occ_bypass_net 
connect_net test_occ_bypass_net [get_pin  test_occ_bypass/Y ]

# mux the div clock
create_cell I_CLOCKING/dftclkmux saed32hvt_ss0p75vn40c/MUX21X1_HVT
set clkpin [ get_pin I_CLOCKING/sys_clk_in_reg/Q ]
set clknet [ get_net -of_obj $clkpin ]
disconnect_net $clknet $clkpin
connect_pin -from $clkpin -to I_CLOCKING/dftclkmux/A1 
connect_pin -from test_occ_bypass/Y -to I_CLOCKING/dftclkmux/S0 -port test_occ_bypass
connect_net $clknet I_CLOCKING/dftclkmux/Y
connect_pin -from ate_clk -to I_CLOCKING/dftclkmux/A2 -port_name ate_clk

# And off the resets FFs
foreach_in_collection i [ get_pins I_CLOCKING/*rst* -filter "direction==out" ] {
   set name [get_attribute $i name ]
   create_cell I_CLOCKING/${name}_testctl saed32hvt_ss0p75vn40c/OR2X1_HVT
   set driver [get_pin -leaf -of_obj [ get_net -of_obj  [get_pins $i ] ] -filter "direction == out" ]
   set drv_net [get_net -of_obj $driver ]
   disconnect_net $drv_net $driver
   connect_net $drv_net I_CLOCKING/${name}_testctl/Y
   connect_pin -from test_mode -to  I_CLOCKING/${name}_testctl/A1 -port_name test_mode
   connect_pin -from $driver -to I_CLOCKING/${name}_testctl/A2 
}

# mux the port clocks together
foreach clkport $dftclk_ports {
    set port_net [get_net -of_obj [ get_port $clkport ] ]
    set clkpins [ get_pins -of_obj $port_net  ] 
    create_net ${clkport}_mux_net
    create_cell ${clkport}_mux saed32hvt_ss0p75vn40c/MUX21X1_HVT
    connect_net ${clkport}_mux_net ${clkport}_mux/Y
    foreach i $clkpins {
      disconnect_net $port_net $i
      connect_net ${clkport}_mux_net $i
    }
    connect_net $port_net ${clkport}_mux/A1 
    connect_net [get_net ate_clk ] ${clkport}_mux/A2
    connect_net [get_net -of_obj [ get_pin test_occ_bypass/Y ] ] ${clkport}_mux/S0
}

#Connect the SE pins of the clock gaters.  It isn't happening automatically.
foreach_in_collection i [get_pins -of_obj [ get_cells -hier -filter "ref_name=~CGL*" ] -filter "full_name=~*/SE" ] {
disconnect_net [get_net -of_obj $i ] $i
connect_pin -from scan_enable -to $i -port_name scan_enable
}



##########################################################################################

#get_cells -hierarchical * -filter \ {shift_register_head==true || shift_register_flop==true}
#set_scan_register_type  -type  SDFLOP
#set_scan_configuration -replace false
set_app_var compile_seqmap_identify_shift_registers false

create_test_protocol -infer_clock -infer_asynch
dft_drc -pre_dft 
preview_dft -show all
insert_dft
dft_drc 

compile_ultra -scan -incremental  -no_autoungroup

write_test_protocol -output ../outputs/${top_design}.dct.scan.dft.stil

set_app_var compile_seqmap_identify_shift_registers false
#Compile Incr done after DFT insertion
#compile_ultra -scan -incremental 

report_scan_path -test_mode -all > ../reports/${top_design}.dct.dft.scan.rpt

write -format verilog -hier -output ../outputs/${top_design}.dct.dft.vg
write -format verilog -hier -output ../outputs/${top_design}.dct.vg

write_scan_def -output ../outputs/${top_design}.dct.dft.scan.def
write_scan_def -output ../outputs/${top_design}.dct.scan.def
write -hier -format ddc -output ../outputs/${top_design}.dct.dft.ddc
write -hier -format ddc -output ../outputs/${top_design}.dct.ddc
save_upf ../outputs/${top_design}.dct.dft.upf
save_upf ../outputs/${top_design}.dct.upf

# To check test mode, make sure to do the following
#set_case_analysis 1 occ_bypass
#set_case_analysis 1 scan_enable
#set_case_analysis 1 test_mode


