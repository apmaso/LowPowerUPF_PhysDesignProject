if { [info exists synopsys_program_name ] } {
	switch $synopsys_program_name {
	 "icc2_shell"  {
		# If the flow variable is set, then we should be in regular APR flow and not the macro floorplanning mode
		# We want to use the UPF associated with the correct netlist.  APR flow uses DCT output.  Macro fp uses DC output.
		if { [info exists flow ] } {
		    puts " Sourcing the Physical Synthesis DCT UPF"
		    source ../../syn/outputs/ORCA_TOP.dct.upf
		} else {
		    puts " Sourcing the Logical Synthesis DC UPF"
		    source ../../syn/outputs/ORCA_TOP.dc.upf
		}

		puts " Creating ICC2 MCMM "
		foreach mode { func test } {
		  create_mode $mode
		}
		foreach corner { {Cmax -40 ss0p75vn40c} {Cmin -40 ff0p95vn40c} } {
		  set corner_name [lindex $corner 0 ]
		  set corner_temp [lindex $corner 1 ]
		  set corner_op_cond [ lindex $corner 2 ]
		  create_corner $corner_name
		  # Read the TLUplus file and give it a name.  
		  read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_${corner_name}.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name ${corner_name}.tlup
		  # In our current case, we will use the same TLUplus and temperature for both launch and capture and for setup and hold for a particular corner.
		  # set the TLUplus and temp to be used for early side of paths.  (launch on setup, capture on hold)
		  set_parasitic_parameters -early_spec ${corner_name}.tlup -early_temperature $corner_temp
		  # set the TLUplus and temp to be used for late side of paths.  (capture on setup, launch on hold)
		  set_parasitic_parameters -late_spec ${corner_name}.tlup -late_temperature $corner_temp
		  # indicate which operating condition to use for the standard cells. It needs to know the PVT.  
		  # UPF may indicate additional information for the voltage in a multivoltage design.
		  set_operating_condition $corner_op_cond -library saed32lvt_c
		}

		foreach scenario { {func_worst func Cmax } {func_best func Cmin} {test_worst test Cmax} {test_best test Cmin} } {
		  create_scenario -name [lindex $scenario 0 ] -mode [lindex $scenario 1 ] -corner [lindex $scenario 2 ]
		  current_scenario [lindex $scenario 0]
		  source -echo -verbose -continue_on_error ../../constraints/ORCA_TOP_[lindex $scenario 0 ].sdc 
		  set_false_path -from SDRAM_CLK -to SD_DDR_CLK 
		}

		set_scenario_status func_worst -active true -hold false -setup true
		set_scenario_status func_best  -active true -hold true  -setup false
		set_scenario_status test_worst -active true -hold false -setup true
		set_scenario_status test_best  -active true -hold true  -setup false

		current_scenario "func_worst"

	 }
	 "dc_shell" {
		 set upf_create_implicit_supply_sets false
		source ../../constraints/ORCA_TOP.upf
		set_operating_conditions ss0p75vn40c -library saed32lvt_ss0p75vn40c
		source ../../constraints/ORCA_TOP_func_worst.sdc
		set_false_path -from SDRAM_CLK -to SD_DDR_CLK

		# Define voltage area for DCT mode.  We define the mw_lib variable in DCT mode script.
		# In the ICC2_flow it is defined in ORCA_TOP.design_options.tcl. Slightly different syntax.
		if { [ info exists mw_lib ] } {
		   create_voltage_area  -coordinate {{580 0} {1000 400}} -power_domain PD_RISC_CORE
		}
	 }
	 "pt_shell" {
		source $topdir/apr/outputs/ORCA_TOP.route2.upf
		if [ regexp "max" $corner_name ] {
		    set_operating_conditions ss0p75vn40c -library saed32lvt_ss0p75vn40c
		    source $topdir/constraints/ORCA_TOP_func_worst.sdc
		}
		if [ regexp "min" $corner_name]  {
		    set_operating_conditions ff0p95vn40c -library saed32lvt_ff0p95vn40c
		    source $topdir/constraints/ORCA_TOP_func_best.sdc
		}
		 if [ regexp "min_test" $corner_name]  {
		    set_operating_conditions ff0p95vn40c -library saed32lvt_ff0p95vn40c
		    source $topdir/constraints/ORCA_TOP_test_best.sdc
		}
		if [ regexp "max_test" $corner_name]  {
		    set_operating_conditions ss0p75vn40c -library saed32lvt_ss0p75vn40c
		    source $topdir/constraints/ORCA_TOP_test_worst.sdc
		}
		 if [ regexp "cc_min" $corner_name]  {
		    set_operating_conditions ff0p95vn40c -library saed32lvt_ff0p95vn40c
		    source $topdir/constraints/ORCA_TOP_func_best.sdc
		}
		 if [ regexp "cc_max" $corner_name]  {
		    set_operating_conditions ss0p75vn40c -library saed32lvt_ss0p75vn40c
		    source $topdir/constraints/ORCA_TOP_func_worst.sdc
		}
		 if [ regexp "cc_min_test" $corner_name]  {
		    set_operating_conditions ff0p95vn40c -library saed32lvt_ff0p95vn40c
		    source $topdir/constraints/ORCA_TOP_test_best.sdc
		}
		 if [ regexp "cc_max_test" $corner_name]  {
		    set_operating_conditions ss0p75vn40c -library saed32lvt_ss0p75vn40c
		    source $topdir/constraints/ORCA_TOP_test_worst.sdc
		}
	 }
	}
} elseif {[get_db root: .program_short_name] == "genus"} {
   read_power_intent ../../constraints/ORCA_TOP.upf -version 2.0 -module $top_design
   apply_power_intent
   commit_power_intent
#   report_power_intent 
   set_units -time ns
   source -echo -verbose ../../constraints/${top_design}_func_worst.sdc
   set_false_path -from SDRAM_CLK -to SD_DDR_CLK
   
} elseif {[get_db root: .program_short_name] == "innovus"} {

	set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
}
