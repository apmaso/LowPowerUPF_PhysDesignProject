####################################################
# Flow Usage
#
# cd apr/work
# icc2_shell
# set top_design xyz
# source ../scipts/icc2_shell
#
# optonal for running only certain stages of the flow: set flow "fpcr"
# f = floorplan, p = place, c = clock_opt, r = route + reports
####################################################

#####################################################
# Standard reporting for each stage
#####################################################
proc std_reporting { top_design stage } {
	report_qor > ../reports/${top_design}.$stage.qor.rpt
        report_clock_qor > ../reports/${top_design}.$stage.clock_qor.rpt
        report_constraint -nosplit -all_viol > ../reports/${top_design}.$stage.constraint.rpt
	report_timing -nosplit -delay max -input -tran -cross -sig 4 -derate -net -cap  -path full_clock_expanded -max_path 1000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.full_clock.rpt
        exec gzip -f ../reports/${top_design}.$stage.timing.max.full_clock.rpt
	report_timing -nosplit -delay max -input -tran -cross -sig 4 -derate -net -cap  -max_path 1000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.rpt
        exec gzip -f ../reports/${top_design}.$stage.timing.max.rpt
}

#####################################################
# Main Code
#####################################################
source -echo -verbose ../../$top_design.design_config.tcl
set my_lib ${top_design}_lib

if { ! [ info exists flow ] } { set flow "fpcor" }

####### STARTING INITIALIZE and FLOORPLAN #################

