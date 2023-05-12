#script for implementing eco in icc2

#remove filler cells
remove_cell [get_cell xofiller*]

#source the eco script
source ../../pt/work/ms_session_1/func_max/fixed_eco.tcl

#place eco cells
place_eco_cells -eco_changed_cells -legalize_only

#route the eco cells
route_eco

#generating output scripts
write_verilog -compress gzip ../outputs/${top_design}.route2_fixed.vg
write_parasitics -compress -output ../outputs/${top_design}.route2_fixed
save_upf ../outputs/${top_design}.route2_fixed.upf