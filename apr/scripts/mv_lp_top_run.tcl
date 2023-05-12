###########################################################
# Example PnR Script for UPF MV implementation project
# ECE-530 PDIC 
# Author: Venkatesh Patil
# This is skeloton script to be udpated by students 
# as needed for the project and add good comments
# to showcase your thinking and work
# 
# This script is for INNOVUS 
############################################################
# Currently this is impletented as one-script, but can be 
# Modified to source multiple scripts based on functionality
#
############################################################

# Project design specific config file
source -echo -verbose ../../${top_design}.design_config.tcl


set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
source ../scripts/innovus-get-timlibslefs.tcl


###NOTE You need to fill in the correct data < > per your design

# Design specified Variables
set init_design_netlisttype <Your Netlist type Verilog, SV, VHDL>
set init_verilog ../../syn/outputs/${top_design}.genus.vg
set init_top_cell ${top_design}
set init_pwr_net <{Power Net Names as in your design like VDD1 VSS1}>
set init_gnd_net <Ground Net Name>
set power_intent_file "../../syn/rtl/${top_design}.upf"


set_interactive_constraint_modes [all_constraint_modes -active]


if { $pad_design } {
    # subtract off the IO width if this is a pad design.  The floorplan statement automatically includes the IO border
    set margin [expr $design_io_border - 300 ]
} else {
    set margin $design_io_border
}


#### Add commands to initilize design. Read about this command and see what it is meant to do
init_design

#### Add commands to read the UPF file and Commit the UPF file (read_power_intent, commit_power_intent)
read_power_intent -1801 ${power_intent_file}
commit_power_intent -verbose


#Floorplanning Commands for your design size, shape and pin placements (floorPlan, editPin)
# floorplan dimensions
floorPlan 
# place input pins
editPin 
#Place output pins
editPin 

# Add commands to update the Power domain structures dimentions, names etc (modifyPowerDomainAttr) for each sub modules
modifyPowerDomainAttr 
modifyPowerDomainAttr 
modifyPowerDomainAttr 
modifyPowerDomainAttr 


#Generate quick floorplan (planDesign)
planDesign

###################################################################################################################
#########################################    STOP    #############################################################
#              Look at the generated floorplan and ensure all the Power domains 
#              are size correctly and within the floorplan created. Before proceeding further 
#
##################################################################################################################              




# STOP did you read the comment before


##############################################################
# Planning the Power Management Cells insertion and placement
# #############################################################

# Lets add the Power Switches into the floorplan for each domains. You can use the libriary Cell HEADX2_HVT 
# Commands to use addPowerSwitch
# Ensure they are placed nicely and spread evenly like a mesh (not too many not too less)
# Add Power Switches to each of the 4 power domains

addPowerSwitch 
addPowerSwitch 
addPowerSwitch 
addPowerSwitch 


####################################################################################
# Add the Power Structure for top and all the sub modules (domains)
# Make sure to use select_obj <pd module> to add the power structure to only that module 
# and then deselect_obj to move to the next one
#
# Command that you might use (select_obj, addRing, addStripe, sroute and deselect_obj)
####################################################################################


### Create Power structure for Top level (Vertical and Horizontal Metal layers to use M8 and M9 for top-level)  
select_obj pd_top
# command that you may use addRing, addStripe
addRing
addStripe
addStripe
deselect_obj -all

### Create Power structure for module A (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_moda
# commands that you may use addRing, addStripe, sroute
addRing
addStripe
addStripe

# Route the power nets
sroute
deselect_obj -all


### Create Power structure for module B (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_moda
# commands that you may use addRing, addStripe, sroute
addRing
addStripe
addStripe

# Route the power nets
sroute
deselect_obj -all


### Create Power structure for module C (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_moda
# commands that you may use addRing, addStripe, sroute
addRing
addStripe
addStripe

# Route the power nets
sroute
deselect_obj -all


### Create Power structure for module D (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_moda
# commands that you may use addRing, addStripe, sroute
addRing
addStripe
addStripe

# Route the power nets
sroute
deselect_obj -all


###########################################################################################
###########################          STOP           #######################################
###########################################################################################
#
#
#   CHECK all the Power Ring, Strips and connection before proceeding to next steps
#
#
#   #######################################################################################


#   Run Placement on the design 

#   Run Optimization on the design (ensure it is run pre CTS)

#   Route the entire design


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
     report_power > ../reports/${top_design}.innovus.${stage}.power.rpt
   }
   
   redirect -tee ../reports/${top_design}.innovus.$stage.density.rpt { reportDensityMap }
   summaryReport -noHtml -outfile ../reports/${top_design}.innovus.$stage.summary.rpt
}


