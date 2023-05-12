set_attribute PCI_TOP boundary {{0.0000 0.0000} {0.0000 423.0160} {197.6900 423.0160} {197.6900 190.0000} {408.2700 190.0000} {408.2700 0.0000}}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_1 origin {2.5400 196.4770}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_2 origin {72.1450 196.4770}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_3 origin {2.5400 211.4770}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_4 origin {72.1450 211.4770}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_5 origin {2.5400 336.3470}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_6 origin {72.1450 336.3470}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_7 origin {2.5400 351.3470}
#set_attribute I_PCI_READ_FIFO_PCI_FIFO_RAM_8 origin {72.1450 351.3470}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_1 origin {2.5400 56.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_2 origin {72.1450 56.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_3 origin {2.5400 71.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_4 origin {72.1450 71.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_5 origin {141.7500 56.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_6 origin {141.7500 71.6070}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_7 origin {211.3550 1.5220}
#set_attribute I_PCI_WRITE_FIFO_PCI_FIFO_RAM_8 origin {211.3550 71.4570}
#set_fixed_objects [get_cells -hierarchical design_type==macrread_def ../outputs/${top_design}.floorplan.macros.def
read_def ../outputs/[get_attribute [current_design] name].floorplan.macros.def
create_placement_blockage -name pb_PCI -type allow_buffer_only -blocked_percentage 0 -boundary {{2.5400 406.2820} {126.7500 406.2820} {126.7500 126.5420} {265.9600 126.5420} {265.9600 1.6720} {2.5400 1.6720}}
