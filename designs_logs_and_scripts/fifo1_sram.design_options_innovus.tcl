setNanoRouteMode -drouteEndIteration 10

set cts_clks [get_clocks {wclk wclk2x rclk} ]

#set_max_transition 0.1 -clock_path $cts_clks
set_ccopt_property target_max_trans 0.6ns
