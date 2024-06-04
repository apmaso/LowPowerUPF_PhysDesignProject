if { [info exists synopsys_program_name ] && ($synopsys_program_name == "icc2_shell") } {
    puts " Creating ICC2 MCMM "
    create_mode func
    create_corner slow
    create_scenario -mode func -corner slow -name func_slow
    current_scenario func_slow
    set_operating_conditions ss0p75v125c
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmax.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmax
    read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmin.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmin
    set_parasitic_parameters -early_spec Cmax -early_temperature 125
    set_parasitic_parameters -late_spec Cmax -late_temperature 125
    #set_parasitic_parameters -early_spec 1p9m_Cmax -early_temperature 125 -corner default
    #set_parasitic_parameters -late_spec 1p9m_Cmax -late_temperature 125 -corner default

    #set_scenario_status  default -active false
    set_scenario_status func_slow -active true -hold true -setup true
}
set wclk_period 1.18
set rclk_period 1.22
set wclk2x_period [ expr $wclk_period / 2 ]

create_clock -name "wclk" -period $wclk_period  wclk
# 0.07 ns is fairly typical for pll jitter plus other jitter.
set_clock_uncertainty -setup 0.07 wclk
set_clock_uncertainty -hold 0.01 wclk
set_clock_transition 0.2 wclk
set_clock_latency 0.1 wclk

create_clock -name "rclk" -period $rclk_period rclk
set_clock_uncertainty -setup 0.07 rclk
set_clock_uncertainty -hold 0.01 rclk
set_clock_transition 0.2 rclk
set_clock_latency 0.1 rclk

#Add the new clock.  Make it 1/2 the wclk period since it is called wclk2x
create_clock -name "wclk2x" -period $wclk2x_period wclk2x
set_clock_uncertainty 0.07 -setup wclk2x
set_clock_uncertainty 0.01 -hold wclk2x
set_clock_transition 0.2 wclk2x
set_clock_latency 0.1 wclk2x

set_false_path -from [get_clocks wclk ] -to [get_clocks rclk]
set_false_path -from [get_clocks rclk ] -to [ get_clocks wclk]

# Add input/output delays in relation to related clocks
# Can tell the related clock by doing report_timing -group INPUTS  or -group OUTPUTS after using group_path
# External delay should be some percentage of clock period.
# Tune/relax if violating; most concerned about internal paths.
set_input_delay 0.0 wdata_in* -clock wclk2x
set_input_delay 0.0 winc -clock wclk
set_input_delay 0.0 rinc -clock rclk
set_output_delay -0.5 rdata* -clock rclk
set_output_delay -0.5 {rempty } -clock rclk
set_output_delay -0.5 { wfull } -clock wclk
# This port does not seem to need to be constrained with the way the library works.
# I constrained anyway and did to multiple clocks.
# I understand you probably wouldn't know that part.
set_input_delay 0.0 rrst_n -clock rclk
set_input_delay 0.0 rrst_n -clock wclk -add_delay
set_input_delay 0.0 rrst_n -clock wclk2x -add_delay

# I like set_driving_cell to a std cell from the library.  set_drive works to.
#set_driving_cell -lib_cell INVX1_HVT [all_inputs]
set_drive 0.00001 [all_inputs ]
# Make a guess for now.  A real value would normally be given.
set_load 0.5 [all_outputs]

#group_path -name INTERNAL -from [all_clocks] -to [all_clocks ]
group_path -name INPUTS -from [ get_ports -filter "direction==in&&full_name!~*clk*" ]
group_path -name OUTPUTS -to [ get_ports -filter "direction==out" ]

