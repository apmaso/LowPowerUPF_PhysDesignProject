
######
## WARNING!!!
## you must start innovus from the INNOVUS area and not the GENUS area
## /pkgs/cadence/2019-03/INNOVUS171/bin/innovus
## not /pkgs/cadence/2019-03/GENUS171/bin/innovus
##
## You need this as well in your .profile to get your libraries loaded correctly
## LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/pkgs/cadence/2019-03/SSV171/tools.lnx86/lib/64bit/"
## You might see this error otherwise.
## **ERROR: (IMPCCOPT-3092):	Couldn't load external LP solver library. Error returned:

proc innovus_reporting { stage postcts postroute } {
global top_design
   if { !$postcts && !$postroute } {
     redirect -tee ../reports/$top_design.innovus.$stage.congestion.2d.rpt { reportCongestion -hotSpot -overflow -includeBlockage }
     redirect -tee ../reports/$top_design.innovus.$stage.congestion.3d.rpt { reportCongestion -hotSpot -overflow -includeBlockage -3d }
    timeDesign -preCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
   }
   if { $postcts } {
     report_ccopt_skew_groups -summary -file ../reports/$top_design.innovus.$stage.ccopt_skew_groups.rpt
     report_ccopt_clock_trees -summary -file ../reports/$top_design.innovus.$stage.ccopt_clock_trees.rpt
     if { ! $postroute } {
        timeDesign -postCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
        timeDesign -postCTS -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     }
   }
   if { $postroute } {
     verify_drc -limit 100000 -report ../reports/$top_design.innovus.$stage.drc.all.rpt
     verify_drc -limit 100000 -check_only regular -report ../reports/$top_design.innovus.$stage.drc.regular.rpt
     verifyConnectivity -error 100000 -noAntenna -report ../reports/$top_design.innovus.$stage.connectivity.rpt 
     timeDesign -postRoute -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
     timeDesign -postRoute -hold -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
     #report_power > ../reports/${top_design}.ROUTE_power_from_innovus_tcl.rpt
     #report_area > ../reports/${top_design}.ROUTE_area_from_innovus_tcl.rpt
     report_power > ../reports/${top_design}.innovus.${stage}.power.rpt
   }
   
   redirect -tee ../reports/${top_design}.innovus.$stage.density.rpt { reportDensityMap }
   summaryReport -noHtml -outfile ../reports/${top_design}.innovus.$stage.summary.rpt
}

source -echo -verbose ../../$top_design.design_config.tcl

set designs [get_db designs * ]
if { $designs != "" } {
  delete_obj $designs
}

if { ! [ info exists flow ] } { set flow "fpcr" }

