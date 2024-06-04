# if before place, place the cells around the design, but don't waste time with it
#create_placement -effort very_low
# Insert buffers on SRAM output pins.  The only timing available for SRAM is at a different voltage than std cells.
# This is causing a multivoltage situation and preventing buffers from being inserted automatically, 
# so insert manually for now.  Try to address the multi-voltage problem better somehow.
set bufs [ insert_buffer -new_cell_names sram_fixcell -new_net_names sram_fixnet [ get_pins -of_obj [get_cells -hier -filter "is_hard_macro==true" ] -filter "direction==out&&net_name!~*UNCONNECTED*" ] -lib_cell NBUFFX16_LVT ]
legalize_placement -cells $bufs
# we want this cell to always be here, but can be resized.
set_size_only $bufs true
# if it is resized, we want it to be legalized.  But not moved far.
set_placement_status legalize_only $bufs

