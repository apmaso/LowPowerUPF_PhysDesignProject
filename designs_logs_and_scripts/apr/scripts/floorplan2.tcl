

# Do some extra setting up of the IO ring if we are a pad_design
if { $pad_design } {
  source -echo -verbose ../scripts/floorplan-ios2.tcl
}


#derive_pg_connection -tie
connect_pg_net -automatic


puts "Starting FP Placement: ..."
#set_keepout_margin  -type hard -all_macros -outer {2 2 2 2}

read_def -exclude { diearea } ../outputs/${top_design}.floorplan.macros.def
set_attribute [get_cells -hier -filter "is_hard_macro==true" ] physical_status fixed
set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
place_pins -self

# There are layers through M9.  M8/M9 are large.  Maybe use those for power.  Use CTS and signal routing below that?
# ORCA example uses M7/M8 for power.  Leave M9 open.  M9 for Bump hookup or something?  Why leave it open?
create_pg_mesh_pattern mesh_pat -layers {  {{vertical_layer: M8} {width: 4} {spacing: interleaving} {pitch: 16}}   \
    {{horizontal_layer: M7} {width: 2}        {spacing: interleaving} {pitch: 8}}  }
# Orca does 0.350 width VSS two stripes, then 0.7u VDD stripe.  Repeating 16u. for now, do something simpler 
create_pg_mesh_pattern lmesh_pat -layers {  {{vertical_layer: M2} {width: 0.7} {spacing: interleaving} {pitch: 16}}  } 
create_pg_std_cell_conn_pattern rail_pat -layers {M1} -rail_width {0.06 0.06}
#   -via_rule {       {{layers: M6} {layers: M7} {via_master: default}}        {{layers: M8} {layers: M7} {via_master: VIA78_3x3}}}
set_pg_strategy mesh_strat -core -extension {{stop:outermost_ring}} -pattern {{pattern:mesh_pat } { nets:{VDD VSS} } } 
set_pg_strategy rail_strat -core -pattern {{pattern:rail_pat } { nets:{VDD VSS} } } 
set_pg_strategy lmesh_strat -core -pattern {{pattern:lmesh_pat } { nets:{VDD VSS} } } 
compile_pg -strategies {mesh_strat rail_strat lmesh_strat}
set_boundary_cell_rules -left_boundary_cell [get_lib_cell */DCAP_HVT]
set_boundary_cell_rules -right_boundary_cell [get_lib_cell */DCAP_HVT]
# Tap Cells are usually needed, but they are not in this library. create_tap_cells
compile_boundary_cells

# This is experimenting with ring constraints for SRAM in ICC1
#set_fp_block_ring_constraints -add -horizontal_layer M5 -vertical_layer M6 -horizontal_width 2 -vertical_width 2 -horizontal_off 0.604 \
 -vertical_off 0.604 -block_type master -nets {VDD VSS } -block {  SRAM1RW64x8 }


#set_virtual_pad -net VDD -coordinate { 300 300 }
#set_virtual_pad -net VDD -coordinate { 900 300 }
#set_virtual_pad -net VDD -coordinate { 900 900 }
#set_virtual_pad -net VDD -coordinate { 300 900 }

#set_virtual_pad -net VSS -coordinate { 300 300 }
#set_virtual_pad -net VSS -coordinate { 900 300 }
#set_virtual_pad -net VSS -coordinate { 900 900 }
#set_virtual_pad -net VSS -coordinate { 300 900 }

# to check the quality of the PG grid in ICC2:
#analyze_power_plan

#ICC1: preroute_standard_cells
#ICC2:
#create_pg_std_cell_conn_pattern;
#set_pg_strategy; compile_pg

puts "preroute_instances ..."
#ICC1: preroute_instances
#ICC2
#create_pg_macro_conn_pattern;
#set_pg_strategy; compile_pg


# verify_pg_nets

#write_floorplan  -create_terminal -placement { io hard_macro } -row -track -no_placement_blockage -no_bound -no_plan_group -no_voltage_area -no_route_guide fp.tcl

puts "Logfile message: writing def file now..."

write_def -compress gzip -include {rows_tracks vias specialnets nets cells ports blockages } -cell_types {macro pad corner} "../outputs/${top_design}.floorplan.def"


write_def -include {cells ports blockages } -cell_types {macro pad corner} "../outputs/${top_design}.floorplan.macros.def"

puts "Logfile message: writing def file completed ..."


