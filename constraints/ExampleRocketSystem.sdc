
if { [info exists synopsys_program_name ] && ($synopsys_program_name == "icc2_shell") } {
    puts " Creating ICC2 MCMM "
    create_mode func
    create_corner slow
    create_scenario -mode func -corner slow -name func_slow
    current_scenario func_slow
    set_operating_condition ss0p95v125c -library saed32lvt_ss0p95v125c
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmax.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmax
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmin.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmin
    set_parasitic_parameters -early_spec Cmax -early_temperature 125
    set_parasitic_parameters -late_spec Cmax -late_temperature 125
    #set_parasitic_parameters -early_spec 1p9m_Cmax -early_temperature 125 -corner default
    #set_parasitic_parameters -late_spec 1p9m_Cmax -late_temperature 125 -corner default

    #set_scenario_status  default -active false
    set_scenario_status func_slow -active true -hold true -setup true
} else {
    set_operating_condition ss0p95v125c -library saed32lvt_ss0p95v125c
}

puts " Setting up normal constraints "

create_clock -name "clock" -period 2.0  -add clock
#set_clock_latency -source 0.9 [get_clocks clock]
set_clock_latency -source -early -min 0 [get_port clock  ] -clock [get_clock clock ]
set_clock_latency -source -early -max 0 [get_port clock  ] -clock [get_clock clock ]
set_clock_latency -source -late -min 0 [get_port clock  ] -clock [get_clock clock ]
set_clock_latency -source -late -max 0 [get_port clock  ] -clock [get_clock clock ]
set_clock_transition 0.185 [get_clocks clock]
set_input_delay 0.0016 [all_inputs] -clock clock
set_output_delay 0.0016 [all_outputs] -clock clock
set_driving_cell -lib_cell NBUFFX8_HVT [all_inputs]
set_load 0.009 [all_outputs]
set_clock_uncertainty -hold 0.001 [get_clocks clock]
# clock skew of around 100ps
set_clock_uncertainty -setup 0.160 [get_clocks clock]

group_path -name INPUTS -from [ get_ports -filter "direction==in&&full_name!~*clk*" ]
group_path -name OUTPUTS -to [ get_ports -filter "direction==out" ]

set_false_path -hold -from [all_inputs ]
set_false_path -hold -to [all_outputs ]



