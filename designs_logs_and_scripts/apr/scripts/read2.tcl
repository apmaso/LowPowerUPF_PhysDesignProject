
if { [ info exists dc_floorplanning ] && $dc_floorplanning } {
   set verilog_file ../../syn/outputs/${top_design}.dc.vg
} else {
   set verilog_file ../../syn/outputs/${top_design}.dct.vg
}


file delete -force $my_lib 

# Adding the tech file causes problems later with missing routing directions for some reason.
#create_lib $my_lib -ref_libs $libs -tech $tf_dir/saed32nm_1p9m_mw.tf 

create_lib $my_lib -ref_libs $libs  -use_technology_lib [lindex $libs 0 ] 

create_block ${top_design}
open_block ${top_design}

#import_designs $verilog_file \
#	-format verilog \
#	-cel $top_design \
#	-top $top_design
read_verilog  -top $top_design  $verilog_file





# Read the SCANDEF information created by DFTC
# read_def $scandef_file


