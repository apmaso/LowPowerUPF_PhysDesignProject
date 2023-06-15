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
set init_design_netlisttype Verilog
set init_verilog ../../syn/outputs/${top_design}.genus.vg
set init_top_cell ${top_design}
set init_pwr_net {VDDH VDDL}
set init_gnd_net VSS 
set power_intent_file "../../syn/rtl/${top_design}.upf"

# Sourcing mmmc.sdc file for our design mv_lp_top
source ../../constraints/${top_design}.mmmc.sdc

set_interactive_constraint_modes [all_constraint_modes -active]

if { $pad_design } {
    # subtract off the IO width if this is a pad design.  The floorplan statement automatically includes the IO border
    # design_io_border is set to 10 so this should be negative. But it matches the files from lab 2 so I am leaving it for now 
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
floorPlan -s [lindex $design_size 0] [lindex $design_size 1] $margin $margin $margin $margin -flip s -coreMarginsBy io 


# Removing this for now... Copied Pin placement commands from ORCA_TOP tcl file and modified offset to fit in our floorplan

#Cadence method.  Not floating with these statements
#Isolated all input ports and then all output ports
setPinAssignMode -pinEditInBatch true
set input_ports [ all_inputs ]
set output_ports [ all_outputs ]
# put the two collections on to two layers of ports
# Leaving the ports on different layers for now... Inputs on left and outputs on the right
editPin -edge 0 -pin [get_attribute $input_ports full_name ] -layer M6 -spreadDirection counterclockwise -spreadType START -offsetStart 25 -spacing 10 -unit MICRON -fixedPin 1
editPin -edge 2 -pin [get_attribute $output_ports full_name ] -layer M6 -spreadDirection counterclockwise -spreadType START -offsetStart 20 -spacing 8 -unit MICRON -fixedPin 1
setPinAssignMode -pinEditInBatch false



# Add commands to update the Power domain structures dimentions, names etc (modifyPowerDomainAttr) for each sub modules

# moda => modd starts LL and goes clockwise, UL, UR, LR

# modifyPowerDomainAttr pd_top              I don't think I want one for pd_top
modifyPowerDomainAttr pd_moda -box 30 30 50 50 -minGaps {5 5 5 5}
modifyPowerDomainAttr pd_modb -box 30 70 50 90 -minGaps {5 5 5 5}
modifyPowerDomainAttr pd_modc -box 70 70 90 90 -minGaps {5 5 5 5}
modifyPowerDomainAttr pd_modd -box 70 30 90 50 -minGaps {5 5 5 5}


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

addPowerSwitch -powerDomain pd_moda -globalSwitchCellName HEADX2_HVT -1801PowerSwitchRuleName pg_moda_ps -column -horizontalPitch 5 -noDoubleHeightCheck -checkerBoard -enableNetIn sleep_moda
addPowerSwitch -powerDomain pd_modb -globalSwitchCellName HEADX2_HVT -1801PowerSwitchRuleName pg_modb_ps -column -horizontalPitch 5 -noDoubleHeightCheck -checkerBoard -enableNetIn sleep_modb
addPowerSwitch -powerDomain pd_modc -globalSwitchCellName HEADX2_HVT -1801PowerSwitchRuleName pg_modc_ps -column -horizontalPitch 5 -noDoubleHeightCheck -checkerBoard -enableNetIn sleep_modc
addPowerSwitch -powerDomain pd_modd -globalSwitchCellName HEADX2_HVT -1801PowerSwitchRuleName pg_modd_ps -column -horizontalPitch 5 -noDoubleHeightCheck -checkerBoard -enableNetIn sleep_modd

####################################################################################
# Add the Power Structure for top and all the sub modules (domains)
# Make sure to use select_obj <pd module> to add the power structure to only that module 
# and then deselect_obj to move to the next one
#
# Command that you might use (select_obj, addRing, addStripe, sroute and deselect_obj)
####################################################################################

# Prof Venkastesh's suggestions for our power routing issues
globalNetConnect VSS -type pgpin -pin VSS -all
globalNetConnect VDDH -type pgpin -pin VDDH -all
globalNetConnect VDDL -type pgpin -pin VDDL -all
globalNetConnect VDDH_gated_moda -type pgpin -pin VDD -powerDomain pd_moda
globalNetConnect VDDH -type pgpin -pin VDD -instanceBasename *moda*HEAD*
globalNetConnect VDDH_gated_moda -type pgpin -pin VDDG -instanceBasename *moda*HEAD* 

globalNetConnect VDDH_gated_modb -type pgpin -pin VDD -powerDomain pd_modb
globalNetConnect VDDH -type pgpin -pin VDD -instanceBasename *modb*HEAD*
globalNetConnect VDDH_gated_modb -type pgpin -pin VDDG -instanceBasename *modb*HEAD* 

globalNetConnect VDDL_gated_modc -type pgpin -pin VDD -powerDomain pd_modc
globalNetConnect VDDL -type pgpin -pin VDD -instanceBasename *modc*HEAD*
globalNetConnect VDDL_gated_modc -type pgpin -pin VDDG -instanceBasename *modc*HEAD* 

globalNetConnect VDDL_gated_modd -type pgpin -pin VDD -powerDomain pd_modd
globalNetConnect VDDL -type pgpin -pin VDD -instanceBasename *modd*HEAD*
globalNetConnect VDDL_gated_modd -type pgpin -pin VDDG -instanceBasename *modd*HEAD* 


#Create Power structure for Top level (Vertical and Horizontal Metal layers to use M8 and M9 for top-level)  
select_obj pd_top
## command that you may use addRing, addStripe
addRing -type core_rings -nets {VDDH VDDL VSS} -layer {top M9 left M8 bottom M9 right M8} -offset 2 -width 1 -spacing 1 
addStripe -nets {VDDH VDDL VSS} -direction vertical -layer M8 -width 1 -start_offset 3 -spacing 3 -set_to_set_distance 10 -power_domains {pd_top}
addStripe -nets {VDDH VDDL VSS} -direction horizontal -layer M9 -width 1 -start_offset 3 -spacing 3 -set_to_set_distance 10 -power_domains {pd_top}

sroute -nets {VSS VDDH}
sroute -nets {VSS VDDL}

deselect_obj -all

###### Create Power structure for module A (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_moda
#### commands that you may use addRing, addStripe, sroute
addRing -type block_rings -nets {VDDH VSS} -layer {top M5 left M6 bottom M5 right M6} -offset 1 -width 1 -spacing 1 -around power_domain
addStripe -nets {VDDH VSS} -direction vertical -layer M4 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_moda}
addStripe -nets {VDDH_gated_moda VSS} -direction horizontal -layer M3 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_moda}

