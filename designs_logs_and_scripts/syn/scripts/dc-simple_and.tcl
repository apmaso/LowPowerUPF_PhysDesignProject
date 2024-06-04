#Normally in simple_and.design_config.tcl
set lib_dir /pkgs/synopsys/2020/32_28nm/SAED32_EDK
set top_design simple_and
set rtl_list [list ../rtl/$top_design.sv ]
set slow_corner "ss0p95v125c"
set lib_types "stdcell_rvt"
set sub_lib_type "saed32rvt_"

#Normally created in dc-get-timlibs.tcl
set search_path "$lib_dir/lib/$lib_types/db_nldm ."
set synthetic_library dw_foundation.sldb
set link_library "${sub_lib_type}${slow_corner}.db $synthetic_library *"
set target_library "${sub_lib_type}${slow_corner}.db"

#After this:
#search_path    = "/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm ."
#link_library   = "saed32rvt_ss0p95v125c.db dw_foundation.sldb *"
#target_library = "saed32rvt_ss0p95v125c.db"

# Analyzing the files for the design.  Set 'define SYNTHESIS for RTL read
analyze $rtl_list -autoread -define SYNTHESIS

# Elaborate the FIFO design
elaborate ${top_design} 

# Changes RTL instance names to be better for synthesis tools 
change_names -rules verilog -hierarchy

# Load the timing and design constraints
source -echo -verbose ../../constraints/${top_design}.sdc

# any additional non-design specific constraints
set_max_transition 0.5 [current_design ]

# Duplicate any non-unique modules so details can be different inside for synthesis
set_dont_use [get_lib_cells */DELLN* ]

uniquify

#compile with ultra features and with scan FFs
compile_ultra  -scan  -no_autoungroup
change_names -rules verilog -hierarchy

# output reports
set stage dc
report_qor > ../reports/${top_design}.$stage.qor.rpt
report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -delay max -input -tran -cross -sig 4 -derate -net -cap  -max_path 10000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing  > ../reports/${top_design}.$stage.check_timing.rpt
check_design > ../reports/${top_design}.$stage.check_design.rpt
check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt

# output netlist
write -hier -format verilog -output ../outputs/${top_design}.$stage.vg
write -hier -format ddc -output ../outputs/${top_design}.$stage.ddc
save_upf ../outputs/${top_design}.$stage.upf

