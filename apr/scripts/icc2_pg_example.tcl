#https://solvnet.synopsys.com/dow_retrieve/Q-2019.12/dg/icc2olh/Default.htm#icc2dp/fcbdp/performing_power_planning/pattern_based_power_network_routing_example.htm%3FTocPath%3DIC%2520Compiler%2520II%2520Documents%7CIC%2520Compiler%2520II%2520Design%2520Planning%2520User%2520Guide%252C%2520version%2520Q-2019.12%7CPerforming%2520Power%2520Planning%7C_____13
# Create the power and ground nets and connections
create_net -power VDD
create_net -ground VSS
connect_pg_net -net VDD [get_pins -physical_context *VDD]
connect_pg_net -net VSS [get_pins -physical_context *VSS]

# Create the power and ground ring pattern
create_pg_ring_pattern ring_pattern -horizontal_layer @hlayer \
   -horizontal_width {@hwidth} -horizontal_spacing {@hspace} \
   -vertical_layer @vlayer -vertical_width {@vwidth} \
   -vertical_spacing {@vspace} -corner_bridge @cbridge \
   -parameters {hlayer hwidth hspace
                vlayer vwidth vspace cbridge}

# Set the ring strategy to apply the ring_pattern
# pattern to the core area and set the width
# and spacing parameters
set_pg_strategy ring_strat -core \
   -pattern {{name: ring_pattern} {nets: {VDD VSS}}
             {offset: {3 3}} {parameters: {M7 10 2 M8 10 2 true}}} \
   -extension {{stop: design_boundary}}

# Create the ring in the design
compile_pg -strategies ring_strat


# Define a new via rule, VIA78_3x3, for the power mesh
set_pg_via_master_rule VIA78_3x3 -contact_code VIA78 \
   -via_array_dimension {3 3}

# Create the power and ground ring mesh pattern
create_pg_mesh_pattern mesh_pattern -layers {
   {{vertical_layer: M8} {width: 5}
       {spacing: interleaving} {pitch: 32}}
   {{vertical_layer: M6} {width: 2}
       {spacing: interleaving} {pitch: 32}}
   {{horizontal_layer: M7} {width: 5}
       {spacing: interleaving} {pitch: 28.8}}} \
   -via_rule {
       {{layers: M6} {layers: M7} {via_master: default}}
       {{layers: M8} {layers: M7} {via_master: VIA78_3x3}}}

# Set the mesh strategy to apply the mesh_pattern
# pattern to the core area. Extend the mesh
# to the outermost ring
set_pg_strategy mesh_strat -core -pattern {{pattern: mesh_pattern}
   {nets: {VDD VSS}}} -extension {{stop: outermost_ring}}

# Create the mesh in the design
compile_pg -strategies mesh_strat

# Create the power and ground ring mesh pattern
create_pg_mesh_pattern mesh_pattern -layers {
   {{vertical_layer: M8} {width: @width8}
       {spacing: interleaving} {pitch: 32}}
   {{vertical_layer: M6} {width: @width6}
       {spacing: interleaving} {pitch: 32}}
   {{horizontal_layer: M7} {width: @width7}
       {spacing: interleaving} {pitch: 28.8}}} \
   -via_rule {
       {{layers: M6} {layers: M7} {via_master: default}}
       {{layers: M8} {layers: M7} {via_master: VIA78_3x3}}} \
   -parameters {width6 width7 width8}

# Set the mesh strategy to apply the mesh_pattern
# pattern to the core area. Extend the mesh
# to the outermost ring
set_pg_strategy mesh_strat -core -pattern {
   {pattern: mesh_pattern} {nets: {VDD VSS}}
      {parameters: {32 28.8 32}}} \
   -extension {{stop: outermost_ring}}

# Create the mesh pattern in the design
compile_pg -strategies mesh_strat

# Create the connection pattern for macro
# power and ground pins
create_pg_macro_conn_pattern macro_pattern \
   -pin_conn_type scattered_pin

# Set the macro connection strategy to
# apply the macro_pattern pattern to
# the core area
set_pg_strategy macro_strat -core \
   -pattern {{pattern: macro_pattern}
             {nets: {VDD VSS}}}

# Connect the power and ground macro pins
compile_pg -strategies macro_strat

# Create a new 1x2 via
set_pg_via_master_rule via16_1x2 -via_array_dimension {1 2}

# Create the power and ground rail pattern
create_pg_std_cell_conn_pattern rail_pattern -layers {M1}

# Set the power and ground rail strategy
# to apply the rail_pattern pattern to the
# core area
set_pg_strategy rail_strat -core \
   -pattern {{pattern: rail_pattern} {nets: VDD VSS}}

# Define a via strategy to insert via16_1x2 vias
# between existing straps and the new power rails
# specified by rail_strat strategy on the M6 layer
set_pg_strategy_via_rule rail_rule -via_rule {
    {{{existing: strap} {layers: M6}}
      {strategies: rail_strat} {via_master: via16_1x2}}
    {{intersection: undefined} {via_master: nil}}}

# Insert the new rails
compile_pg -strategies rail_strat -via_rule rail_rule
