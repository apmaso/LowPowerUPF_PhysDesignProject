set lib_dir /pkgs/synopsys/2020/32_28nm/SAED32_EDK

# Decoder ring for the libraries
# You will need to follow another example or look in the library directories to understand.

# lib_types is used for the dc/dct linking variables and ICC2 NDM lcoations.
# /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm
# /          $lib_dir                   /lib/ $lib_type /db_nldm

# link_library, Target_library use the sub_lib_types and corner variables. 
# For sub_lib_types and corner:
# Example:
#     saed32hvt_ss0p75v125c.db
#     |sub_lib  corner    .db
# The current flow tries to find all sub_lib and all corners in all the search paths.  Any match will be put in the library list.
# Wild cards can be used, but be careful.  Multiple matches can occur in ways you don't want.

# For the target library, the same method is used as the link library except only HVT and RVT lib_types are used.

# ICC2 NDM choosing also uses the sub_lib_types so that only the required libraries and extras are not loaded.

# Risc V
set top_design ExampleRocketSystem
set add_ios 0
set pad_design 0
set design_size { 1850 1380  } 
set design_io_border 10
set dc_floorplanning 1
set rtl_list [list ../rtl/$top_design.sv ]
set slow_corner "ss0p95v125c_2p25v ss0p95v125c"
set fast_corner "ff1p16vn40c_2p75v ff1p16vn40c"
set synth_corners $slow_corner
set synth_corners_slow $slow_corner
set synth_corners_fast $fast_corner
set slow_metal Cmax_125
set fast_metal Cmax_125
set lib_types "stdcell_hvt stdcell_rvt stdcell_lvt sram"
# Get just the main standard cells, srams
set sub_lib_type "saed32?vt_ saed32sram_"

#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]

# Set number of cores to use.  Be cautious with this.  If a machine is loaded, it is faster to use 1 cpu than 
# multiple cpu on a loaded machine
if {[info exists synopsys_program_name]} {
        if { $synopsys_program_name == "dc_shell" } {
           set_host_options -max_cores 4
        } 
        if { $synopsys_program_name == "icc2_shell" } {
           set_host_options -max_cores 4
        }
} elseif {[get_db root: .program_short_name] == "innovus"} {
  setMultiCpuUsage -localCpu 4 
} elseif {[get_db root: .program_short_name] == "genus"} {
  set_db / .max_cpus_per_server 4 
}

set innovus_enable_manual_macro_placement 1
set enable_dft 0

set FCL 0
set split_constraints 0

