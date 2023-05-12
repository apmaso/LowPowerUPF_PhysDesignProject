alias s "set top_design simple_and"
alias fs "set top_design fifo1_sram"
alias f "set top_design fifo1"
alias o "set top_design ORCA_TOP"
alias e "set top_design ExampleRocketSystem"
set_db timing_report_fields "delay arrival cell timing_point"
history keep 100
set systemTime [clock seconds]
set timefield  [clock format $systemTime -format %y-%m-%d_%H-%m]
set_db stdout_log genus.log.$timefield
set_db command_log genus.cmd.$timefield

