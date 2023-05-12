# need to create something more complicated for different link_library for each corner.
# Clear the file before writing to it. 
echo > mmmc.tcl
echo create_library_set -name libs_max -timing \"$link_library_worst\" >> mmmc.tcl
echo create_library_set -name libs_min -timing \"$link_library_best\" >> mmmc.tcl

#slow = worst = max = setup
#fast = best = min = hold

#create_op_cond
echo create_rc_corner -name cmax -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap >> mmmc.tcl
echo create_rc_corner -name cmin -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmin.cap >> mmmc.tcl
#echo create_rc_corner -name default_rc_corner -T -40 -cap_table ../../cadence_cap_tech/saed32nm_1p9m_Cmax.cap >> mmmc.tcl


# Creating corners. 
echo create_delay_corner -name max_corner -library_set libs_max -rc_corner cmax >> mmmc.tcl
echo create_delay_corner -name min_corner -library_set libs_min -rc_corner cmin >> mmmc.tcl

# Creating modes, sdc file mentioned..
echo create_constraint_mode -name func_max_sdc -sdc_files ../../constraints/${top_design}.sdc >> mmmc.tcl
echo create_constraint_mode -name func_min_sdc -sdc_files ../../constraints/${top_design}.sdc >> mmmc.tcl

# Creating scenario. 
echo create_analysis_view -name func_max_scenario -delay_corner max_corner -constraint_mode func_max_sdc >> mmmc.tcl
echo create_analysis_view -name func_min_scenario -delay_corner min_corner -constraint_mode func_min_sdc >> mmmc.tcl

echo set_analysis_view -setup func_max_scenario -hold func_min_scenario >> mmmc.tcl

# This is done so constraints applied are applied to all analysis views.
# sdc file that needs to run is /syn/outputs/$top_design.genus.sdc
echo "set_interactive_constraint_modes \{func_max_sdc func_min_sdc\}" >> mmmc.tcl

set init_mmmc_file mmmc.tcl

