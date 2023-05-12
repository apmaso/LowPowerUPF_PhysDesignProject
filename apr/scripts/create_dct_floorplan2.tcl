#####################################################
# Main Code
####################################################
source -echo -verbose ../../${top_design}.design_config.tcl

if { ![ info exists dc_floorplanning ] } {
   set dc_floorplanning 1
}
set my_lib ${top_design}_fp_lib
source -echo -verbose ../scripts/setup2.tcl
source -echo -verbose ../scripts/read2.tcl

# Source before floorplan in case we want to use timing to place pins
# Our time to load constraints is relatively small so we can do it at this spot if we want
source -echo -verbose ../../constraints/${top_design}.sdc

initialize_floorplan -control_type core -shape R -side_length $design_size -core_offset $design_io_border

source -echo -verbose ../../${top_design}.design_options.tcl

# Use the def saved when planning macro placement in apr area.
set def ../outputs/${top_design}.floorplan.macros.def 
source -echo -verbose ../scripts/floorplan2.tcl
#read_def ../outputs/${top_design}.floorplan.def

