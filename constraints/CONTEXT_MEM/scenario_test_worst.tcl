################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:52 2020
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


# -origin user
set_clock_latency 0.5 [get_clocks {v_PCI_CLK}]
# Set latency for io paths.
set_clock_uncertainty -setup 0.1 [get_clocks {PCI_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {PCI_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {v_PCI_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {v_PCI_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SYS_2x_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SYS_2x_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SYS_CLK/sys_clk \
    SYS_CLK/sys_clk_cts_7 SYS_CLK/sys_clk_cts_8 SYS_CLK/sys_clk_cts_9 \
    SYS_CLK/sys_clk_cts_5_1_BAR}]
set_clock_uncertainty -hold 0 [get_clocks {SYS_CLK/sys_clk \
    SYS_CLK/sys_clk_cts_7 SYS_CLK/sys_clk_cts_8 SYS_CLK/sys_clk_cts_9 \
    SYS_CLK/sys_clk_cts_5_1_BAR}]
set_clock_uncertainty -setup 0.1 [get_clocks {SDRAM_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SDRAM_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {v_SDRAM_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {v_SDRAM_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SD_DDR_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SD_DDR_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SD_DDR_CLKn}]
set_clock_uncertainty -hold 0 [get_clocks {SD_DDR_CLKn}]
set_clock_uncertainty -setup 0.1 [get_clocks {ate_clk}]
set_clock_uncertainty -hold 0 [get_clocks {ate_clk}]
set_clock_transition 0.2 [get_clocks {PCI_CLK}]
set_clock_transition 0.2 [get_clocks {SYS_2x_CLK}]
set_clock_transition 0.2 [get_clocks {SYS_CLK/sys_clk SYS_CLK/sys_clk_cts_7 \
    SYS_CLK/sys_clk_cts_8 SYS_CLK/sys_clk_cts_9 SYS_CLK/sys_clk_cts_5_1_BAR}]
set_clock_transition 0.2 [get_clocks {SDRAM_CLK}]
set_clock_transition 0.2 [get_clocks {SD_DDR_CLK}]
set_clock_transition 0.2 [get_clocks {SD_DDR_CLKn}]
set_clock_transition 0.2 [get_clocks {ate_clk}]

# MD5_SIGNATURE: 43F2CB79B6017F2C0E5C9E40C772551A 
