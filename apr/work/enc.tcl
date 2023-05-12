alias fs set top_design fifo1_sram
alias f set top_design fifo1
alias o set top_design ORCA_TOP
alias e set top_design ExampleRocketSystem

set_table_style -name report_timing -max_widths { 8,6,23,70} -no_frame_fix_width
set_global report_timing_format  {delay arrival slew load fanout cell hpin}

history keep 100
#set systemTime [clock seconds]
#set timefield  [clock format $systemTime -format %y-%m-%d_%H-%m]
#set_db log_file innovus.log.$timefield
#set_db logv_file innovus.cmd.$timefield

