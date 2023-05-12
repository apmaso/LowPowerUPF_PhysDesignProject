
foreach i [get_attribute [get_cells -filter design_type==module] ref_name] {
open_block $i.design
#reopen_block -edit
source ../scripts/${i}_boundary_macro.tcl
save_block
#write_def -include {cells ports blockages } -cell_types {macro} "../outputs/${i}.macros.def"
}
current_design ORCA_TOP
link -f

set_attribute I_SDRAM_TOP origin { 418.2700 10.0000} 
set_attribute I_BLENDER_1 origin { 207.6900 200.0320} 
set_attribute I_BLENDER_0 origin { 418.2700 364.6860} 
set_attribute I_RISC_CORE origin { 10.0000 433.0480} 
set_attribute I_CONTEXT_MEM origin { 418.2700 250.5080} 
set_attribute I_PARSER origin { 418.2700 346.6900} 
set_attribute I_PCI_TOP origin { 10.0000 10.0000} 
set_attribute I_CLOCKING origin { 474.5450 346.6900}
set_attribute I_TOP_CELLS origin {489.4330 346.6990}


