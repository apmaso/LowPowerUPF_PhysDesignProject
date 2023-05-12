################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:43 2020
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
#   virtual_:  Instance 'I_SDRAM_TOP' (top mode 'test')

set old_sup ""
redirect -variable old_sup {print_suppressed_messages}
suppress_message UIC-021


#
# Boundary constraints for instance 'I_SDRAM_TOP' (top mode 'test')
#

# Clocks
create_clock -name {PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {v_PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {SYS_2x_CLK} -period 2.40000 -waveform {0.00000 1.20000} 
create_clock -add -name {SYS_CLK/sys_clk} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock {SYS_CLK/sys_clk}]
create_clock -add -name {SYS_CLK/sys_clk_cts_4} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_4}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_4}]
create_clock -add -name {SYS_CLK/sys_clk_cts_6_BAR} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {sys_clk_cts_6_BAR}]
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{SYS_CLK/sys_clk_cts_6_BAR}]
create_clock -name {SYS_CLK} -period 4.80000 -waveform {0.00000 2.40000} 
create_clock -add -name {SDRAM_CLK} -period 4.10000  \
	-waveform {0.00000 2.05000} [get_ports {sdram_clk}]
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
# Virtual clock virtual_SDRAM_CLK.top_r based on original clock SDRAM_CLK 
create_clock -name {virtual_SDRAM_CLK.top_r} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SDRAM_CLK} -to [get_clock  \
	{virtual_SDRAM_CLK.top_r}]
# Virtual clock virtual_SDRAM_CLK.top_f based on original clock SDRAM_CLK 
create_clock -name {virtual_SDRAM_CLK.top_f} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SDRAM_CLK} -to [get_clock  \
	{virtual_SDRAM_CLK.top_f}]
# Virtual clock virtual_ate_clk_r based on original clock ate_clk 
create_clock -name {virtual_ate_clk_r} -period 30.00000  \
	-waveform {0.00000 15.00000} 
group_path -priority -1 -name {ate_clk} -to [get_clock {virtual_ate_clk_r}]
# Virtual clock virtual_SYS_2x_CLK.4_r based on original clock SYS_2x_CLK 
create_clock -name {virtual_SYS_2x_CLK.4_r} -period 2.40000  \
	-waveform {0.00000 1.20000} 
group_path -priority -1 -name {SYS_2x_CLK} -to [get_clock  \
	{virtual_SYS_2x_CLK.4_r}]
# Virtual clock virtual_v_SDRAM_CLK_r based on original clock v_SDRAM_CLK 
create_clock -name {virtual_v_SDRAM_CLK_r} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {v_SDRAM_CLK} -to [get_clock  \
	{virtual_v_SDRAM_CLK_r}]
# Virtual clock virtual_v_SDRAM_CLK_f based on original clock v_SDRAM_CLK 
create_clock -name {virtual_v_SDRAM_CLK_f} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {v_SDRAM_CLK} -to [get_clock  \
	{virtual_v_SDRAM_CLK_f}]
# Virtual clock virtual_SYS_CLK.top_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.top_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.top_r}]
# Virtual clock virtual_SYS_CLK.3_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.3_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.3_r}]
# Virtual clock virtual_SYS_CLK.7_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r}]
# Virtual clock virtual_SYS_CLK.2_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.2_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.2_r}]
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
# Virtual clock virtual_SYS_CLK.6_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.6_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.6_r}]
# Virtual clock virtual_SYS_CLK.7_r.4 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.4} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.4}]
# Virtual clock virtual_SYS_CLK.5_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r}]
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
# Virtual clock virtual_SYS_CLK.5_r.4 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.4} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.4}]
# Virtual clock virtual_SYS_CLK.1_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.1_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.1_r}]
# Virtual clock virtual_SD_DDR_CLK_r based on original clock SD_DDR_CLK 
create_clock -name {virtual_SD_DDR_CLK_r} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SD_DDR_CLK} -to [get_clock  \
	{virtual_SD_DDR_CLK_r}]
# Virtual clock virtual__no_clock_ based on original clock <no original clock>
create_clock -name {virtual__no_clock_} -period 1000.00000
set_max_delay 1000.00000 -from {virtual__no_clock_}
set_max_delay 1000.00000 -to {virtual__no_clock_}
# Virtual clock virtual_SD_DDR_CLK_f based on original clock SD_DDR_CLK 
create_clock -name {virtual_SD_DDR_CLK_f} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SD_DDR_CLK} -to [get_clock  \
	{virtual_SD_DDR_CLK_f}]

