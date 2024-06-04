echo " ################# Starting pin placement #############"
current_design ORCA_TOP
remove_terminals [get_terminals -of [get_pins ]]
#allow m2 to m9 layers 
#remove_block_pin_constraints -all
set_block_pin_constraints -pin_spacing 1 -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
set_block_pin_constraints -corner_keepout_num_tracks 2
set_block_pin_constraints -corner_keepout_distance 2
#set_block_pin_constraints -pin_spacing 2
#set_block_pin_constraints -pin_spacing_distance 2
#set_block_pin_constraints -sides {1 2}
#set_block_pin_constraints -exclude_sides {3 4}
set_block_pin_constraints -allow_feedthroughs true
#set_individual_pin_constraints -pin_spacing_distance 2
#set_individual_pin_constraints -width {{M3 1} {M5 2}} -length {{M3 2} {M5 4}}
#set_individual_pin_constraints -sides {1 2 3}
#set_individual_pin_constraints -exclude_sides {4}
#set_individual_pin_constraints -sides 1 -offset 10
set_block_pin_constraints -cells I_SDRAM* -sides {1 2 3 4 6} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
#set_block_pin_constraints -cells I_SDRAM* -exclude_sides {5}
set_block_pin_constraints -cells I_RISC* -sides {3 4} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
#set_block_pin_constraints -cells I_RISC* -exclude_sides {1 2}
set_block_pin_constraints -cells I_CONTEXT* -sides {1 4 5 6} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
#set_block_pin_constraints -cells I_CONTEXT* -exclude_sides {4 5}
set_block_pin_constraints -cells I_PCI* -sides {2 3 4 5 6} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
#set_block_pin_constraints -cells I_PCI* -exclude_sides {1}
set_block_pin_constraints -cells I_BLENDER_0* -sides {1 2 3 4} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
set_block_pin_constraints -cells I_BLENDER_1* -sides {1 2 3 4} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
set_block_pin_constraints -cells I_PARSER* -sides {1 2 3 4} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
set_block_pin_constraints -cells I_CLOCKING* -sides {1 2 3 4} -allowed_layers {M2 M3 M4 M5 M6 M7 M8 M9}
#foreach_in_collection net [get_nets] {
#echo [get_object_name $net]
place_pins 
echo " ########### pin placement done ###############"
if {0} {
#sdram-risc pin guide
#{394.1040 213.3760} {435.4480 340.9040} ---sdram
#{259.8880 418.0080} {418.2700 455.0560} ---risc
reset_upf
foreach_in_collection net [get_nets] {
	if {[set pins [get_pins -of $net -filter "full_name!~I_SDRAM* && full_name!~I_RISC*"]] eq ""} {
	append_to_collection srpins $net
	} }
create_pin_guide -boundary {{394.1040 213.3760} {435.4480 340.9040}} [filter_collection $srpins "name!~VDD* && name!~VSS*"]
create_pin_guide -boundary {{259.8880 418.0080} {418.2700 455.0560}} [filter_collection $srpins "name!~VDD* && name!~VSS*"]
}
