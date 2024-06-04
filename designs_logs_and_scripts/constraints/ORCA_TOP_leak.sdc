###################################################################

# Created by write_sdc for scenario [leak] on Sat Feb 29 19:46:14 2020

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_operating_conditions -analysis_type on_chip_variation ff0p95v125c -library saed32lvt_ff0p95v125c
#create_voltage_area -name PD_RISC_CORE  -coordinate {582.92 10.032 1003.2 190.608}  -guard_band_x 0  -guard_band_y 0  [get_cells I_RISC_CORE]
set_voltage 0  -min 0  -object_list VSS
set_voltage 0.95  -min 0.95  -object_list VDD
set_voltage 1.16  -min 1.16  -object_list VDDH
