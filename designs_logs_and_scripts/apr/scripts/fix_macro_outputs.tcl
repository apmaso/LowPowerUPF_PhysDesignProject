remove_cells xofiller*
insert_buffer [ get_pins -of_obj [get_cells -hier -filter "is_hard_macro==true" ] -filter "direction==out&&max_transition>0.5&&net_name!~*UNCONNECTED*" ] -lib_cell NBUFFX16_LVT
legalize_placement
route_eco

