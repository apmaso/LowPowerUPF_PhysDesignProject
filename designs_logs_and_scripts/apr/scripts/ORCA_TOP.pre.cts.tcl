#set_ccopt_property insertion_delay 350ps -pin occ_int2/U_clk_control_i_0/fast_clk_enable_l_reg/CLK

set_ccopt_property use_inverters false 
set_ccopt_property buffer_cells [ get_db [get_lib_cells */NBUF*LVT* ] .base_name ]

