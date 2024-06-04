echo "######### block shaping ##############"

#exploring hierarchy, creating blocks according to the hierarchy
foreach xblock $sub_block {
								explore_logic_hierarchy -create_module_boundary -cell $sub_block_I
							}
							
#organizing blocks
explore_logic_hierarchy -organize

#commiting the blocks
foreach sub_block $sub_block {
						commit_block $sub_block -library ${top_design}_lib
					
					}
					
#creating asbtract blocks
#create_abstract  -placement -all_blocks

if {[file exists ../scripts/${top_design}_block_placement.tcl]} {
source ../scripts/ORCA_TOP_block_placement.tcl
} else {
#shaping blocks false - abutted true - channeled
shape_blocks -channels false 
#-constraint_file ../../constraints/block_shaping.con
create_placement -floorplan
}
echo "######### block shaping done ##############"
