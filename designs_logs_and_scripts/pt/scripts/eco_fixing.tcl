#script for fixing eco on drc, timing and power

#command for fixing power
fix_eco_power -pattern_priority {HVT RVT LVT}

#command for fixing capacitance
fix_eco_drc -max_capacitance -buffer_list {NBUFFX8_HVT}

#command for fixing transition
fix_eco_drc -max_transition -buffer_list {NBUFFX8_HVT}

#command for fixing setup timing violations
fix_eco_timing -type setup

#command for fixing hold timing violations
fix_eco_timing -type hold -buffer_list {NBUFFX8_HVT}

#command for fixing final leakage power
fix_eco_power -pattern_priority {HVT RVT LVT}

#writing eco changes
remote_execute {write_changes -format icc2tcl -output fixed_eco.tcl}

