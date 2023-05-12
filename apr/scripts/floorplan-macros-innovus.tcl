source -echo -verbose ../../$top_design.design_config.tcl

set designs [get_db designs * ]
if { $designs != "" } {
  delete_obj $designs
}

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default

source ../scripts/innovus-get-timlibslefs.tcl
source ../../constraints/${top_design}.mmmc.sdc

set init_design_netlisttype Verilog
set init_verilog ../../syn/outputs/${top_design}.genus.vg
set init_top_cell $top_design
set init_pwr_net VDD
set init_gnd_net VSS


init_design

set_interactive_constraint_modes [all_constraint_modes -active]


if { $pad_design } {
    # subtract off the IO width if this is a pad design.  The floorplan statement automatically includes the IO border
    set margin [expr $design_io_border - 300 ]
} else {
    set margin $design_io_border
}

floorPlan -s [lindex $design_size 0 ] [lindex $design_size 1 ] $margin $margin $margin $margin -flip s -coreMarginsBy io

#createRow -area "0.0000 0.0000 [lindex $design_size 0 ] [ lindex $design_size 1 ]" -site unit 

#placeInstance fifomem/genblk1_0__U 500 500 W -fixed

if { $add_ios } {
    source ../scripts/floorplan-ios-innovus.tcl
    loadIoFile ${top_design}.io
}

source -echo -verbose ../../${top_design}.design_options.tcl

if { $innovus_enable_manual_macro_placement == 0} {
    # Running automatic macro placement.
    placeAIO  
} elseif { $innovus_enable_manual_macro_placement == 1} {
    # Placing IOs and running macro placement scripts. 
    placeAIO -onlyAIO 
    # source -echo -verbose ../../${top_design}.macro_placement_innovus.tcl
}
#defOut -noStdCells -noTracks -noSpecialNet -noTracks  "../outputs/${top_design}.floorplan.innovus.macros.def"

deselectAll
select_obj [ get_ports * ]
select_obj [ get_db ports * ]
select_obj [ get_db insts -if ".is_black_box==true" ]
select_obj [ get_db insts -if ".is_pad==true" ]
set_db [get_db selected ] .place_status fixed

defOut -selected "../outputs/${top_design}.floorplan.innovus.macros.def"
