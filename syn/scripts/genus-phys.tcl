history keep 100
set_db timing_report_fields "delay arrival transition fanout load cell timing_point"

source -echo -verbose ../../$top_design.design_config.tcl

set designs [get_db designs * ]
if { $designs != "" } {
  delete_obj $designs
}

source ../scripts/genus-get-timlibslefs.tcl

set_db init_lib_search_path $search_path

set_db library $link_library

# Currently copy all the lef files from original locations and delete the BUSBITCHARS lines.  The "_" of  "_<>" is a problem.
foreach i [glob -nocomplain saed*.lef ] { file delete $i }
foreach i $lef_path {
   exec grep -v BUSBITCHARS $i > [file tail $i ]
}

# IO lefs are causing issues.  Trying this to allow them to be loaded still.
#set_db lib_lef_consistency_check_enable false

# Load the tech lef and cell lef files
set_db lef_library "../../cadence_cap_tech/tech.lef [glob saed*.lef]"

# Do we need this?
#license checkout Genus_Physical_Opt

# We can make the cap table from the Synopsys Library information, but I have not found how to make the qrc_tech_file
#set_db qrc_tech_file $QRC_TECH_FILE_NAME
set_db cap_table_file $topdir/cadence_cap_tech/saed32nm_1p9m_Cmax.cap


# Analyzing the current FIFO design
read_hdl -language sv ../rtl/${top_design}.sv


#set_db hdl_array_naming_style %s_%d
#set_db hdl_instance_array_naming_style %s_%d
#set_db bus_naming_style %s_%d
#set_db hdl_record_naming_style %s_%s
#set_db hdl_parameter_naming_style _%s%d

#set_db hdlin_template_naming_style "%s_%p"
#set_db hdlin_template_parameter_style "%d"
#set_db hdlin_template_separator_style "_"
#set_db hdlin_template_parameter_style_variable "%d" 

# Elaborate the FIFO design
elaborate $top_design

if { $enable_dft == 1} {
   if { [file exists ../../${top_design}.dft_eco.tcl] == 1 } {
      # Make eco changes like instantiating a PLL.
      source -echo -verbose ../../${top_design}.dft_eco.tcl
   } 
   # Setup DFT/OPCG dependencies.
   source -echo -verbose ../../${top_design}.dft_config.tcl

}

if { [ info exists add_ios ] && $add_ios } {
   source -echo -verbose ../scripts/genus-add_ios.tcl
   # Source the design dependent code that will put IOs on different sides
   source ../../$top_design.add_ios.tcl
}

# This needs to be after add_ios
update_names -map { {"." "_" }} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -port_bus
update_names -map {{"[" "_"} {"]" "_"}} -hport_bus
update_names -inst -hnet -restricted {[} -convert_string "_"
update_names -inst -hnet -restricted {]} -convert_string "_"

# Load the timing and design constraints
source -echo -verbose ../../constraints/${top_design}.sdc

read_def ../../apr/outputs/${top_design}.floorplan.innovus.def
#read_def ../../apr/outputs/${top_design}.floorplan.innovus.macros.def

set_db auto_ungroup none

if { $enable_dft == 1} {
   check_dft_rules
   # Need to have test_mode port defined to run this command. 
   fix_dft_violations -clock -async_set -async_reset -test_control test_mode  
   report dft_registers

}

syn_generic -physical

# any additional non-design specific constraints
#set_max_transition 0.5 [current_design ]

# Duplicate any non-unique modules so details can be different inside for synthesis
uniquify $top_design

#compile with ultra features and with scan FFs
syn_map -physical

if { $enable_dft == 1} {
   if { [file exists ../../${top_design}.reg_eco.tcl] == 1 } {
      # Make eco changes like instantiating a PLL.
      source -echo -verbose ../../${top_design}.reg_eco.tcl
   } 
   check_dft_rules
   # Connect the scan chain. 
   connect_scan_chains -auto_create_chains
   report_scan_chains
}


syn_opt -spatial

# output reports
set stage genus_phys
report_qor > ../reports/${top_design}.$stage.qor.rpt
#report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -max_path 1000 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing_intent -verbose  > ../reports/${top_design}.$stage.check_timing.rpt
check_design  > ../reports/${top_design}.$stage.check_design.rpt
#check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt

# output netlist
write_hdl $top_design > ../outputs/${top_design}.$stage.vg
if { $enable_dft == 1} {
   # output scan def. 
   write_scandef $top_design > ../outputs/${top_design}.$stage.scan.def
   write_sdc $top_design > ../outputs/${top_design}.$stage.sdc
}

write_db -all_root_attributes -verbose ../outputs/${top_design}.$stage.db


