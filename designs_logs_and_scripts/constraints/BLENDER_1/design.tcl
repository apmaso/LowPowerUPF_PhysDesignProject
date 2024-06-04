################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:46 2020
#
################################################################################

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


set_app_options -as_user_default -name design.high_fanout_net_threshold -value \
    1000 -quiet
set_app_options -as_user_default -name time.port_slew_lower_threshold_rise \
    -value 20 -quiet
set_app_options -as_user_default -name time.port_slew_lower_threshold_fall \
    -value 20 -quiet
set_app_options -as_user_default -name time.port_slew_upper_threshold_rise \
    -value 80 -quiet
set_app_options -as_user_default -name time.port_slew_upper_threshold_fall \
    -value 80 -quiet
set_app_options -as_user_default -name time.port_input_threshold_rise -value 50 \
    -quiet
set_app_options -as_user_default -name time.port_input_threshold_fall -value 50 \
    -quiet
set_app_options -as_user_default -name time.port_output_threshold_rise -value \
    50 -quiet
set_app_options -as_user_default -name time.port_output_threshold_fall -value \
    50 -quiet
set_app_options -as_user_default -name time.port_slew_derate_from_library \
    -value 1 -quiet
set_app_options -name time.disable_recovery_removal_checks -value false -quiet
set_app_options -name route_opt.flow.enable_ccd -value false -quiet
set_app_options -name plan.macro.spacing_rule_widths -value {15um 15um} -quiet
set_app_options -name plan.macro.spacing_rule_heights -value {15um 15um} -quiet
set_app_options -name gui.batch_x_display -value default -quiet
set_app_options -block [current_block] -name \
    time.remove_clock_reconvergence_pessimism -value true -quiet
set_app_options -block [current_block] -name time.si_enable_analysis -value \
    true -quiet
set_app_options -block [current_block] -name clock_opt.flow.enable_ccd -value \
    false -quiet
set_app_options -block [current_block] -name ccd.max_prepone -value 0 -quiet
set_app_options -block [current_block] -name ccd.max_postpone -value 0 -quiet
set_app_options -block [current_block] -name place_opt.initial_place.effort \
    -value medium -quiet
set_app_options -block [current_block] -name place_opt.final_place.effort \
    -value medium -quiet
set_app_options -block [current_block] -name place_opt.flow.enable_ccd -value \
    false -quiet
set_app_options -block [current_block] -name \
    place.coarse.continue_on_missing_scandef -value true -quiet
set_app_options -block [current_block] -name plan.macro.macro_place_only -value \
    true -quiet
set_app_options -block [current_block] -name plan.macro.macros_on_edge -value \
    true -quiet
set_app_options -block [current_block] -name plan.macro.grouping_by_hierarchy \
    -value true -quiet
set_app_options -block [current_block] -name \
    plan.macro.auto_macro_array_max_width -value 520um -quiet
set_app_options -block [current_block] -name \
    plan.macro.auto_macro_array_max_height -value 520um -quiet
set_app_options -block [current_block] -name plan.macro.auto_macro_array_size \
    -value high -quiet
set_app_options -block [current_block] -name plan.macro.auto_buffer_channels \
    -value false -quiet
set_app_options -block [current_block] -name plan.macro.max_buffer_stack_height \
    -value 0m -quiet
set_app_options -block [current_block] -name plan.macro.max_buffer_stack_width \
    -value 0m -quiet
set_app_options -block [current_block] -name plan.macro.buffer_channel_height \
    -value 0m -quiet
set_app_options -block [current_block] -name plan.macro.buffer_channel_width \
    -value 0m -quiet

## Encrypted set_app_options
set dirName [file dirname [file normalize [info script]]]
if {[file exists  ${dirName}/top.tcl___synenc_proc_]} {
  redirect /dev/null {source -continue_on_error \
    ${dirName}/top.tcl___synenc_proc_ }
}
set_ignored_layers -min_routing_layer M2 -max_routing_layer M7

