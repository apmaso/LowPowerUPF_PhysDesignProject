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


# Virtual clock prefixes:
#   virtual_:  Instance 'I_BLENDER_0' (top mode 'test')

set old_sup ""
redirect -variable old_sup {print_suppressed_messages}
suppress_message UIC-021


#
# Boundary constraints for instance 'I_BLENDER_0' (top mode 'test')
#

# Clocks
create_clock -name {PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {v_PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -name {SYS_2x_CLK} -period 2.40000 -waveform {0.00000 1.20000} 
create_clock -add -name {SYS_CLK} -period 4.80000  \
	-waveform {0.00000 2.40000} [get_ports {clk}]
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
# Virtual clock virtual_SYS_CLK.7_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r}]
# Virtual clock virtual_SYS_CLK.7_r.2 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.2} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.2}]
# Virtual clock virtual_SYS_CLK.1_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.1_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.1_r}]
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
# Virtual clock virtual_ate_clk_r based on original clock ate_clk 
create_clock -name {virtual_ate_clk_r} -period 30.00000  \
	-waveform {0.00000 15.00000} 
group_path -priority -1 -name {ate_clk} -to [get_clock {virtual_ate_clk_r}]
# Virtual clock virtual_SYS_CLK.3_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.3_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.3_r}]
# Virtual clock virtual__no_clock_ based on original clock <no original clock>
create_clock -name {virtual__no_clock_} -period 1000.00000
set_max_delay 1000.00000 -from {virtual__no_clock_}
set_max_delay 1000.00000 -to {virtual__no_clock_}

# Exceptions outside of the budget area

# Exceptions that straddle the budget boundary

# Exceptions inside of the budget area

# Boundary constants
set_case_analysis 0 [get_ports {reset_n}]
set_case_analysis 0 [get_ports {operation_0_}]
set_case_analysis 0 [get_ports {IN6}]
set_case_analysis 0 [get_ports {IN7}]
set_case_analysis 0 [get_ports {IN9}]
set_case_analysis 0 [get_ports {IN10}]
set_case_analysis 0 [get_ports {IN11}]
set_case_analysis 0 [get_ports {IN12}]
set_case_analysis 0 [get_ports {test_si22}]
set_case_analysis 0 [get_ports {test_se}]
set_case_analysis 0 [get_ports {IN13}]
set_case_analysis 0 [get_ports {IN14}]
set_case_analysis 0 [get_ports {IN15}]
set_case_analysis 0 [get_ports {IN16}]
set_case_analysis 0 [get_ports {IN17}]
set_case_analysis 0 [get_ports {IN18}]
set_case_analysis 0 [get_ports {IN21}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_116}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_117}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_118}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_119}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_120}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_121}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_122}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_123}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_124}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_125}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_126}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_127}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_128}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_129}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_130}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_131}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_132}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_133}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_134}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_135}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_136}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_137}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_138}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_139}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_140}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_141}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_142}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_143}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_144}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_145}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_146}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_147}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_148}]
set_case_analysis 0 [get_ports {test_se_hfs_netlink_149}]
set_case_analysis 0 [get_ports {IN22}]
set_case_analysis 0 [get_ports {IN23}]
set_case_analysis 0 [get_ports {IN24}]
set_case_analysis 0 [get_ports {IN27}]
set_case_analysis 0 [get_ports {IN34}]
set_case_analysis 0 [get_ports {IN35}]
set_case_analysis 0 [get_ports {IN36}]
set_case_analysis 0 [get_ports {IN40}]
set_case_analysis 0 [get_ports {test_si36}]
set_case_analysis 0 [get_ports {test_si35}]
set_case_analysis 0 [get_ports {test_si34}]
set_case_analysis 0 [get_ports {test_si33}]
set_case_analysis 0 [get_ports {test_si32}]
if {[string first UIC-021 $old_sup] == -1} {unsuppress_message UIC-021}


# Other constraints
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   827
set_clock_groups -name func_async -asynchronous -group [get_clocks {SYS_2x_CLK \
    SYS_CLK}] -group [get_clocks {PCI_CLK v_PCI_CLK}] -group [get_clocks \
    {SDRAM_CLK v_SDRAM_CLK SD_DDR_CLK SD_DDR_CLKn}]
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   828
set_clock_groups -name my_occ_clock_groups -asynchronous -group [get_clocks \
    {ate_clk}] -group [get_clocks {SYS_2x_CLK SYS_CLK SDRAM_CLK v_SDRAM_CLK \
    SD_DDR_CLK SD_DDR_CLKn PCI_CLK v_PCI_CLK}]
# MD5_SIGNATURE: 7DECCCC94F53D6EC5D47B979B489CD01 
