# start pt_shell -multi_scenario
# Then source this script
#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [lindex [ regexp -inline "(.*)pt" [pwd] ] 1 ]

set multi_scenario_working_directory "./ms_session_1"
set multi_scenario_merged_error_log  "merged_errors.log"
# set dmsa = 1 for no reports inside, or dmsa = 2 for reports at each corner
set dmsa 2 
set search_path $topdir/pt/scripts
 set_host_options -name my_opts1 -num_processes 8 mo -submit ssh
start_hosts
report_host_usage
create_scenario -name func_max -specific_data pt_max.tcl -common_variable {top_design dmsa}
create_scenario -name func_min -specific_data pt_min.tcl -common_variable {top_design dmsa}
create_scenario -name test_best -specific_data test_min.tcl -common_variable {top_design dmsa}
create_scenario -name test_worst -specific_data test_max.tcl -common_variable {top_design dmsa}
create_scenario -name func_slowfast -specific_data func_slowfast.tcl -common_variable {top_design dmsa}
create_scenario -name func_fastslow -specific_data func_fastslow.tcl -common_variable {top_design dmsa}
create_scenario -name test_slowfast -specific_data test_slowfast.tcl -common_variable {top_design dmsa}
create_scenario -name test_fastslow -specific_data test_fastslow.tcl -common_variable {top_design dmsa}
current_session {func_max func_min test_best test_worst func_slowfast func_fastslow test_slowfast test_fastslow}
report_constraints -all_viol -nosplit > $topdir/pt/reports/${top_design}.constraints.dmsa.rpt
#remote_execute {  }