set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND2X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND2X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND3X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND3X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND4X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND4X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND4X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND4X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AND4X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AND4X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/ANTENNA_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/ANTENNA_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO21X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO21X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO21X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO21X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO221X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO221X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO221X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO221X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO222X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO222X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO222X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO222X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO22X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO22X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AO22X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AO22X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOBUFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOBUFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOBUFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOBUFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOBUFX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOBUFX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/AODFFARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AODFFARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/AODFFARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AODFFARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/AODFFNARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AODFFNARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/AODFFNARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AODFFNARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI21X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI21X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI21X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI21X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI221X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI221X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI221X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI221X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI222X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI222X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI222X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI222X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI22X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI22X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOI22X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOI22X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOINVX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOINVX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOINVX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOINVX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/AOINVX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/AOINVX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/BSLEX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/BSLEX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/BSLEX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/BSLEX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/BSLEX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/BSLEX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/BUSKP_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/BUSKP_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLNPRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLNPRX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPRX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/CGLNPSX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPSX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLNPSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLNPSX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPSX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLNPSX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLNPSX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLPPRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLPPRX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPRX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/CGLPPSX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPSX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLPPSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLPPSX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPSX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CGLPPSX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/CGLPPSX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/CLOAD1_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/CLOAD1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DCAP_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/DCAP_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DEC24X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DEC24X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DEC24X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DEC24X2_HVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32hvt_c/DELLN1X2_HVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32hvt_c/DELLN1X2_HVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32hvt_c/DELLN2X2_HVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32hvt_c/DELLN2X2_HVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32hvt_c/DELLN3X2_HVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32hvt_c/DELLN3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRQX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRQX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRQX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRQX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DFFNASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFSSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFSSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFSSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFSSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/DFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/DHFILLH2_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/DHFILLH2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DHFILLHL2_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/DHFILLHL2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/DHFILLHLHLS11_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/DHFILLHLHLS11_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/FADDX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/FADDX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/FADDX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/FADDX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/HADDX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/HADDX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/HADDX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/HADDX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/IBUFFX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/IBUFFX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/IBUFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/IBUFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/IBUFFX32_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/IBUFFX32_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/IBUFFX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/IBUFFX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/IBUFFX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/IBUFFX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX32_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/INVX32_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/INVX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/INVX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/ISOLANDAOX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLANDX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLANDX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLANDX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLANDX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLANDX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLORAOX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORAOX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLORAOX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORAOX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLORAOX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORAOX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/ISOLORAOX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORAOX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/ISOLORX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/ISOLORX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/ISOLORX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/ISOLORX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/ISOLORX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRQX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRQX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRQX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRQX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LATCHX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LATCHX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LATCHX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LATCHX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LNANDX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LNANDX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/LNANDX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/LNANDX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/MUX21X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/MUX21X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/MUX21X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/MUX21X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/MUX41X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/MUX41X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/MUX41X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/MUX41X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND2X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND2X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND2X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND2X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND3X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND3X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND3X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND3X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND4X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND4X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NAND4X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NAND4X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NBUFFX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NBUFFX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NBUFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NBUFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NBUFFX32_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/NBUFFX32_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NBUFFX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NBUFFX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NBUFFX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NBUFFX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NMT1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NMT1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NMT2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NMT2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NMT3_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NMT3_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR2X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR2X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR2X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR2X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR3X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR3X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR3X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR3X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR4X0_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR4X0_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/NOR4X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/NOR4X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA21X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA21X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA21X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA21X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA221X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA221X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA221X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA221X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA222X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA222X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA222X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA222X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA22X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA22X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OA22X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OA22X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI21X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI21X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI21X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI21X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI221X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI221X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI221X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI221X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI222X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI222X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI222X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI222X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI22X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI22X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OAI22X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OAI22X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR2X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR2X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR3X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR3X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR4X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR4X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR4X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR4X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/OR4X4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/OR4X4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PGX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PGX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PGX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PGX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PGX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PGX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PMT1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PMT1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PMT2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PMT2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/PMT3_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/PMT3_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRQX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRQX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRQX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRQX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFNSRASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFNSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFSRASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFSRASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRSSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RDFFSRSSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RDFFSRSSRX2_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/RDFFSRSSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RDFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RDFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRQX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRQX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRQX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRQX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFNSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RSDFFNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RSDFFNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRSSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRSSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRSSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_c/RSDFFSRSSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/RSDFFSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RSDFFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/RSDFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/RSDFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFASRSX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASRSX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFASRSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASRSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNARX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNARX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNASRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNASRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNASRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNASRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNASX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNASX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFNASX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNASX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFSSRX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFSSRX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SDFFSSRX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFSSRX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SDFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/SDFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/SHFILL128_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/SHFILL128_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SHFILL1_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/SHFILL1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SHFILL2_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/SHFILL2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SHFILL3_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/SHFILL3_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/SHFILL64_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/SHFILL64_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TIEH_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/TIEH_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TIEL_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/TIEL_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/TNBUFFX16_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/TNBUFFX16_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TNBUFFX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/TNBUFFX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TNBUFFX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/TNBUFFX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_c/TNBUFFX32_HVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32hvt_c/TNBUFFX32_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TNBUFFX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/TNBUFFX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/TNBUFFX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/TNBUFFX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XNOR2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XNOR2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XNOR2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XNOR2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XNOR3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XNOR3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XNOR3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XNOR3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XOR2X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XOR2X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XOR2X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XOR2X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XOR3X1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XOR3X1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32hvt_c/XOR3X2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32hvt_c/XOR3X2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENCLX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPENX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_ulvl_v/LSUPX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLSSX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENCLX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENSSX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNENX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNSSX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX1_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX1_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX2_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX2_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX4_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX4_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX8_HVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32hvt_dlvl_v/LSDNX8_HVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND2X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND2X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND3X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND3X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND4X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND4X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND4X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND4X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AND4X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AND4X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/ANTENNA_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/ANTENNA_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO21X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO21X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO21X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO21X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO221X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO221X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO221X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO221X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO222X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO222X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO222X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO222X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO22X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO22X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AO22X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AO22X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOBUFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOBUFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOBUFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOBUFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOBUFX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOBUFX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/AODFFARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AODFFARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/AODFFARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AODFFARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/AODFFNARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AODFFNARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/AODFFNARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AODFFNARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI21X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI21X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI21X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI21X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI221X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI221X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI221X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI221X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI222X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI222X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI222X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI222X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI22X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI22X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOI22X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOI22X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOINVX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOINVX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOINVX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOINVX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/AOINVX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/AOINVX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/BSLEX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/BSLEX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/BSLEX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/BSLEX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/BSLEX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/BSLEX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/BUSKP_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/BUSKP_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLNPRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLNPRX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPRX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/CGLNPSX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPSX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLNPSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLNPSX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPSX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLNPSX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLNPSX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLPPRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLPPRX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPRX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/CGLPPSX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPSX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLPPSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLPPSX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPSX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CGLPPSX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/CGLPPSX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/CLOAD1_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/CLOAD1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DCAP_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/DCAP_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DEC24X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DEC24X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DEC24X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DEC24X2_RVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32rvt_c/DELLN1X2_RVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32rvt_c/DELLN1X2_RVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32rvt_c/DELLN2X2_RVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32rvt_c/DELLN2X2_RVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32rvt_c/DELLN3X2_RVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32rvt_c/DELLN3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRQX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRQX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRQX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRQX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DFFNASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFSSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFSSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFSSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFSSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/DFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/DHFILLH2_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/DHFILLH2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DHFILLHL2_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/DHFILLHL2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/DHFILLHLHLS11_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/DHFILLHLHLS11_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/FADDX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/FADDX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/FADDX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/FADDX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/HADDX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/HADDX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/HADDX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/HADDX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/IBUFFX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/IBUFFX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/IBUFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/IBUFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/IBUFFX32_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/IBUFFX32_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/IBUFFX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/IBUFFX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/IBUFFX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/IBUFFX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX32_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/INVX32_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/INVX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/INVX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/ISOLANDAOX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLANDX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLANDX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLANDX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLANDX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLANDX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLORAOX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORAOX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLORAOX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORAOX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLORAOX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORAOX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/ISOLORAOX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORAOX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/ISOLORX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/ISOLORX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/ISOLORX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/ISOLORX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/ISOLORX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRQX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRQX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRQX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRQX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LATCHX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LATCHX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LATCHX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LATCHX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LNANDX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LNANDX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/LNANDX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/LNANDX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/MUX21X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/MUX21X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/MUX21X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/MUX21X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/MUX41X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/MUX41X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/MUX41X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/MUX41X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND2X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND2X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND2X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND2X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND3X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND3X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND3X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND3X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND4X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND4X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NAND4X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NAND4X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NBUFFX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NBUFFX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NBUFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NBUFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NBUFFX32_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/NBUFFX32_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NBUFFX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NBUFFX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NBUFFX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NBUFFX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NMT1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NMT1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NMT2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NMT2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NMT3_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NMT3_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR2X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR2X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR2X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR2X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR3X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR3X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR3X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR3X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR4X0_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR4X0_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/NOR4X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/NOR4X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA21X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA21X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA21X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA21X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA221X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA221X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA221X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA221X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA222X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA222X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA222X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA222X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA22X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA22X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OA22X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OA22X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI21X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI21X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI21X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI21X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI221X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI221X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI221X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI221X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI222X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI222X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI222X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI222X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI22X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI22X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OAI22X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OAI22X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR2X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR2X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR3X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR3X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR4X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR4X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR4X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR4X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/OR4X4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/OR4X4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PGX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PGX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PGX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PGX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PGX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PGX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PMT1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PMT1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PMT2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PMT2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/PMT3_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/PMT3_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRQX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRQX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRQX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRQX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFNSRASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFNSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFSRASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFSRASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRSSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RDFFSRSSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RDFFSRSSRX2_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/RDFFSRSSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RDFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RDFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRQX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRQX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRQX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRQX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFNSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RSDFFNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RSDFFNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRSSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRSSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRSSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_c/RSDFFSRSSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/RSDFFSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RSDFFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/RSDFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/RSDFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFASRSX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASRSX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFASRSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASRSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNARX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNARX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNASRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNASRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNASRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNASRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNASX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNASX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFNASX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNASX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFSSRX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFSSRX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SDFFSSRX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFSSRX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SDFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/SDFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/SHFILL128_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/SHFILL128_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SHFILL1_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/SHFILL1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SHFILL2_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/SHFILL2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SHFILL3_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/SHFILL3_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/SHFILL64_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/SHFILL64_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TIEH_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/TIEH_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TIEL_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/TIEL_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/TNBUFFX16_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/TNBUFFX16_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TNBUFFX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/TNBUFFX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TNBUFFX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/TNBUFFX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_c/TNBUFFX32_RVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32rvt_c/TNBUFFX32_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TNBUFFX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/TNBUFFX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/TNBUFFX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/TNBUFFX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XNOR2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XNOR2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XNOR2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XNOR2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XNOR3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XNOR3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XNOR3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XNOR3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XOR2X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XOR2X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XOR2X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XOR2X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XOR3X1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XOR3X1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32rvt_c/XOR3X2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32rvt_c/XOR3X2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENCLX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPENX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_ulvl_v/LSUPX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLSSX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENCLX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENSSX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNENX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNSSX8_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX1_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX1_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX2_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX2_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX4_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX4_RVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX8_RVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells \
    {saed32rvt_dlvl_v/LSDNX8_RVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32lvt_c/DELLN1X2_LVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32lvt_c/DELLN1X2_LVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32lvt_c/DELLN2X2_LVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32lvt_c/DELLN2X2_LVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32lvt_c/DELLN3X2_LVT}]
set_lib_cell_purpose -include {hold} [get_lib_cells {saed32lvt_c/DELLN3X2_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/IBUFFX16_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/IBUFFX16_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/IBUFFX2_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/IBUFFX2_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/IBUFFX32_LVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32lvt_c/IBUFFX32_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/IBUFFX4_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/IBUFFX4_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/IBUFFX8_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/IBUFFX8_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX0_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX0_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX16_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX16_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX1_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX1_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX2_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX2_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX32_LVT}]
set_lib_cell_purpose -exclude {power hold cts optimization} [get_lib_cells \
    {saed32lvt_c/INVX32_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX4_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX4_LVT}]
set_lib_cell_purpose -exclude {none} [get_lib_cells {saed32lvt_c/INVX8_LVT}]
set_lib_cell_purpose -exclude {cts} [get_lib_cells {saed32lvt_c/INVX8_LVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32lvt_c/NBUFFX32_LVT}]
set_lib_cell_purpose -include {none} [get_lib_cells {saed32lvt_c/TNBUFFX32_LVT}]
# MD5_SIGNATURE: 80C8690CC5C3586DC97C3A7AE88C0A05 
