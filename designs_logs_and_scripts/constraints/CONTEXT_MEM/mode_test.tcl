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


# Virtual clock prefixes:
#   virtual_:  Instance 'I_CONTEXT_MEM' (top mode 'test')

set old_sup ""
redirect -variable old_sup {print_suppressed_messages}
suppress_message UIC-021


#
# Boundary constraints for instance 'I_CONTEXT_MEM' (top mode 'test')
#

# Clocks
create_clock -name {PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {v_PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {SYS_2x_CLK} -period 2.40000 -waveform {0.00000 1.20000} 
create_clock -add -name {SYS_CLK/sys_clk} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock {SYS_CLK/sys_clk}]
create_clock -add -name {SYS_CLK/sys_clk_cts_7} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_7}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_7}]
create_clock -add -name {SYS_CLK/sys_clk_cts_8} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_8}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_8}]
create_clock -add -name {SYS_CLK/sys_clk_cts_9} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_9}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_9}]
create_clock -add -name {SYS_CLK/sys_clk_cts_5_1_BAR} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_5_1_BAR}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_5_1_BAR}]
create_clock -name {SYS_CLK} -period 4.80000 -waveform {0.00000 2.40000} 
create_clock -name {SDRAM_CLK} -period 4.10000 -waveform {0.00000 2.05000} 
create_clock -name {v_SDRAM_CLK} -period 4.10000 -waveform {0.00000 2.05000} 
create_clock -name {SD_DDR_CLK} -period 4.10000 -waveform {0.00000 2.05000} 
create_clock -name {SD_DDR_CLKn} -period 4.10000 -waveform {2.05000 4.10000} 
create_clock -name {ate_clk} -period 30.00000 -waveform {0.00000 15.00000} 

# Virtual clocks

# Virtual clock virtual_SYS_CLK.8_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.8_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.8_r}]
# Virtual clock virtual_SYS_CLK.8_f based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.8_f} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.8_f}]
# Virtual clock virtual_ate_clk_r based on original clock ate_clk 
create_clock -name {virtual_ate_clk_r} -period 30.00000  \
	-waveform {0.00000 15.00000} 
group_path -priority -1 -name {ate_clk} -to [get_clock {virtual_ate_clk_r}]
# Virtual clock virtual_SYS_CLK.7_r.2 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.2} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.2}]
# Virtual clock virtual_SYS_CLK.7_r.3 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.3} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.3}]
# Virtual clock virtual_SYS_CLK.7_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r}]
# Virtual clock virtual_SYS_CLK.7_r.4 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.4} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.4}]
# Virtual clock virtual_SYS_CLK.6_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.6_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.6_r}]
# Virtual clock virtual_SYS_CLK.5_r.5 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.5} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.5}]
# Virtual clock virtual__no_clock_ based on original clock <no original clock>
create_clock -name {virtual__no_clock_} -period 1000.00000
set_max_delay 1000.00000 -from {virtual__no_clock_}
set_max_delay 1000.00000 -to {virtual__no_clock_}
# Virtual clock virtual_SYS_CLK.1_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.1_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.1_r}]
# Virtual clock virtual_SYS_CLK.2_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.2_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.2_r}]
# Virtual clock virtual_SYS_CLK.3_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.3_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.3_r}]
# Virtual clock virtual_SYS_2x_CLK.4_r based on original clock SYS_2x_CLK 
create_clock -name {virtual_SYS_2x_CLK.4_r} -period 2.40000  \
	-waveform {0.00000 1.20000} 
group_path -priority -1 -name {SYS_2x_CLK} -to [get_clock  \
	{virtual_SYS_2x_CLK.4_r}]
# Virtual clock virtual_SYS_CLK.5_r.2 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.2} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.2}]
# Virtual clock virtual_SYS_CLK.5_r.3 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.3} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.3}]
# Virtual clock virtual_SYS_CLK.5_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r}]
# Virtual clock virtual_SYS_CLK.5_r.4 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.4} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.4}]

# Exceptions outside of the budget area

# Exceptions that straddle the budget boundary

# Exceptions inside of the budget area

# Boundary constants
set_case_analysis 0 [get_ports {cmd[5]}]
set_case_analysis 0 [get_ports {cmd[2]}]
set_case_analysis 0 [get_ports {test_se}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_150}]
set_case_analysis 0 [get_ports {test_si12}]
set_case_analysis 0 [get_ports {test_si11}]
set_case_analysis 0 [get_ports {test_si10}]
set_case_analysis 0 [get_ports {test_si9}]
set_case_analysis 0 [get_ports {test_si8}]
set_case_analysis 0 [get_ports {test_si7}]
set_case_analysis 0 [get_ports {test_si6}]
set_case_analysis 0 [get_ports {test_si5}]
if {[string first UIC-021 $old_sup] == -1} {unsuppress_message UIC-021}


# Other constraints
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   827
set_clock_groups -name func_async -asynchronous -group [get_clocks {SYS_2x_CLK \
    SYS_CLK/sys_clk SYS_CLK/sys_clk_cts_7 SYS_CLK/sys_clk_cts_8 \
    SYS_CLK/sys_clk_cts_9 SYS_CLK/sys_clk_cts_5_1_BAR}] -group [get_clocks \
    {PCI_CLK v_PCI_CLK}] -group [get_clocks {SDRAM_CLK v_SDRAM_CLK SD_DDR_CLK \
    SD_DDR_CLKn}]
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   828
set_clock_groups -name my_occ_clock_groups -asynchronous -group [get_clocks \
    {ate_clk}] -group [get_clocks {SYS_2x_CLK SYS_CLK/sys_clk \
    SYS_CLK/sys_clk_cts_7 SYS_CLK/sys_clk_cts_8 SYS_CLK/sys_clk_cts_9 \
    SYS_CLK/sys_clk_cts_5_1_BAR SDRAM_CLK v_SDRAM_CLK SD_DDR_CLK SD_DDR_CLKn \
    PCI_CLK v_PCI_CLK}]
# MD5_SIGNATURE: 53BD181722337C94B5E7DA7BF68530C6 
