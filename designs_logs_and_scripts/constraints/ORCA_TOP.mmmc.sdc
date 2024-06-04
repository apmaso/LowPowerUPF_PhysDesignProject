# Have to translate the commands from synopsys ICC --> Cadence Innovus in dc.upf and dct.upf
# Will uncomment the code below to source the upf files after the translation is complete.

#if { [info exists flow ] } {
#	puts " Sourcing the Physical Synthesis DCT UPF"
#	source ../../syn/outputs/ORCA_TOP.dct.upf
#} else {
#        puts " Sourcing the Logical Synthesis DC UPF"
#        source ../../syn/outputs/ORCA_TOP.dc.upf
#}

# need to create something more complicated for different link_library for each corner.
echo create_library_set -name worst_libs -timing \"$link_library_worst\" > mmmc.tcl
echo create_library_set -name best_libs -timing \"$link_library_best\" >> mmmc.tcl
#create_op_cond

#similar to parasitic corners in Synopsys
echo create_rc_corner -name cmax -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap >> mmmc.tcl
echo create_rc_corner -name cmin -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmin.cap >> mmmc.tcl
#echo create_rc_corner -name default_rc_corner -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap >> mmmc.tcl


#slow = worst = max = setup
#fast = best = min = hold

#Creating corners :
echo create_delay_corner -name worst_corner -library_set worst_libs -rc_corner cmax >> mmmc.tcl
echo create_delay_corner -name best_corner -library_set best_libs -rc_corner cmin >> mmmc.tcl

#Creating modes , Mentioning SDC File:
echo create_constraint_mode -name func_best_mode -sdc_files {"../../constraints/ORCA_TOP_func_best.sdc"} >> mmmc.tcl
echo create_constraint_mode -name func_worst_mode -sdc_files {"../../constraints/ORCA_TOP_func_worst.sdc"} >> mmmc.tcl
echo create_constraint_mode -name test_best_mode -sdc_files {"../../constraints/ORCA_TOP_test_best.sdc"} >> mmmc.tcl
echo create_constraint_mode -name test_worst_mode -sdc_files {"../../constraints/ORCA_TOP_test_worst.sdc"} >> mmmc.tcl


#Creating scenarios :
echo create_analysis_view -name func_worst_scenario -delay_corner worst_corner -constraint_mode func_worst_mode >> mmmc.tcl
echo create_analysis_view -name func_best_scenario -delay_corner best_corner -constraint_mode func_best_mode >> mmmc.tcl
echo create_analysis_view -name test_worst_scenario -delay_corner worst_corner -constraint_mode test_worst_mode >> mmmc.tcl
echo create_analysis_view -name test_best_scenario -delay_corner best_corner -constraint_mode test_best_mode >> mmmc.tcl

#all_setup_analysis_views
#all_hold_analysis_views

set setup_scenarios [list {test_worst_scenario func_worst_scenario}]
set hold_scenarios [list {test_best_scenario func_best_scenario}]

echo set_analysis_view -setup $setup_scenarios -hold $hold_scenarios >> mmmc.tcl

echo set_default_view -setup func_worst_scenario

set init_mmmc_file mmmc.tcl

