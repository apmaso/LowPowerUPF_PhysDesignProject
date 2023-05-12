# Remove any existing MW direotory
exec rm -rf ${top_design}.mw

#creating milky way physical library linking information
# you will end up with something like this:
# /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/milkyway/saed32nm_hvt_1p9m /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/milkyway/saed32nm_rvt_1p9m /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/milkyway/saed32nm_lvt_1p9m /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/sram/milkyway/SRAM32NM
# Sometimes there are two directories of milkyway directories, so try using the first one if there are more than one.  This works for now.
# Example:
#   /pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/milkyway/saed32nm_hvt_1p9m
#   /            $lib_dir                 /lib/ $lib_type /milkyway/ first_directory_found
set mw_lib ""
foreach i $lib_types { lappend mw_lib [lindex [glob -type d $lib_dir/lib/$i/milkyway/* ] 0 ] }

# Form the Tech File and TLUplus parasitic information pointers
set tf_dir $lib_dir/tech/milkyway
set tlu_dir $lib_dir/tech/star_rcxt/
set_tlu_plus_files  -max_tluplus $tlu_dir/saed32nm_1p9m_Cmax.tluplus  \
                    -min_tluplus $tlu_dir/saed32nm_1p9m_Cmin.tluplus  \
                    -tech2itf_map  $tlu_dir/saed32nm_tf_itf_tluplus.map

# And create the Milkyway library for our design database storage
create_mw_lib ${top_design}.mw -technology $tf_dir/saed32nm_1p9m_mw.tf  -mw_reference_library $mw_lib -open