sroute -connect secondaryPowerPin -powerDomains pd_moda

deselect_obj -all

###### Create Power structure for module A (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_modb
#### commands that you may use addRing, addStripe, sroute
addRing -type block_rings -nets {VDDH VSS} -layer {top M5 left M6 bottom M5 right M6} -offset 1 -width 1 -spacing 1 -around power_domain
addStripe -nets {VDDH VSS} -direction vertical -layer M4 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modb}
addStripe -nets {VDDH_gated_modb VSS} -direction horizontal -layer M3 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modb}

sroute -connect secondaryPowerPin -powerDomains pd_modb

deselect_obj -all

###### Create Power structure for module A (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_modc
#### commands that you may use addRing, addStripe, sroute
addRing -type block_rings -nets {VDDL VSS} -layer {top M5 left M6 bottom M5 right M6} -offset 1 -width 1 -spacing 1 -around power_domain
addStripe -nets {VDDL VSS} -direction vertical -layer M4 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modc}
addStripe -nets {VDDL_gated_modc VSS} -direction horizontal -layer M3 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modc}

sroute -connect secondaryPowerPin -powerDomains pd_modc

deselect_obj -all

###### Create Power structure for module A (Metal layers for ring M6 , M5 and strip M4, M3)
select_obj pd_modd
#### commands that you may use addRing, addStripe, sroute
addRing -type block_rings -nets {VDDL VSS} -layer {top M5 left M6 bottom M5 right M6} -offset 1 -width 1 -spacing 1 -around power_domain
addStripe -nets {VDDL VSS} -direction vertical -layer M4 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modd}
addStripe -nets {VDDL_gated_modd VSS} -direction horizontal -layer M3 -width 0.2 -start_offset 1 -spacing 1 -set_to_set_distance 4 -power_domains {pd_modd}

sroute -connect secondaryPowerPin -powerDomains pd_modd

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
#   Using the command place_opt_design since this command is for pre-CTS by default
#
place_opt_design

#   Run Optimization on the design (ensure it is run pre CTS)
#   We believe that we no longer need this command since the previous command
#   also optimizes the design and is for pre-CTS by default as well
   
#optDesign -preCTS

#   Route the entire design

routeDesign

#proc innovus_reporting { stage postcts postroute } {
#global top_design
#   if { !$postcts && !$postroute } {
#     redirect -tee ../reports/$top_design.innovus.$stage.congestion.2d.rpt { reportCongestion -hotSpot -overflow -includeBlockage }
#     redirect -tee ../reports/$top_design.innovus.$stage.congestion.3d.rpt { reportCongestion -hotSpot -overflow -includeBlockage -3d }
#    timeDesign -preCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
#   }
#   if { $postcts } {
#     report_ccopt_skew_groups -summary -file ../reports/$top_design.innovus.$stage.ccopt_skew_groups.rpt
#     report_ccopt_clock_trees -summary -file ../reports/$top_design.innovus.$stage.ccopt_clock_trees.rpt
#     if { ! $postroute } {
#        timeDesign -postCTS -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
#        timeDesign -postCTS -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
#     }
#   }
#   if { $postroute } {
#     verify_drc -limit 100000 -report ../reports/$top_design.innovus.$stage.drc.all.rpt
#     verify_drc -limit 100000 -check_only regular -report ../reports/$top_design.innovus.$stage.drc.regular.rpt
#     verifyConnectivity -error 100000 -noAntenna -report ../reports/$top_design.innovus.$stage.connectivity.rpt 
#     timeDesign -postRoute -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
#     timeDesign -postRoute -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
#     timeDesign -postRoute -hold -prefix $stage -outDir ../reports/${top_design}.innovus -expandedViews
#     timeDesign -postRoute -hold -si -prefix ${stage}_si -outDir ../reports/${top_design}.innovus -expandedViews
#     report_power > ../reports/${top_design}.innovus.${stage}.power.rpt
#   }
   
#   redirect -tee ../reports/${top_design}.innovus.$stage.density.rpt { reportDensityMap }
#   summaryReport -noHtml -outfile ../reports/${top_design}.innovus.$stage.summary.rpt
#}


