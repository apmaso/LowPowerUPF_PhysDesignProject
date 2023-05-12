set_attribute SDRAM_TOP boundary {{0.0000 0.0000} {0.0000 336.6900} {382.4280 336.6900} {382.4280 240.5080} {591.5860 240.5080} {591.5860 0.0000}}
#set_attribute I_SDRAM_READ_FIFO_SD_FIFO_RAM_0 origin {459.9530 110.5780}
#set_attribute I_SDRAM_READ_FIFO_SD_FIFO_RAM_1 origin {459.9530 0.6700}
#set_attribute I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_0 origin {313.5470 112.2690}
#set_attribute I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_1 origin {444.9530 94.9080}
#set_fixed_objects [get_cells -hierarchical design_type==macro]
read_def ../outputs/[get_attribute [current_design] name].floorplan.macros.def
create_placement_blockage -name pb_SDRAM -type allow_buffer_only -blocked_percentage 0 -boundary {{311.6660 1.6720} {311.6660 206.8970} {589.4780 206.8970} {589.4780 1.6720}}
