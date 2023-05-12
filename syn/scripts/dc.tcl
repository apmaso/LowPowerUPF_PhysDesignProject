source -echo -verbose ../../$top_design.design_config.tcl


# List all current designs
set this_design [ list_designs ]

# If there are existing designs reset/remove them
if { $this_design != 0 } {
  # To reset the earlier designs
  reset_design
  remove_design -designs
}

if { ! [ info exists top_design ] } {
   set top_design fifo1
}

source ../scripts/dc-get-timlibs.tcl


# Analyzing the files for the design
analyze $rtl_list -autoread -define SYNTHESIS

# Elaborate the FIFO design
elaborate ${top_design} 

if { [ info exists add_ios ] && $add_ios } {
   source -echo -verbose ../scripts/add_ios.tcl
   # Source the design dependent code that will put IOs on different sides
   source ../../$top_design.add_ios.tcl
}

change_names -rules verilog -hierarchy

# Load the timing and design constraints
source -echo -verbose ../../constraints/${top_design}.sdc

# any additional non-design specific constraints
set_max_transition 0.5 [current_design ]

# Duplicate any non-unique modules so details can be different inside for synthesis
set_dont_use [get_lib_cells */DELLN* ]

uniquify

#compile with ultra features and with scan FFs
compile_ultra  -scan  -no_autoungroup
change_names -rules verilog -hierarchy

# output reports
set stage dc
report_qor > ../reports/${top_design}.$stage.qor.rpt
report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -delay max -input -tran -cross -sig 4 -derate -net -cap  -max_path 10000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing  > ../reports/${top_design}.$stage.check_timing.rpt
check_design > ../reports/${top_design}.$stage.check_design.rpt
check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt

# output netlist
write -hier -format verilog -output ../outputs/${top_design}.$stage.vg
write -hier -format ddc -output ../outputs/${top_design}.$stage.ddc
save_upf ../outputs/${top_design}.$stage.upf

