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

read_ddc ../outputs/${top_design}.dc.ddc

