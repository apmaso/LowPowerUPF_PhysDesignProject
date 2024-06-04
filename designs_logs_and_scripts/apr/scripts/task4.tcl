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



