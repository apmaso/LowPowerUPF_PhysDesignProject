################################################################################
#
# Design name:  PCI_TOP
#
# Created by icc2 split_constraints on Mon Aug 10 17:12:55 2020
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


set dirName [file dirname [file normalize [info script]]]
set extName "tcl"
set_user_units -input -type time -value 1ns
set_user_units -input -type resistance -value 1MOhm
set_user_units -input -type capacitance -value 1fF
set_user_units -input -type voltage -value 1V
set_user_units -input -type current -value 1uA
set_user_units -output -type time -value 1ns
set_user_units -output -type resistance -value 1MOhm
set_user_units -output -type capacitance -value 1fF
set_user_units -output -type voltage -value 1V
set_user_units -output -type current -value 1uA

set cornerNames [list Cmax Cmin]
foreach cornerName $cornerNames {
  create_corner $cornerName
}

set modeNames [list func test]
foreach modeName $modeNames {
  create_mode $modeName
}

create_scenario -name func_worst -mode func -corner Cmax
set_scenario_status func_worst -setup true -hold false -leakage_power true \
    -dynamic_power true -max_transition true -max_capacitance true \
    -min_capacitance true -cell_em false -signal_em false -active true
set_scenario_si_filtering func_worst -si_xtalk_composite_aggr_mode statistical

create_scenario -name func_best -mode func -corner Cmin
set_scenario_status func_best -setup false -hold false -leakage_power true \
    -dynamic_power true -max_transition true -max_capacitance true \
    -min_capacitance true -cell_em false -signal_em false -active true
set_scenario_si_filtering func_best -si_xtalk_composite_aggr_mode statistical

create_scenario -name test_worst -mode test -corner Cmax
set_scenario_status test_worst -setup true -hold false -leakage_power true \
    -dynamic_power true -max_transition true -max_capacitance true \
    -min_capacitance true -cell_em false -signal_em false -active true
set_scenario_si_filtering test_worst -si_xtalk_composite_aggr_mode statistical

create_scenario -name test_best -mode test -corner Cmin
set_scenario_status test_best -setup false -hold false -leakage_power true \
    -dynamic_power true -max_transition true -max_capacitance true \
    -min_capacitance true -cell_em false -signal_em false -active true
set_scenario_si_filtering test_best -si_xtalk_composite_aggr_mode statistical

foreach cornerName $cornerNames {
  current_corner $cornerName
  source ${dirName}/corner_${cornerName}.${extName}
}

foreach modeName $modeNames {
  current_mode $modeName
  source ${dirName}/mode_${modeName}.${extName}
}

current_scenario func_worst
source ${dirName}/scenario_func_worst.${extName}
if {[file exists ${dirName}/func_worst_act.${extName}]} {
  source ${dirName}/func_worst_act.${extName}
}
current_scenario func_best
source ${dirName}/scenario_func_best.${extName}
if {[file exists ${dirName}/func_best_act.${extName}]} {
  source ${dirName}/func_best_act.${extName}
}
current_scenario test_worst
source ${dirName}/scenario_test_worst.${extName}
if {[file exists ${dirName}/test_worst_act.${extName}]} {
  source ${dirName}/test_worst_act.${extName}
}
current_scenario test_best
source ${dirName}/scenario_test_best.${extName}
if {[file exists ${dirName}/test_best_act.${extName}]} {
  source ${dirName}/test_best_act.${extName}
}

source ${dirName}/design.${extName}

if {[file exists ${dirName}/cts.${extName}]} {
  source ${dirName}/cts.${extName}
}
current_mode func
current_corner Cmax
# End of script
# MD5_SIGNATURE: BCBEE64C7E9E7B4B4B031341BA58B2F4 
