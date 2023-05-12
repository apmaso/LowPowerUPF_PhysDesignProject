set lib_dir /pkgs/synopsys/2020/32_28nm/SAED32_EDK

set top_design ${top_design}
set FCL 1
set add_ios 0
set pad_design 0
set design_size {100 100}
set design_io_border 10
set dc_floorplanning 1
set enable_dft 0
set innovus_enable_manual_macro_placement 0
set split_constraints 0

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
#set topdir [ lindex [ regexp -inline "(.*)\(syn\|pt\|apr\)" [pwd] ] 1 ]


