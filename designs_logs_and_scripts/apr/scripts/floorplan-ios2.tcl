
if { [ sizeof_coll [ get_cell -quiet io_* ] ] == 0 } {
 source -echo -verbose ../scripts/add_ios.tcl
}
# Move this outside the if statement, and make it configurable through a variable?
create_io_ring -name outer_ring -corner_height 300
get_io_guides
create_net -power VDD
# Maybe try non-power net so that it doesn't complain about multiple powers defined and no UPF?
#create_net -power VDDIO
create_net -ground VSS
#create_net -ground VSSIO

add_to_io_guide outer_ring.left [get_cells -phys { io_l_*  } ]
add_to_io_guide outer_ring.right [get_cells -phys { io_r_*  } ]
add_to_io_guide outer_ring.bottom [get_cells -phys { io_b_*  } ]
add_to_io_guide outer_ring.top [get_cells -phys { io_t_*  } ]
set_power_io_constraints -io_guide_object [get_io_guide { *.left *.right} ] { {reference:VDD_EW} {prefix:VDD} {ratio:5} {connect: {VDD VDD } { VSS VSS} }  }
set_power_io_constraints -io_guide_object [get_io_guide { *.top *.bottom} ] { {reference:VDD_NS} {prefix:VDD} {ratio:5} {connect:  {VDD VDD } { VSS VSS} }  }
remove_cell { io_s* io_n* io_w* io_e*}
#	create_io_filler_cells -prefix filler_ -reference_cells [ list [ list [ get_attribute [get_lib_cells */FILLER?* ] name ] ] ]

# Library does not have the corner cell of design_type corner.  Try changing it and retry the create_io_corner
set_app_option -name design.enable_lib_cell_editing -value mutable
set_attribute [ get_lib_cell */CAPCORNER ] design_type corner
#       create_io_corner_cell   -reference_cell CAPCORNER {outer_ring.left outer_ring.bottom}
place_io -io_guide [get_io_guides * ]
check_io_placement -io_guides [ get_io_guides * ]


# done inside add_ios.tcl right now
#create_cell sram_example SRAM1RW64x8

set_attribute -objects [ get_cells -phys io_*  ] -name physical_status -value fixed
