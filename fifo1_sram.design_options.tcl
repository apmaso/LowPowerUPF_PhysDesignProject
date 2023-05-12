######PLACE
if { [info exists synopsys_program_name ] } { 
    set_app_option -name place.coarse.continue_on_missing_scandef -value true

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

    # Dont use delay buffers
    #set_dont_use [get_lib_cells */DELLN* ]
    set_lib_cell_purpose -include hold [get_lib_cells */DELLN* ]

    #FIXME
    #set_host_options -max_cores 1 -num_processes 1 mo.ece.pdx.edu
    set_app_options -name place_opt.flow.enable_ccd -value false
    set_app_options -name clock_opt.flow.enable_ccd -value false
    set_app_options -name route_opt.flow.enable_ccd -value false
    set_app_options -name ccd.max_postpone -value 0
    set_app_options -name ccd.max_prepone -value 0

    ###########################  CTS Related
    create_routing_rule clock_double_spacing -spacings {M1 0.1 M2 0.112 M3 0.112 M4 0.112 M5 0.112 M6 0.112 M7 0.112 M8 0.112}
    set_clock_routing_rules -clock [ get_clocks * ] -net_type internal -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
    set_clock_routing_rules -clock [ get_clocks * ] -net_type root -rule clock_double_spacing -max_routing_layer M6 -min_routing_layer M3
    # Set other cts app_options?  Bufs vs Inverters, certain drive strengths.  

    # Allow delay buffers just for hold fixing
    #set_prefer -min [get_lib_cells */DELLN*HVT ]
    #set_fix_hold_options -preferred_buffer
    # fix hold on all clocks
    #set_fix_hold [all_clocks]
    # If design blows up, try turning hold fixing off. 
    # -optimize_dft is good if scan is inserted.
    # Sometimes better to separate CTS and setup/hold so any hold concerns can be seen before hold fixing.
    # Can look in the log at the beginning of clock_opt hold fixing to see if there was a large hold problem to fix.
    # set_app_option -name clock_opt.flow.skip_hold -value true

    ########################## Route related
    set_app_option -name route_opt.flow.xtalk_reduction -value true
    set_app_option -name time.si_enable_analysis -value true

    if { $top_design == "ORCA_TOP" } {
      create_voltage_area  -region {{580 0} {1000 400}} -power_domains PD_RISC_CORE
    }
} else {

    # Try reducing the search and repair iterations for now.
    setNanoRouteMode -drouteEndIteration 10

}
