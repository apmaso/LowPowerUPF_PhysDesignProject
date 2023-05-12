foreach i [get_attribute [get_cells -filter design_type==module] ref_name] {
current_design $i
create_placement -effort low
}
save_block
current_design ORCA_TOP
