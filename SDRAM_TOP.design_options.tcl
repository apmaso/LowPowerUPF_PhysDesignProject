#set tool [get_db root: .program_short_name]

if {[info exists tool]} {
	setNanoRouteMode -drouteEndIteration 10
	set cts_clks [get_clocks {SDRAM_CLK SYS_2x_CLK SYS_CLK PCI_CLK} ]

	#set_max_transition 0.1 -clock_path $cts_clks
	set_ccopt_property target_max_trans 0.3ns
}


if {[info exists synopsys_program_name]} {

	####### FLOORPLANNING OPTIONS
	if { [sizeof_collection [get_placement_blockage io_pblockage ] ] ==0 } {
	  #create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {1000 50}} -name io_pblockage
	  #create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {800 30}} -name io_pblockage
	}

	#set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ] -offset 500 -pin_spacing 1 -allowed_layers [ get_layers { M4 M5 M6 M7 } ]
	#set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
	#place_pins -self
	#set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
    #load_upf ../../syn/outputs/ORCA_TOP.dc.upf.place_2020

	#if { [ sizeof_collection [get_voltage_areas * ] ] < 2 && $FCL==0} {
		#create_voltage_area  -region {{10.0 433.0480} {418.27 653.72}} -power_domains PD_RISC_CORE
	#	create_voltage_area -region { {10.0 433.016} {318.256 653.688} } -power_domains PD_RISC_CORE 
	#}

	
	if { [sizeof_collection [ get_placement_blockages pb* ] ] == 0 && $FCL==0 } {
	create_placement_blockage -name pb_SDRAM -type allow_buffer_only -blocked_percentage 0 -boundary {{311.6660 1.6720} {311.6660 206.8970} {589.4780 206.8970} {589.4780 1.6720}}	
	}
	######PLACE

	set_app_option -name place.coarse.continue_on_missing_scandef -value true

	set_app_option -name place_opt.initial_place.effort -value medium
	set_app_option -name place_opt.final_place.effort -value medium


	#set enable_recovery_removal_arcs true
	set_app_option -name time.disable_recovery_removal_checks -value false
	#set timing_enable_multiple_clocks_per_reg true
	#set timing_remove_clock_reconvergence_pessimism true
	set_app_option -name timer.remove_clock_reconvergence_pessimism -value true

	#set physopt_enable_via_res_support true
	#set physopt_hard_keepout_distance 5
	#set_preferred_routing_direction -direction vertical -l {M2 M4}
	#set_preferred_routing_direction -direction horizontal -l {M3 M5}
	set_ignored_layers  -min_routing_layer M2 -max_routing_layer M7


	# To optimize DW components (I think only adders right now??) - default is false
	#set physopt_dw_opto true

	#set_ahfs_options -remove_effort high
	#set_buffer_opt_strategy -effort medium


	###########################  CTS Related
	create_routing_rule clock_double_spacing -spacings {M1 0.1 M2 0.112 M3 0.112 M4 0.112 M5 0.112 M6 0.112 M7 0.112 M8 0.112}
	#set_clock_routing_rules -clock [ get_clocks * ] -net_type leaf -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
	set_clock_routing_rules -clock [ get_clocks * ] -net_type internal -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
	set_clock_routing_rules -clock [ get_clocks * ] -net_type root -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3

	set cts_clks [get_clocks {SDRAM_CLK SYS_2x_CLK SYS_CLK PCI_CLK} ]

	# don't allow X16 or X32.  Maybe just stop X32.  They are extremely high drive and could cause EM problems.
	set_lib_cell_purpose -include none [get_lib_cell {*/*X32*} ]

	# dont allow INV* for CTS since I think they are unbalanced rise/fall
	set_lib_cell_purpose -exclude cts [ get_lib_cell */INV* ]

	# potentially try to disallow IBUF (inverter buffers) or NBUF (non-inverting buffers) to see if all inverters or all buffers makes a difference
	set_lib_cell_purpose -exclude cts [ get_lib_cell */IBUF* ]
	#set_lib_cell_purpose -exclude cts [ get_lib_cell */NBUF* ]

	# dont allow slower cells on clock trees.  
	set_lib_cell_purpose -exclude cts [ get_lib_cell { */*HVT */*RVT } ]

	set_max_transition 0.15 -clock_path $cts_clks 

	# Other potential options
	# set_max_capacitance cap_value -clock_path $cts_clks
	# set_app_option -name cts.common.max_net_length  -value float
	# set_app_option -name cts.common.max_fanout  -value <2-1000000>
	# set_clock_tree_options -target_skew value -clock $cts_clks 
	# set_clock_tree_options -target_latency value -clock $cts_clks

	#set_host_options -max_cores 1 -num_processes 1 mo.ece.pdx.edu
	set_app_options -name place_opt.flow.enable_ccd -value false
	set_app_options -name clock_opt.flow.enable_ccd -value false
	set_app_options -name route_opt.flow.enable_ccd -value false
	set_app_options -name ccd.max_postpone -value 0
	set_app_options -name ccd.max_prepone -value 0


	# If design blows up, try turning hold fixing off. 
	# set_app_option -name clock_opt.flow.skip_hold -value true

	# Dont use delay buffers
	#set_dont_use [get_lib_cells */DELLN* ]
	set_lib_cell_purpose -include none [get_lib_cells */DELLN* ]
	set_lib_cell_purpose -include hold [get_lib_cells */DELLN* ]

	########################## Route related
	set_app_option -name route_opt.flow.xtalk_reduction -value true
	set_app_option -name time.si_enable_analysis -value true
}

