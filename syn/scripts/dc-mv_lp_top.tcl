source -echo -verbose ../../$top_design\_design_config.tcl

#remove_design -designs
#remove_design -all
#remove_upf

#set top_design seed_rtl
# Set up the search path to the libraries
lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_hvt/db_nldm"

# Indicate where the foundation synthesis library is
set synthetic_library dw_foundation.sldb
set target_library "saed32hvt_ff0p85v125c.db saed32hvt_ff1p16v125c.db saed32hvt_dlvl_ff0p85v125c_i1p16v.db saed32hvt_ulvl_ff1p16v125c_i0p85v.db saed32hvt_pg_ff0p85v25c.db saed32hvt_pg_ff1p16v25c.db"

set link_library [join "$target_library * saed32hvt_ff0p85v125c.db saed32hvt_ff1p16v125c.db saed32hvt_dlvl_ff0p85v125c_i1p16v.db saed32hvt_ulvl_ff1p16v125c_i0p85v.db dw_foundation.sldb"]

# Analyzing the current design
analyze -format sverilog ../rtl/${top_design}.sv

# Elaborate the design
elaborate ${top_design}
set stage dc_elab

write -hier -format ddc -output ../outputs/${top_design}.$stage.ddc
save_upf ../outputs/${top_design}.$stage.upf 

# Load the UPF file
load_upf ../rtl/${top_design}.upf
# Load the timing and design constraints
report_level_shifter -verbose

source -echo -verbose ../../constraints/${top_design}.sdc
set_operating_conditions ff1p16v125c -library saed32hvt_ff1p16v125c
set_operating_conditions ff0p85v125c -library saed32hvt_ff0p85v125c
set_operating_conditions dlvl_ff0p85v125c_i1p16v -library saed32hvt_dlvl_ff0p85v125c_i1p16v
set_operating_conditions ulvl_ff1p16v125c_i0p85v -library saed32hvt_ulvl_ff1p16v125c_i0p85v

set_voltage 1.16 -object_list VDDH
set_voltage 1.16 -object_list VDDH_gated_moda
set_voltage 1.16 -object_list VDDH_gated_modb
set_voltage 0.85 -object_list VDDL
set_voltage 0.85 -object_list VDDL_gated_modc
set_voltage 0.85 -object_list VDDL_gated_modd
set_voltage 0.0 -object_list VSS

#set_clock_gating_style -sequential_cell latch
#set_clock_gating_objects -force_include [filter_collection [get_cells] "is_sequential==true"]

compile_ultra -no_autoungroup -no_seq_output_inversion -exact_map -no_boundary_optimization -no_design_rule -gate_clock
#compile_ultra -no_autoungroup -no_seq_output_inversion -exact_map -no_design_rule
# output reports
set stage dc
report_qor > ../reports/${top_design}.$stage.qor.rpt
report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -delay max -input -tran -cross -sig 4 -derate -net -cap -max_path 10000 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing > ../reports/${top_design}.$stage.check_timing.rpt
check_design > ../reports/${top_design}.$stage.check_design.rpt
check_mv_design -verbose > ../reports/${top_design}.$stage.mvrc.rpt
report_reference > ../reports/${top_design}.$stage.ref.rpt
report_level_shifter > ../reports/${top_design}.$stage.level_shifter.rpt
report_isolation_cell > ../reports/${top_design}.$stage.isolation_cell.rpt
report_power > ../reports/${top_design}.$stage.power.rpt
report_pst > ../reports/${top_design}.$stage.pst.rpt
write -hier -format verilog -output ../outputs/${top_design}.$stage.v
save_upf ../outputs/${top_design}.$stage.upf

