echo "#############split constraints##############"
#remove existing split directory

file delete -force split  

#setting budget options to blocks
set_budget_options -add_blocks ${sub_block_I}
					
#splitting the constraints 
split_constraints 


echo "#############split constraints done ##############"