if { [regexp -nocase "f" $flow ] } {
    puts "######## STARTING INITIALIZE and FLOORPLAN #################"

    # Use the DCT netlist
    set dc_floorplanning 0

    source -echo -verbose ../scripts/setup2.tcl
    source -echo -verbose ../scripts/read2.tcl

    # Source before floorplan in case we want to use timing to place pins
    # Our time to load constraints is relatively small so we can do it at this spot if we want
    if { $split_constraints } {
	load_upf ../../constraints/${top_design}/top.upf

	#commit_upf
	source -echo -verbose ../../constraints/${top_design}/top.tcl
	} else {
    source -echo -verbose ../../constraints/${top_design}.sdc


	#commit_upf
	}
	
	if { [info exists design_size]} {

    initialize_floorplan -control_type core -shape R -side_length $design_size -core_offset $design_io_border
} elseif { [info exists boundary_size]} {
	initialize_floorplan -control_type core -shape L -boundary $boundary_size
}
    source -echo -verbose ../../$top_design.design_options.tcl

    if { [file exists ../scripts/${top_design}.pre.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.floorplan.tcl }

    
	source -echo -verbose ../scripts/floorplan2.tcl
    read_def ../outputs/${top_design}.floorplan.macros.def

    if { [file exists ../scripts/${top_design}.post.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.floorplan.tcl }

    save_block -as floorplan
    puts "######## FINISHED INTIIALIZE and FLOORPLAN #################"

}


######## PLACE #################
if { [regexp -nocase "p" $flow ] } {
    if { [regexp -nocase "^p" $flow ] } {
       open_lib $my_lib
       copy_block -from floorplan -to $top_design
       open_block $top_design
       source -echo -verbose ../../$top_design.design_options.tcl
    }

    if { [file exists ../scripts/${top_design}.pre.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.place.tcl }

    puts "######## STARTING PLACE #################"
    place_opt  

    if { [file exists ../scripts/${top_design}.post.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.place.tcl }

    std_reporting $top_design place2
    save_block -as place2

    #refine_opt
    #std_reporting $top_design refine
    #save_block -as refine
    puts "######## FINISHED PLACE #################"

}


######## STARTING CTS #################
if { [regexp -nocase "c" $flow ] } {
    if { [regexp "^c" $flow] } {
       open_lib $my_lib
       copy_block -from place2 -to $top_design
       open_block $top_design
       source -echo -verbose ../../$top_design.design_options.tcl
    } elseif { ![regexp "^fpc" $flow ] && ![regexp "^pc" $flow ] } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }

    puts "######## STARTING CTS #################"
    # Reduce uncertainty since we are inserting clock trees
    set_clock_uncertainty -setup 0.060 [get_clocks *]

    if { [file exists ../scripts/${top_design}.pre.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.cts.tcl }

    clock_opt -from build_clock -to route_clock

    if { [file exists ../scripts/${top_design}.post.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.cts.tcl }

    std_reporting $top_design cts2
    save_block -as cts2
    puts "######## FINISHING CTS #################"

}

######## STARTING POST-CTS OPT #################
if { [regexp -nocase "o" $flow ] } {
    if { [regexp "^o" $flow] } {
       open_lib $my_lib
       copy_block -from cts2 -to $top_design
       open_block $top_design
       source -echo -verbose ../../$top_design.design_options.tcl
    } elseif { ![regexp "^fpco" $flow ] && ![regexp "^pco" $flow ] && ![regexp "^co" $flow ]} {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }

    puts "######## STARTING POST-CTS OPT #################"
    # Reduce uncertainty since we are inserting clock trees
    set_clock_uncertainty -setup 0.060 [get_clocks *]

    if { [file exists ../scripts/${top_design}.pre.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.opt.tcl }

    clock_opt -from final_opto -to final_opto

    if { [file exists ../scripts/${top_design}.post.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.opt.tcl }

    std_reporting $top_design postcts2
    save_block -as postcts2
    puts "######## FINISHING POST-CTS OPT #################"

}

######## ROUTE_OPT #################
if { [regexp -nocase "r" $flow ] } {
    if { [regexp "^r" $flow] } {
       open_lib $my_lib
       copy_block -from postcts2 -to $top_design
       open_block $top_design
       source -echo -verbose ../../$top_design.design_options.tcl
    } elseif { ![regexp "^fpcor" $flow ] && ![regexp "^pcor" $flow ] && ![regexp "^cor" $flow ] && ![regexp "^or" $flow ] } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }
    puts "######## ROUTE_OPT #################"
    connect_pg_net -automatic

    #foreach net {VDD} { derive_pg_connection -power_net $net -power_pin $net -create_ports top}
    #foreach net {VSS} { derive_pg_connection -ground_net $net -ground_pin $net -create_ports top}

    if { [file exists ../scripts/${top_design}.pre.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.route.tcl }

    route_auto

    route_opt

    create_stdcell_fillers -lib_cells "saed32rvt_c/SHFILL128_RVT saed32rvt_c/SHFILL64_RVT saed32rvt_c/SHFILL3_RVT saed32rvt_c/SHFILL2_RVT saed32rvt_c/SHFILL1_RVT"

    if { [file exists ../scripts/${top_design}.post.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.route.tcl }


    save_block -as route2
    save_block -as $top_design

    ######## FINAL REPORTS/OUTPUTS  #################
    puts "######## FINAL REPORTS/OUTPUTS  #################"


    #set_si_options -delta_delay true -static_noise true -timing_window true -min_delta_delay true -static_noise_threshold_above_low 0.35 -static_noise_threshold_below_high 0.35 -route_xtalk_prevention true -route_xtalk_prevention_threshold 0.45

    #extract_rc -coupling_cap
    write_verilog  -compress gzip ../outputs/${top_design}.route2.vg
    write_parasitics -compress -output ../outputs/${top_design}.route2
    save_upf ../outputs/${top_design}.route2.upf
    set stage route2
    std_reporting $top_design $stage

    check_timing  > ../reports/${top_design}.$stage.check_timing.rpt
    check_design -checks pre_route_stage > ../reports/${top_design}.$stage.check_design.rpt
    check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt
    #verify_lvs -check_open_locator -check_short_locator > ../reports/${top_design}.$stage.lvs.rpt
    #verify_pg_nets > ../reports/${top_design}.$stage.pgnets.rpt
    report_clock_timing -type skew > ../reports/${top_design}.$stage.clock_tree.rpt
    puts "######## FINISHED ROUTE_OPT + FINAL REPORTS/OUTPUTS #################"
}

