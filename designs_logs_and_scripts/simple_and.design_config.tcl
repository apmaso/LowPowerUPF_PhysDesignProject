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

# fifo1
set top_design simple_and
set add_ios 0
set pad_design 0
set rtl_list [list ../rtl/$top_design.sv ]
set slow_corner "ss0p95v125c"
set fast_corner "ff1p16vn40c"
set synth_corners $slow_corner
set slow_metal Cmax_125
set fast_metal Cmax_125
set lib_types "stdcell_hvt stdcell_rvt stdcell_lvt"
# Get just the main standard cells, srams and IOs
set sub_lib_type "saed32?vt_ "

#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]


