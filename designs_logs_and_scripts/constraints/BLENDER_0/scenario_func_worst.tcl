################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:48 2020
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
set_clock_uncertainty -setup 0.1 [get_clocks {SYS_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SYS_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SDRAM_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SDRAM_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {v_SDRAM_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {v_SDRAM_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SD_DDR_CLK}]
set_clock_uncertainty -hold 0 [get_clocks {SD_DDR_CLK}]
set_clock_uncertainty -setup 0.1 [get_clocks {SD_DDR_CLKn}]
set_clock_uncertainty -hold 0 [get_clocks {SD_DDR_CLKn}]
set_clock_transition 0.2 [get_clocks {PCI_CLK}]
set_clock_transition 0.2 [get_clocks {SYS_2x_CLK}]
set_clock_transition 0.2 [get_clocks {SYS_CLK}]
set_clock_transition 0.2 [get_clocks {SDRAM_CLK}]
set_clock_transition 0.2 [get_clocks {SD_DDR_CLK}]
set_clock_transition 0.2 [get_clocks {SD_DDR_CLKn}]
set_max_transition 0.15 [get_clocks {PCI_CLK}] -clock_path
set_max_transition 0.15 [get_clocks {SYS_2x_CLK}] -clock_path
set_max_transition 0.15 [get_clocks {SYS_CLK}] -clock_path
set_max_transition 0.15 [get_clocks {SDRAM_CLK}] -clock_path

# MD5_SIGNATURE: 1698FCD11131DF6B291D09E2AF3C5DFD 
