#Normally in simple_and.design_config.tcl
set lib_dir /pkgs/synopsys/2020/32_28nm/SAED32_EDK
set top_design simple_and
set rtl_list [list ../rtl/$top_design.sv ]
set slow_corner "ss0p95v125c"
set lib_types "stdcell_rvt"
set sub_lib_type "saed32rvt_"

#Normally created in genus-get-timlibslefs.tcl
set search_path "$lib_dir/lib/$lib_types/db_nldm ."
set link_library "${sub_lib_type}${slow_corner}.lib "

set_db init_lib_search_path $search_path

set_db library $link_library

# Analyzing the current FIFO design
read_hdl -language sv ../rtl/${top_design}.sv

# Elaborate the FIFO design
elaborate $top_design

# Changes RTL instance names to be better for synthesis tools 
update_names -map { {"." "_" }} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -port_bus
update_names -map {{"[" "_"} {"]" "_"}} -hport_bus
update_names -inst -hnet -restricted {[} -convert_string "_"
update_names -inst -hnet -restricted {]} -convert_string "_"

# Load the timing and design constraints
source -echo -verbose ../../constraints/${top_design}.sdc


syn_generic
# any additional non-design specific constraints
#set_max_transition 0.5 [current_design ]

# Duplicate any non-unique modules so details can be different inside for synthesis
uniquify $top_design

#compile with ultra features and with scan FFs
syn_map
syn_opt

# output reports
set stage genus
report_qor > ../reports/${top_design}.$stage.qor.rpt
#report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -max_path 1000 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing_intent -verbose  > ../reports/${top_design}.$stage.check_timing.rpt
check_design  > ../reports/${top_design}.$stage.check_design.rpt
#check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt

# output netlist
write_hdl $top_design > ../outputs/${top_design}.$stage.vg