####### STARTING INITIALIZE and FLOORPLAN #################
if { [regexp -nocase "f" $flow ] } {
    puts "######## STARTING INITIALIZE and FLOORPLAN #################"

    set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default

    source ../scripts/innovus-get-timlibslefs.tcl
    source ../../constraints/${top_design}.mmmc.sdc

    set init_design_netlisttype Verilog
    set init_verilog ../../syn/outputs/${top_design}.genus_phys.vg
    set init_top_cell $top_design
    set init_pwr_net VDD
    set init_gnd_net VSS


    init_design

   if { [file exists ../scripts/${top_design}.pre.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.floorplan.tcl }

    defIn "../outputs/${top_design}.floorplan.innovus.def" 
    #defIn "../outputs/${top_design}.floorplan.innovus.macros.def" 

    add_tracks -honor_pitch

   if { [file exists ../scripts/${top_design}.post.floorplan.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.floorplan.tcl }


    if { $enable_dft == 1} {
    	echo READING SCANDEF
   	 #defIn ../../syn/outputs/${top_design}.dct.scan.def
    	defIn ../../syn/outputs/${top_design}.genus.scan.def
    	echo FINISHED READING SCANDEF

       # Source SDC file with DFT constraints. 
       #source ../../syn/outputs/${top_design}.genus.sdc
    }

    #source ../../${top_design}.design_options.tcl
    source ../../${top_design}.design_options.tcl
    # Add dcap boundary cells on the left and right side of design and macros
    #set_boundary_cell_rules -left_boundary_cell [get_lib_cell */DCAP_HVT]
    #set_boundary_cell_rules -right_boundary_cell [get_lib_cell */DCAP_HVT]
    # Tap Cells are usually needed, but they are not in this library. create_tap_cells
    #compile_boundary_cells

    #loadDefFile ../../apr/outputs/${top_design}.floorplan.def

    # Setting the interactive_constrint mode overwrites constraints applied 
    # for each scenario. 
    set_interactive_constraint_modes [all_constraint_modes -active]
    source ../../constraints/$top_design.sdc

    setDontUse *DELLN* true

    createBasicPathGroups -expanded

    saveDesign ${top_design}_floorplan.innovus

    #report_power > ../reports/${top_design}.FLRPLN_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.FLRPLN_area_from_innovus_tcl.rpt

    puts "######## FINISHED INTIIALIZE and FLOORPLAN #################"
}

######## PLACE #################
if { [regexp -nocase "p" $flow ] } {
    if { ![regexp -nocase "f" $flow ] } {
       restoreDesign ${top_design}_floorplan.innovus.dat ${top_design}
    }
    puts "######## STARTING PLACE #################"

setOptMode -usefulSkew false
setOptMode -usefulSkewCCOpt none
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false

   if { [file exists ../scripts/${top_design}.pre.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.place.tcl }
    place_opt_design
   if { [file exists ../scripts/${top_design}.post.place.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.place.tcl }

    set stage place
    innovus_reporting $stage 0 0    
    
    saveDesign ${top_design}_place.innovus

    #report_power > ../reports/${top_design}.$stage.PLACE_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.$stage.PLACE_area_from_innovus_tcl.rpt

    puts "######## FINISHED PLACE #################"
}

######## STARTING CLOCK_OPT #################
if { [regexp -nocase "c" $flow ] } {
    if { ![regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ]  } {
       restoreDesign ${top_design}_place.innovus.dat ${top_design}
    } elseif { [regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ] } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }


setDesignMode -process 28

setOptMode -usefulSkew false
setOptMode -usefulSkewCCOpt none
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false
set_ccopt_property update_io_latency false
# /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/CCOpt_Properties.html
# https://support.cadence.com/apex/techpubDocViewerPage?path=innovusUG/innovusUG21.13/CCOpt_Properties.html
# /pkgs/cadence/2020-11/INNOVUS191/doc/innovusUG/Clock_Tree_Synthesis.html
#set_ccopt_property target_skew 0.1 
#set_ccopt_property use_inverters true
#set_ccopt_property inverter_cells {}
#set_ccopt_property buffer_cells { }
#set ccopt_property clock_gating_cells { }
#set_ccopt_property target_max_trans 0.1
#set_ccopt_property insertion_delay 0.5
#set_ccopt_property max_fanout 50
#set_ccopt_property target_max_capacitance 0.1
set_ccopt_property routing_top_min_fanout 10000
#add_ndr -name CTS_RULE -spacing {M1 0.1 M2:M8 0.112 }
add_ndr -name CTS_RULE -spacing  {M1 0.1 M2:M8 0.112 } -width_multiplier {M3:M8 2 } -generate_via
# Main power grid is currently on M7/M8
create_route_type -name top_type -non_default_rule CTS_RULE -top_preferred_layer M8 -bottom_preferred_layer M7
set_ccopt_property -net_type top route_type top_type
create_route_type -name trunk_type -non_default_rule CTS_RULE -top_preferred_layer M6 -bottom_preferred_layer M5
set_ccopt_property -net_type trunk route_type trunk_type
#create_route_type -name leaf_type -non_default_rule CTS_RULE -top_preferred_layer M7 -bottom_preferred_layer M6
#set_ccopt_property -net_type leaf route_type leaf_type

setNanoRouteMode -droutePostRouteSpreadWire false

   if { [file exists ../scripts/${top_design}.pre.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.cts.tcl }
    ccopt_design
   if { [file exists ../scripts/${top_design}.post.cts.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.cts.tcl }

    setAnalysisMode -analysisType onChipVariation
    setAnalysisMode -cppr both

# IO clock latencies are not adjusted as desired.
#update_io_latency
#May have to change earlier command to ccopt_design -cts
# Or reset to ideal mode first, then update_io_latency, then set_propagated_clock again.
# https://support.cadence.com/apex/ArticleAttachmentPortal?id=a1O0V000007MokSUAS&pageName=ArticleContent
# Or fix the problem with set_ccopt_propert update_io_latency true

   if { [file exists ../scripts/${top_design}.pre.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.opt.tcl }
    optDesign -postCTS -hold
   if { [file exists ../scripts/${top_design}.post.opt.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.opt.tcl }
    #opt_design -post_cts -hold

    set stage postcts

    innovus_reporting $stage 1 0    
    saveDesign ${top_design}_postcts.innovus

    #report_power > ../reports/${top_design}.$stage.CLOCK_power_from_innovus_tcl.rpt
    #report_area > ../reports/${top_design}.$stage.CLOCK_area_from_innovus_tcl.rpt

    puts "######## FINISHING CLOCK_OPT #################"

}

######## ROUTE_OPT #################
if { [regexp -nocase "r" $flow ] } {
    if { ![regexp -nocase "f" $flow ] && ![regexp -nocase "p" $flow ] && ![regexp -nocase "c" $flow ] } {
       restoreDesign ${top_design}_postcts.innovus.dat ${top_design}
    } elseif { ([regexp -nocase "f" $flow ] && ! [regexp -nocase "p" $flow ] ) ||
               ([regexp -nocase "f" $flow ] && ! [regexp -nocase "c" $flow ] ) ||
               ([regexp -nocase "p" $flow ] && ! [regexp -nocase "c" $flow ] )  } {
       puts "FLOW ERROR: You are trying to run route and skipping some but not all earlier stages"
       return -level 1 
    }
    puts "######## ROUTE_OPT #################"

setOptMode -usefulSkew false
setOptMode -usefulSkewCCOpt none
setOptMode -usefulSkewPostRoute false
setOptMode -usefulSkewPreCTS false

setNanoRouteMode -droutePostRouteSpreadWire false
#setNanoRouteMode -routeTopRoutingLayer 7
#setNanoRouteMode -routeBottomRoutingLayer 2

   if { [file exists ../scripts/${top_design}.pre.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.pre.route.tcl }
    routeDesign
   if { [file exists ../scripts/${top_design}.post.route.tcl ] } { source -echo -verbose ../scripts/${top_design}.post.route.tcl }
    #route_design

# Should add tie hi/lo
#setTieHiLoMode -maxFanout 20 -maxDistance 50 -cell {TIEH_RVT TIEL_RVT}
#addTieHiLo

    optDesign -postRoute -setup -hold
    #opt_design -post_route -setup -hold

   globalNetConnect VDD -type pgpin -pin VDD -inst *
   globalNetConnect VSS -type pgpin -pin VSS -inst *
   # Should add other power nets if multivoltage

    saveDesign ${top_design}_route.innovus

    ######## FINAL REPORTS/OUTPUTS  #################
    puts "######## FINAL REPORTS/OUTPUTS  #################"

    # output reports
    set stage route
    innovus_reporting $stage 1  1   
    

    # output netlist.  Look in the Saved Design Directory for the netlist
    #write_hdl $top_design > ../outputs/${top_design}.$stage.vg
    saveNetlist ../outputs/${top_design}.$stage.innovus.vg 
    # there is not a command to just write the spef with a specific name, so use the Innovus command, then copy the file.
    saveModel -spef -dir ${top_design}_route_spef
    foreach i [glob ../outputs/${top_design}*innovus*.spef.gz] { file delete $i  }
    foreach i [glob ${top_design}_route_spef/*.spef.gz] { 
       set newfile [regsub ${top_design}_ [file tail $i] ${top_design}.route.innovus. ]
       file copy $i  ../outputs/$newfile 
    }

    puts "######## FINISHED ROUTE_OPT + FINAL REPORTS/OUTPUTS #################"
}

