write -format verilog -hier -output ../outputs/${top_design}.dct.predft.vg
write -hier -format ddc -output ../outputs/${top_design}.dct.predft.ddc
save_upf ../outputs/${top_design}.dct.predft.upf

#Insert DFT  
set dftclk_ports { pclk sdram_clk sys_2x_clk }
set dftgenclk {I_CLOCKING/sys_clk_in_reg/Q }
set_dft_signal -view existing_dft -type ScanClock -port $dftclk_ports -timing [list 45 55]

# if there are any resets or generated clocks, they should have a mux and be controllable by ports during test
set_dft_signal -port {prst_n} -active_state 0 -view existing_dft -type Reset

# This is for the te pin for test enable on a clock gating cell inserted by power compiler
set_dft_signal -view spec -port [get_ports test_si* ] -type ScanDataIn
set_dft_signal -view spec -port [get_ports test_so* ] -type ScanDataOut
set_dft_signal -port scan_enable -active_state 1 -view existing -type ScanEnable
set_dft_signal -port test_mode -active_state 1 -view existing -type TestMode

#######################################################################################
#OCC and at speed scan
#######################################################################################


#ATE clocks

set_dft_signal -view existing_dft -type ScanClock -port ate_clk -timing [list 45 55]
set_dft_signal -view existing_dft -type Oscillator -port ate_clk
set_dft_signal -view existing_dft -type Oscillator -port $dftclk_ports 
set_dft_signal -view existing_dft -type Oscillator -hookup_pin $dftgenclk

#enabling on chip clock support
set_dft_configuration -clock_controller enable

#this command specifies the OCC Controller design to be instantiated. The DFT compiler
#synthesized clock controller is named snps_clk_mux

set_dft_clock_controller -cell_name occ_int1 -design_name snps_clk_mux1 -pllclocks  $dftgenclk -ateclocks ate_clk -cycles_per_clock 2 -chain_count 1
set_dft_clock_controller -cell_name occ_int2 -design_name snps_clk_mux2 -pllclocks $dftclk_ports -ateclocks ate_clk -cycles_per_clock 2 -chain_count 1


#set_scan_configuration -chain_count 3
#set_scan_configuration -chain_count 30 -clock_mixing no_mix

set_dft_signal -view existing_dft -type pll_reset -port occ_reset
set_dft_signal -view existing_dft -type pll_bypass -port occ_bypass

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

set_app_var test_icg_p_ref_for_dft CGLNPRX2_LVT

#create_test_protocol -infer_clock -infer_asynch
# infer will catch the pll_reset asynch.
create_test_protocol -infer_clock -infer_asynch 
dft_drc -pre_dft  
dft_drc -pre_dft -verbose > ../reports/${top_design}.dct.dft2.predft.drc.verbose.rpt
dft_drc -pre_dft  > ../reports/${top_design}.dct.dft2.predft.drc.rpt
preview_dft -show all
insert_dft
dft_drc 
dft_drc -verbose > ../reports/${top_design}.dct.dft2.drc.verbose.rpt
dft_drc  > ../reports/${top_design}.dct.dft2.drc.rpt

# This is stitching and inserting OCC, but it is getting dft_drc errors after insert_dft.  Need to debug.

#run drc with external clocks enabled during capture (PLL bypassed)
#set_dft_drc_configuration -pll_bypass enable
#remove_test_protocol
#create_test_protocol
#dft_drc -verbose > dft.pll_bypass.rpt 
#dft_drc  > dft.pll_bypass.rpt 


compile_ultra -scan -incremental  -no_autoungroup

write_test_protocol -output ../outputs/${top_design}.dct.dft2.scan.stil

set_app_var compile_seqmap_identify_shift_registers false
#Compile Incr done after DFT insertion
#compile_ultra -scan -incremental 

report_scan_path -test_mode -all > ../reports/${top_design}.dct.dft2.scan.rpt

write -format verilog -hier -output ../outputs/${top_design}.dct.dft2.vg
write -format verilog -hier -output ../outputs/${top_design}.dct.vg

write_scan_def -output ../outputs/${top_design}.dct.dft2.scan.def
write_scan_def -output ../outputs/${top_design}.dct.scan.def
write -hier -format ddc -output ../outputs/${top_design}.dct.dft2.ddc
write -hier -format ddc -output ../outputs/${top_design}.dct.ddc
save_upf ../outputs/${top_design}.dct.dft2.upf
save_upf ../outputs/${top_design}.dct.upf

# To check test mode, make sure to do the following
#set_case_analysis 1 occ_bypass
#set_case_analysis 1 scan_enable
#set_case_analysis 1 test_mode

