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


# ORCA
# The RTL version does not currently have macros
# The one pulled from a lab does have macros, but no RTL.  Similar to the version with RTL.
# Below is an effort to get the design pulled from a lap working for ICC2
# Original lab had sram_lp memories, but the NDMs don't seem to be build correctly for the current libraries.  Converted code to regular SRAMs.
set top_design ORCA_TOP
set FCL 1
set add_ios 0
set pad_design 0
set design_size {1000 800}
set design_io_border 10
set dc_floorplanning 1
set enable_dft 1
set innovus_enable_manual_macro_placement 1
set split_constraints 0

# This is the raw RTL without SRAMS
#set rtl_list [list [glob /pkgs/synopsys/32_28nm/SAED_EDK32.28nm_REF_v_15032018/SAED32_EDK/references/orca/dc/rtl/*.vhd ] ../rtl/MUX21X2.sv ]
# This is hacked P&R netlist with SRAMs and test and level shifters removed.
set rtl_list [list ../rtl/$top_design.sv ]

set slow_corner "ss0p75vn40c ss0p75vn40c_i0p95v ss0p75vn40c_i0p75v ss0p95vn40c ss0p95vn40c_i0p75v"
#set slow_corner "ss0p95vn40c_i0p95v ss0p95vn40c "
set fast_corner "ff0p95vn40c ff0p95vn40c_i1p16v ff0p95vn40c_i0p95v ff1p16vn40c ff1p16vn40c_i1p16v ff1p16vn40c_i0p95v"
set slow_metal 1p9m_Cmax_-40
set fast_metal 1p9m_Cmax_-40

set synth_corners $slow_corner
set synth_corners_slow $slow_corner
set synth_corners_fast $fast_corner

set lib_types "stdcell_hvt stdcell_rvt stdcell_lvt sram"
# Get just the main standard cells, srams
set sub_lib_type "saed32?vt_ saed32sram_ saed32?vt_ulvl_ saed32?vt_dlvl_ "

# Full MCMM Corners
if { 0 } {
    set corners ""
    #Add Worst corners
    set corners "$corners ss0p75vn40c ss0p75vn40c_i0p95v ss0p75vn40c_i0p75v ss0p95vn40c ss0p95vn40c_i0p75v"
    #Add Best corners
    set corners "$corners ff0p95vn40c ff0p95vn40c_i1p16v ff0p95vn40c_i0p95v ff1p16vn40c ff1p16vn40c_i1p16v ff1p16vn40c_i0p95v"
    #Add Leakage corners
    set corners "$corners ff0p95v125c f0p95v125c_i1p16v ff0p95v125c_i0p95v ff1p16v125c ff1p16v125c_i1p16v ff1p16v125c ff1p16v125c_i0p95v"
    set lib_types "stdcell_hvt stdcell_rvt stdcell_lvt sram_lp"
    # Get the main standard cells, and also the level shifters.  Plus srams.
    set sub_lib_type "saed32?vt_ saed32?vt_ulvl_ saed32?vt_dlvl_ saed32sram_"
}

#set topdir /u/$env(USER)/PSU_RTL2GDS
set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]

#declaring sub blocks
set sub_block {SDRAM_TOP 
				BLENDER_0 
				PCI_TOP 
				CONTEXT_MEM 
				RISC_CORE 
				CLOCKING 
				BLENDER_1 
				PARSER 
				}
				
set sub_block_I {I_SDRAM_TOP I_BLENDER_1  I_BLENDER_0 I_RISC_CORE I_CONTEXT_MEM I_PCI_TOP I_PARSER I_CLOCKING}
				
set macro_block {I_SDRAM_TOP I_PCI_TOP I_RISC_CORE I_CONTEXT_MEM}