# Exceptions outside of the budget area

# Exceptions that straddle the budget boundary

# Exceptions inside of the budget area

# Boundary constants
set_case_analysis 0 [get_ports {test_mode}]
set_case_analysis 0 [get_ports {IN2}]
set_case_analysis 0 [get_ports {test_si12}]
set_case_analysis 0 [get_ports {test_si5}]
set_case_analysis 0 [get_ports {test_si3}]
set_case_analysis 0 [get_ports {test_si2}]
set_case_analysis 0 [get_ports {test_si1}]
set_case_analysis 0 [get_ports {test_se}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_3}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_4}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_5}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_6}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_7}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_8}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_9}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_10}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_11}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_12}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_13}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_14}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_15}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_16}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_17}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_18}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_19}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_20}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_21}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_22}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_23}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_24}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_25}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_26}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_27}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_28}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_29}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_30}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_31}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_32}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_33}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_34}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_35}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_36}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_37}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_38}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_39}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_40}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_41}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_42}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_43}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_44}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_45}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_46}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_47}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_48}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_49}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_50}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_51}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_52}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_53}]
set_case_analysis 0 [get_ports {IN3}]
set_case_analysis 0 [get_ports {IN4}]
set_case_analysis 0 [get_ports {IN5}]
set_case_analysis 0 [get_ports {IN6}]
set_case_analysis 0 [get_ports {IN7}]
set_case_analysis 0 [get_ports {IN8}]
set_case_analysis 0 [get_ports {IN9}]
set_case_analysis 0 [get_ports {IN10}]
set_case_analysis 0 [get_ports {IN11}]
set_case_analysis 0 [get_ports {IN12}]
set_case_analysis 0 [get_ports {IN13}]
set_case_analysis 0 [get_ports {IN14}]
set_case_analysis 0 [get_ports {IN15}]
set_case_analysis 0 [get_ports {IN16}]
set_case_analysis 0 [get_ports {IN17}]
set_case_analysis 0 [get_ports {IN18}]
set_case_analysis 0 [get_ports {IN19}]
set_case_analysis 0 [get_ports {IN20}]
set_case_analysis 0 [get_ports {IN21}]
set_case_analysis 0 [get_ports {IN22}]
set_case_analysis 0 [get_ports {IN23}]
set_case_analysis 0 [get_ports {IN24}]
set_case_analysis 0 [get_ports {IN25}]
set_case_analysis 0 [get_ports {IN26}]
set_case_analysis 0 [get_ports {IN27}]
set_case_analysis 0 [get_ports {IN28}]
set_case_analysis 0 [get_ports {IN29}]
set_case_analysis 0 [get_ports {IN30}]
set_case_analysis 0 [get_ports {IN31}]
set_case_analysis 0 [get_ports {IN32}]
set_case_analysis 0 [get_ports {IN33}]
set_case_analysis 0 [get_ports {IN34}]
set_case_analysis 0 [get_ports {IN35}]
set_case_analysis 0 [get_ports {IN36}]
set_case_analysis 0 [get_ports {test_si18}]
set_case_analysis 0 [get_ports {test_si17}]
set_case_analysis 0 [get_ports {test_si16}]
set_case_analysis 0 [get_ports {test_si15}]
set_case_analysis 0 [get_ports {test_si14}]
set_case_analysis 0 [get_ports {test_si13}]
if {[string first UIC-021 $old_sup] == -1} {unsuppress_message UIC-021}


# Other constraints
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   827
set_clock_groups -name func_async -asynchronous -group [get_clocks {SYS_2x_CLK \
    SYS_CLK/sys_clk SYS_CLK/sys_clk_cts_4 SYS_CLK/sys_clk_cts_6_BAR}] -group \
    [get_clocks {PCI_CLK v_PCI_CLK}] -group [get_clocks {SDRAM_CLK v_SDRAM_CLK \
    SD_DDR_CLK SD_DDR_CLKn}]
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   828
set_clock_groups -name my_occ_clock_groups -asynchronous -group [get_clocks \
    {ate_clk}] -group [get_clocks {SYS_2x_CLK SYS_CLK/sys_clk \
    SYS_CLK/sys_clk_cts_4 SYS_CLK/sys_clk_cts_6_BAR SDRAM_CLK v_SDRAM_CLK \
    SD_DDR_CLK SD_DDR_CLKn PCI_CLK v_PCI_CLK}]
# MD5_SIGNATURE: 613A978B59C1EBA5CF0A79D8FD3F9BAB 
