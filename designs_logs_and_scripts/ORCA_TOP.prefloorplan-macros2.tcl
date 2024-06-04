#grouping top level -LS:
set other_cells [get_cells -filter "name!~*LS* && is_hierarchical==false"]
ungroup_cells -simple_names [get_cells I_RISC_CORE]
set risc_cells [remove_from_collection [get_cells -filter "name=~*STACK* || name=~*DATA* || name=~*PRGRM* || name=~*INSTRN* || name=~*LS* || is_hierarchical==false ||name=~*ALU*"] $other_cells]
group_cells -cell_name I_RISC_CORE -module_name RISC_CORE $risc_cells
ungroup_cells -simple_names [get_cells I_SDRAM_TOP]
group_cells -cell_name I_SDRAM_TOP -module_name SDRAM_TOP [get_cells -filter "name=~R_* || name=~U* || name=~I_SDRAM* || name=~icc*"]
#ungroup_cells -simple_names [get_cells I_PCI_TOP]
#group_cells -cell_name I_PCI_TOP -module_name PCI_TOP [get_cells -filter "name=~U2*"]
#ungroup_cells -simple_names [get_cells I_]
#group_cells -cell_name I_PCI_TOP -module_name PCI_TOP [get_cells -filter "name=~U2*"]


