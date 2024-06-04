################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:13:02 2020
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


set_case_analysis 1 [get_ports {test_mode}]
set_case_analysis 1 [get_ports {occ_bypass}]
set_case_analysis 1 [get_ports {occ_reset}]
create_clock -name PCI_CLK -period 7.5 -waveform {0 3.75} [get_ports {pclk}]
create_clock -name v_PCI_CLK -period 7.5 -waveform {0 3.75}
create_clock -name SYS_2x_CLK -period 2.4 -waveform {0 1.2} [get_ports \
    {sys_2x_clk}]
create_generated_clock -name SYS_CLK -divide_by 2 -source [get_ports \
    {sys_2x_clk}] [get_pins {I_CLOCKING/sys_clk_in_reg/Q}]
create_clock -name SDRAM_CLK -period 4.1 -waveform {0 2.05} [get_ports \
    {sdram_clk}]
create_clock -name v_SDRAM_CLK -period 4.1 -waveform {0 2.05}
create_generated_clock -name SD_DDR_CLK -divide_by 1 -combinational -source \
    [get_ports {sdram_clk}] [get_ports {sd_CK}]
create_generated_clock -name SD_DDR_CLKn -divide_by 1 -combinational -invert \
    -source [get_ports {sdram_clk}] [get_ports {sd_CKn}]
create_clock -name ate_clk -period 30 -waveform {0 15} [get_ports {ate_clk}]
set_clock_groups -name func_async -asynchronous -group [get_clocks {SYS_2x_CLK \
    SYS_CLK}] -group [get_clocks {PCI_CLK v_PCI_CLK}] -group [get_clocks \
    {SDRAM_CLK v_SDRAM_CLK SD_DDR_CLK SD_DDR_CLKn}]
set_clock_groups -name my_occ_clock_groups -asynchronous -group [get_clocks \
    {ate_clk}] -group [get_clocks {SYS_2x_CLK SYS_CLK SDRAM_CLK v_SDRAM_CLK \
    SD_DDR_CLK SD_DDR_CLKn PCI_CLK v_PCI_CLK}]
set_false_path -from [get_ports {test_si[5] test_si[4] test_si[3] test_si[2] \
    test_si[1] test_si[0] scan_enable}] -to [get_clocks {PCI_CLK SYS_2x_CLK \
    SYS_CLK SDRAM_CLK SD_DDR_CLK SD_DDR_CLKn}]
set_budget_options -add_blocks [get_cells {I_SDRAM_TOP I_BLENDER_1 I_BLENDER_0 \
    I_RISC_CORE I_CONTEXT_MEM I_PCI_TOP I_PARSER I_CLOCKING}]

# Mapping for clocks that were split in the blocks
set_block_to_top_map -path {I_SDRAM_TOP} -clock {test SYS_CLK/sys_clk SYS_CLK}
set_block_to_top_map -path {I_SDRAM_TOP} -clock {test SYS_CLK/sys_clk_cts_4 SYS_CLK}
set_block_to_top_map -path {I_SDRAM_TOP} -clock {test SYS_CLK/sys_clk_cts_6_BAR SYS_CLK}
set_block_to_top_map -path {I_CONTEXT_MEM} -clock {test SYS_CLK/sys_clk SYS_CLK}
set_block_to_top_map -path {I_CONTEXT_MEM} -clock {test SYS_CLK/sys_clk_cts_7 SYS_CLK}
set_block_to_top_map -path {I_CONTEXT_MEM} -clock {test SYS_CLK/sys_clk_cts_8 SYS_CLK}
set_block_to_top_map -path {I_CONTEXT_MEM} -clock {test SYS_CLK/sys_clk_cts_9 SYS_CLK}
set_block_to_top_map -path {I_CONTEXT_MEM} -clock {test SYS_CLK/sys_clk_cts_5_1_BAR SYS_CLK}
set_block_to_top_map -path {I_PARSER} -clock {test SYS_CLK/sys_clk SYS_CLK}
set_block_to_top_map -path {I_PARSER} -clock {test SYS_CLK/sys_clk_cts_7 SYS_CLK}
set_block_to_top_map -path {I_PARSER} -clock {test SYS_CLK/sys_clk_cts_9 SYS_CLK}
set_block_to_top_map -path {I_PARSER} -clock {test SYS_CLK/sys_clk_cts_0_1 SYS_CLK}
# MD5_SIGNATURE: D1D79C5B16E76F4DAFA22F4F89772FEE 
