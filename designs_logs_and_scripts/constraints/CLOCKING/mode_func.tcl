################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:59 2020
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
#   virtual_:  Instance 'I_CLOCKING' (top mode 'func')

set old_sup ""
redirect -variable old_sup {print_suppressed_messages}
suppress_message UIC-021


#
# Boundary constraints for instance 'I_CLOCKING' (top mode 'func')
#

# Clocks
create_clock -add -name {PCI_CLK} -period 7.50000  \
	-waveform {0.00000 3.75000} [get_ports {pclk_in}]
create_clock -name {v_PCI_CLK} -period 7.50000 -waveform {0.00000 3.75000} 
create_clock -add -name {SYS_2x_CLK} -period 2.40000  \
	-waveform {0.00000 1.20000} [get_ports {sys_2x_clk_in}]
create_generated_clock -name SYS_CLK -divide_by 2 -source [get_ports { \
	sys_2x_clk_in}] -add -master_clock {SYS_2x_CLK} [get_pins { \
	sys_clk_in_reg/Q}]
create_clock -add -name {SDRAM_CLK} -period 4.10000  \
	-waveform {0.00000 2.05000} [get_ports {sdram_clk_in}]
create_clock -name {v_SDRAM_CLK} -period 4.10000 -waveform {0.00000 2.05000} 
create_clock -name {SD_DDR_CLK} -period 4.10000 -waveform {0.00000 2.05000} 
create_clock -name {SD_DDR_CLKn} -period 4.10000 -waveform {2.05000 4.10000} 

# Virtual clocks

# Virtual clock virtual_PCI_CLK.top_r based on original clock PCI_CLK 
create_clock -name {virtual_PCI_CLK.top_r} -period 7.50000  \
	-waveform {0.00000 3.75000} 
group_path -priority -1 -name {PCI_CLK} -to [get_clock  \
	{virtual_PCI_CLK.top_r}]
# Virtual clock virtual_PCI_CLK.top_f based on original clock PCI_CLK 
create_clock -name {virtual_PCI_CLK.top_f} -period 7.50000  \
	-waveform {0.00000 3.75000} 
group_path -priority -1 -name {PCI_CLK} -to [get_clock  \
	{virtual_PCI_CLK.top_f}]
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
# Virtual clock virtual_SYS_2x_CLK.top_r based on original clock SYS_2x_CLK 
create_clock -name {virtual_SYS_2x_CLK.top_r} -period 2.40000  \
	-waveform {0.00000 1.20000} 
group_path -priority -1 -name {SYS_2x_CLK} -to [get_clock  \
	{virtual_SYS_2x_CLK.top_r}]
# Virtual clock virtual_SYS_2x_CLK.top_f based on original clock SYS_2x_CLK 
create_clock -name {virtual_SYS_2x_CLK.top_f} -period 2.40000  \
	-waveform {0.00000 1.20000} 
group_path -priority -1 -name {SYS_2x_CLK} -to [get_clock  \
	{virtual_SYS_2x_CLK.top_f}]
# Virtual clock virtual__no_clock_ based on original clock <no original clock>
create_clock -name {virtual__no_clock_} -period 1000.00000
set_max_delay 1000.00000 -from {virtual__no_clock_}
set_max_delay 1000.00000 -to {virtual__no_clock_}
# Virtual clock virtual_PCI_CLK.6_r based on original clock PCI_CLK 
create_clock -name {virtual_PCI_CLK.6_r} -period 7.50000  \
	-waveform {0.00000 3.75000} 
group_path -priority -1 -name {PCI_CLK} -to [get_clock  \
	{virtual_PCI_CLK.6_r}]
# Virtual clock virtual_SDRAM_CLK.1_r based on original clock SDRAM_CLK 
create_clock -name {virtual_SDRAM_CLK.1_r} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SDRAM_CLK} -to [get_clock  \
	{virtual_SDRAM_CLK.1_r}]
# Virtual clock virtual_SDRAM_CLK.1_f based on original clock SDRAM_CLK 
create_clock -name {virtual_SDRAM_CLK.1_f} -period 4.10000  \
	-waveform {0.00000 2.05000} 
group_path -priority -1 -name {SDRAM_CLK} -to [get_clock  \
	{virtual_SDRAM_CLK.1_f}]
# Virtual clock virtual_SYS_CLK.1_r.2 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.1_r.2} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.1_r.2}]
# Virtual clock virtual_SYS_CLK.1_r.3 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.1_r.3} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.1_r.3}]
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
# Virtual clock virtual_SYS_CLK.5_r.5 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.5_r.5} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.5_r.5}]
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
# Virtual clock virtual_SYS_CLK.7_r.3 based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.7_r.3} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.7_r.3}]
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
# Virtual clock virtual_SYS_CLK.top_r based on original clock SYS_CLK 
create_clock -name {virtual_SYS_CLK.top_r} -period 4.80000  \
	-waveform {0.00000 2.40000} 
group_path -priority -1 -name {SYS_CLK} -to [get_clock  \
	{virtual_SYS_CLK.top_r}]
# Virtual clock virtual_SYS_2x_CLK.4_r based on original clock SYS_2x_CLK 
create_clock -name {virtual_SYS_2x_CLK.4_r} -period 2.40000  \
	-waveform {0.00000 1.20000} 
group_path -priority -1 -name {SYS_2x_CLK} -to [get_clock  \
	{virtual_SYS_2x_CLK.4_r}]

# Exceptions outside of the budget area

# Exceptions that straddle the budget boundary

# Exceptions inside of the budget area

# Boundary constants
set_case_analysis 0 [get_ports {test_mode}]
set_case_analysis 0 [get_ports {shutdown}]
if {[string first UIC-021 $old_sup] == -1} {unsuppress_message UIC-021}


# Other constraints
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_func_worst.sdc, line \
#   793
set_clock_groups -name func_async -asynchronous -group [get_clocks {SYS_2x_CLK \
    SYS_CLK}] -group [get_clocks {PCI_CLK v_PCI_CLK}] -group [get_clocks \
    {SDRAM_CLK v_SDRAM_CLK SD_DDR_CLK SD_DDR_CLKn}]
# MD5_SIGNATURE: 150326A333D1B8480620B0E531AD3702 
