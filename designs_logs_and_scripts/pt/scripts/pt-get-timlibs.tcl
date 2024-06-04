


# Set up the search path to the librariesi
# One of the typical lines of the resultant search path is:
# /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm
# /          $lib_dir                   /lib/ $lib_type /db_nldm
# The variables are defined in design_config.tcl
set search_path ""
foreach i $lib_types { lappend search_path $lib_dir/lib/$i/db_nldm }




# Smartly find all the libraries you need
# Will end up with sometihng like this: 
# saed32hvt_ss0p75v125c.db saed32hvt_ss0p95v125c.db saed32rvt_ss0p75v125c.db saed32rvt_ss0p95v125c.db saed32lvt_ss0p75v125c.db saed32lvt_ss0p95v125c.db saed32sram_ss0p95v125c.db dw_foundation.sldb *
# This contains all the VTs you want, all the corners you want, and designate any library subtypes like level shifters you might want
# The variables are defined in the design_config.tcl
# Example:
#     saed32hvt_ss0p75v125c.db
#     |sub_lib  corner    .db
set link_library ""
foreach i $search_path {
  foreach k $corners {
      foreach m $sub_lib_type {
        foreach j [glob -nocomplain $i/$m$k.db ] {
          lappend link_library [file tail $j ]
        }
      }
  }
}
lappend link_library *


# Add the local directory "." to the search path after we have used it in the above loop.  If you add . before hand, it will cause some problems.
lappend search_path .

