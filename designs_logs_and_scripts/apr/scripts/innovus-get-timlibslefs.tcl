


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
set link_library_worst ""
foreach i $search_path {
  foreach k $synth_corners_slow {
      foreach m $sub_lib_type {
        foreach j [glob -nocomplain $i/$m$k.lib ] {
          lappend link_library_worst $j 
        }
      }
  }
}

set link_library_best ""
foreach i $search_path {
  foreach k $synth_corners_fast {
      foreach m $sub_lib_type {
        foreach j [glob -nocomplain $i/$m$k.lib ] {
          lappend link_library_best $j 
        }
      }
  }
}
#lappend link_library *

set lef_path ""
foreach i $lib_types { 
   foreach m $sub_lib_type {
      # Trim the "_" that is needed for synopsys timing library searching.  We don't want it for lefs.
      set n [ string trimright $m "_" ] 
      # Change a ? to a * since there are some extra characters in the lef path in the same spot.
      set n [ regsub {\?} $n {*} ]
      # further munging the sub_lib_type so that it matches the lef file name.  Synopsys was not fully consistent in their naming.
      set n [ regsub {_} $n {*} ]
      set n [ regsub {saed32} $n {saed32*} ]

      # Current solution for getting PLL .lef files.
      if { $n == "saed32*pll"} {
		set n "saed32_PLL"
      }

      foreach j [ glob -nocomplain $lib_dir/lib/$i/lef/${n}*.lef ] {
         lappend lef_path $j
      }
   }
}


# Add the local directory "." to the search path after we have used it in the above loop.  If you add . before hand, it will cause some problems.
lappend search_path .

# Currently copy all the lef files from original locations and delete the BUSBITCHARS lines.  The "_" of  "_<>" is a problem.
foreach i [glob -nocomplain saed*.lef ] { file delete $i }
foreach i $lef_path {
   exec grep -v BUSBITCHARS $i > [file tail $i ]
}
set init_lef_file "../../cadence_cap_tech/tech.lef [glob saed*.lef]"


