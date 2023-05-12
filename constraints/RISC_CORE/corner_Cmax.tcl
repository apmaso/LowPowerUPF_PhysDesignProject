################################################################################
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:50 2020
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



# set_timing_derate for corner Cmax
set_timing_derate -early 0.95 -cell_delay -clock [current_design]
set_timing_derate -early 0.95 -cell_delay -data [current_design]
set_timing_derate -early 0.95 -net_delay -clock [current_design]
set_timing_derate -early 0.95 -net_delay -data [current_design]
set_timing_derate -early 0.95 -net_delay -clock -dynamic [current_design]
set_timing_derate -early 0.95 -net_delay -data -dynamic [current_design]

# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line 9
set_operating_conditions -library saed32lvt_ss0p75vn40c -analysis_type \
    on_chip_variation ss0p75vn40c
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   831
set_voltage 0 -object_list {VSS}
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   832
set_voltage 0.75 -object_list {VDD}
# /u/sdurga2/Summer2020/PSU_RTL2GDS/constraints/ORCA_TOP_test_worst.sdc, line \
#   83
set_voltage 0.95 -object_list {VDDH}
set_scaling_lib_group -all
read_parasitic_tech -tlup $tlu_dir/saed32nm_1p9m_Cmax.tluplus -layermap $tlu_dir/saed32nm_tf_itf_tluplus.map -name Cmax.tlup
set_parasitic_parameters -early_spec Cmax.tlup -early_temperature -40 \
    -late_spec Cmax.tlup -late_temperature -40
# MD5_SIGNATURE: 2759FE6BA67D9B09AEC94D2D13743DDF 
