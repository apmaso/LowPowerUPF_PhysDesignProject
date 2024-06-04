source -echo -verbose ../../$top_design.design_config.tcl

# List all current designs
set this_design [ list_designs ]

# If there are existing designs reset/remove them
if { $this_design != 0 } {
  # To reset the earlier designs
  reset_design
  remove_design -designs
}

source ../scripts/dc-get-timlibs.tcl

source ../scripts/dct-getcreate-mwlib.tcl


read_ddc ../outputs/${top_design}.dct.ddc

