history keep 100
set_db timing_report_fields "delay arrival transition fanout load cell timing_point"

source -echo -verbose ../../${top_design}.design_config.tcl

set designs [get_db designs * ]
if { $designs != "" } {
  delete_obj $designs
}
set search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_hvt/db_nldm"
foreach i $lib_types { lappend search_path $i }

set link_library ""
foreach i $search_path {
  foreach k $synth_corners {
      foreach m $sub_lib_type {
        foreach j [glob -nocomplain $i/$m$k.lib ] {
          lappend link_library [file tail $j ]
        }
      }
  }
}


set_db init_lib_search_path $search_path

set_db library $link_library

set_db dft_opcg_domain_blocking true

set_db auto_ungroup none

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

#return -level 9 

if { [info exists enable_dft] &&  $enable_dft  } {

   if { [file exists ../../${top_design}.dft_eco.tcl] == 1 } {
      # Make eco changes like instantiating a PLL.
      source -echo -verbose ../../${top_design}.dft_eco.tcl
   } 
   # Setup DFT/OPCG dependencies.
   source -echo -verbose ../../${top_design}.dft_config.tcl
}

if { [ info exists add_ios ] && $add_ios } {
   #source -echo -verbose ../scripts/genus-add_ios.tcl
   # Source the design dependent code that will put IOs on different sides
   #source ../../$top_design.add_ios.tcl
}

# This needs to be after add_ios
update_names -map { {"." "_" }} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -inst -force
update_names -map {{"[" "_"} {"]" "_"}} -port_bus
update_names -map {{"[" "_"} {"]" "_"}} -hport_bus
update_names -inst -hnet -restricted {[} -convert_string "_"
update_names -inst -hnet -restricted {]} -convert_string "_"

create_opcond -name VDDH -voltage 1.16
create_opcond -name VDDL -voltage 0.85
create_opcond -name VDDH_gated_moda -voltage 1.16
create_opcond -name VDDH_gated_modb -voltage 1.16
create_opcond -name VDDL_gated_modc -voltage 0.85
create_opcond -name VDDL_gated_modd -voltage 0.85
create_opcond -name VSS -voltage 0.00


# Load the timing and design constraints
source -echo -verbose ../../constraints/${top_design}.sdc
read_power_intent -version 1801 ../rtl/${top_design}.upf  -module ${top_design}
apply_power_intent
commit_power_intent


set_dont_use [get_lib_cells */DELLN* ]

syn_gen
# any additional non-design specific constraints
#set_max_transition 0.150 [current_design ]

# Duplicate any non-unique modules so details can be different inside for synthesis
uniquify $top_design

if { [info exists enable_dft] &&  $enable_dft  } {

   check_dft_rules
   # Need to have test_mode port defined to run this command. 
   fix_dft_violations -clock -async_set -async_reset -test_control test_mode  
   report dft_registers

}

#compile with ultra features and with scan FFs
syn_map

if { [info exists enable_dft] &&  $enable_dft  } {
   if { [file exists ../../${top_design}.reg_eco.tcl] == 1 } {
      # Make eco changes to registers.
      source -echo -verbose ../../${top_design}.reg_eco.tcl
   } 

   check_dft_rules
   # Connect the scan chain. 
   connect_scan_chains -auto_create_chains 
   report_scan_chains
}

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
if { [info exists enable_dft] &&  $enable_dft  } {
   # output scan def. 
   write_scandef $top_design > ../outputs/${top_design}.$stage.scan.def
   write_sdc $top_design > ../outputs/${top_design}.$stage.sdc
}

write_db -all_root_attributes -verbose ../outputs/${top_design}.$stage.db


