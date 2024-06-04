#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [lindex [ regexp -inline "(.*)pt" [pwd] ] 1 ]

source $topdir/$top_design.design_config.tcl


set corners $fast_corner

source $topdir/pt/scripts/pt-get-timlibs.tcl

read_verilog $topdir/apr/outputs/${top_design}.route2.vg.gz
current_design ${top_design}
link
set_app_var si_enable_analysis true
read_parasitics -keep_capacitive_coupling $topdir/apr/outputs/${top_design}.route2.$fast_metal.spef.gz

set corner_name min-pocv

source -echo -verbose $topdir/constraints/${top_design}.sdc

set report_default_significant_digits 3


set_propagated_clock [ all_clocks ]

# set flat timing derate?
#set_timing_derate -early 0.9
#set_timing_derate -late 1.1
reset_timing_derate
set_app_var timing_pocvm_enable_analysis true
#set_app_var timing_aocvm_analysis_mode combined_launch_capture_depth
set_app_var timing_ocvm_enable_distance_analysis false
set_app_var timing_pocvm_corner_sigma 3
set_app_var timing_pocvm_report_sigma 3

read_ocvm $topdir/pt/scripts/std_hold_early.pocv
read_ocvm $topdir/pt/scripts/std_hold_late.pocv

set timing_remove_clock_reconvergence_pessimism true
set timing_crpr_threshold_ps 1

set_false_path -setup -from [get_clock * ]
set_false_path -setup -to [get_clock * ]

update_timing -full

if { ![info exists dmsa ] || ( $dmsa == 2 ) } {
    report_qor > $topdir/pt/reports/${top_design}.qor.$corner_name.rpt
    report_constraints -all_viol > $topdir/pt/reports/${top_design}.constraints.$corner_name.rpt
    report_timing -delay min -input -tran -cross -sig 4 -derate -net -cap  -path full_clock_expanded -max_path 10000 -slack_less 0 > $topdir/pt/reports/${top_design}.timing.full_clock.$corner_name.rpt
    report_timing -delay min -input -tran -cross -sig 4 -derate -net -cap  -max_path 10000 -slack_less 0 > $topdir/pt/reports/${top_design}.timing.$corner_name.rpt
    check_timing -verbose > $topdir/pt/reports/${top_design}.check_timing.$corner_name.rpt
    check_noise -verbose > $topdir/pt/reports/${top_design}.check_noise.$corner_name.rpt
    report_analysis_coverage > $topdir/pt/reports/${top_design}.coverage.$corner_name.rpt
    report_annotated_parasitics > $topdir/pt/reports/${top_design}.parasitics.$corner_name.rpt
}
