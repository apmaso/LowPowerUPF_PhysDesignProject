set_attribute CONTEXT_MEM boundary {{0.0000 220.9330} {0.0000 403.2120} {591.5860 403.2120} {591.5860 0.0000} {382.4280 0.0000} {382.4280 220.9330}}
#set_attribute I_CONTEXT_RAM_0_1 origin {492.8610 12.1930}
#set_attribute I_CONTEXT_RAM_0_2 origin {507.8610 12.1930}
#set_attribute I_CONTEXT_RAM_0_3 origin {492.8610 92.9350}
#set_attribute I_CONTEXT_RAM_0_4 origin {507.8610 92.9350}
#set_attribute I_CONTEXT_RAM_1_1 origin {492.8610 335.1610}
#set_attribute I_CONTEXT_RAM_1_2 origin {507.8610 335.1610}
#set_attribute I_CONTEXT_RAM_1_3 origin {396.5150 254.4190}
#set_attribute I_CONTEXT_RAM_1_4 origin {396.5150 335.1610}
#set_attribute I_CONTEXT_RAM_2_1 origin {492.8610 173.6770}
#set_attribute I_CONTEXT_RAM_2_2 origin {507.8610 173.6770}
#set_attribute I_CONTEXT_RAM_2_3 origin {492.8610 254.4190}
#set_attribute I_CONTEXT_RAM_2_4 origin {507.8610 254.4190}
#set_attribute I_CONTEXT_RAM_3_1 origin {299.4640 320.1610}
#set_attribute I_CONTEXT_RAM_3_2 origin {202.4130 254.4190}
#set_attribute I_CONTEXT_RAM_3_3 origin {299.4640 400.9030}
#set_attribute I_CONTEXT_RAM_3_4 origin {202.4130 335.1610}
#set_fixed_objects [get_cells -hierarchical design_type==macro]
read_def ../outputs/[get_attribute [current_design] name].floorplan.macros.def
create_placement_blockage -name pb_CONTEXT -type allow_buffer_only -blocked_percentage 0 -boundary {{119.6570 401.2800} {589.9120 401.2800} {589.9120 12.5700} {410.8100 12.5700} {410.8100 254.7960} {119.6570 254.7960}}
