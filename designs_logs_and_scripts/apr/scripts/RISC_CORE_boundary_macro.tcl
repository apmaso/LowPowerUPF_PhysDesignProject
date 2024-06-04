set_attribute RISC_CORE boundary {{0.0000 0.0000} {0.0000 220.6720} {408.2700 220.6720} {408.2700 0.0000}}
#set_attribute I_REG_FILE_REG_FILE_A_RAM origin {157.9870 216.9580}
#set_attribute I_REG_FILE_REG_FILE_B_RAM origin {139.0170 216.9580}
#set_attribute I_REG_FILE_REG_FILE_C_RAM origin {157.9870 115.0940}
#set_attribute I_REG_FILE_REG_FILE_D_RAM origin {139.0170 115.0940}
#set_fixed_objects [get_cells -hierarchical design_type==macro]
read_def ../outputs/[get_attribute [current_design] name].floorplan.macros.def
create_placement_blockage -name pb_RISC -type allow_buffer_only -blocked_percentage 0 -boundary {{1.6720 216.9580} {293.6600 216.9580} {293.6600 26.1320} {1.6720 26.1320}}
