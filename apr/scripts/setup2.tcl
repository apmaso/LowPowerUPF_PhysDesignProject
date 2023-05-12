
# Look for directories like this "/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/ndm"
# This may not be used
set search_path ""
foreach i $lib_types { lappend search_path $lib_dir/lib/$i/ndm }


#set synthetic_library dw_foundation.sldb

# Changed to only be the slow corner libraries
#set target_library "saed32hvt_ss0p75v125c.db saed32lvt_ss0p75v125c.db saed32rvt_ss0p75v125c.db"
# enable the lvt and rvt library for now at the slow corner
#set target_library "saed32lvt_ss0p75v125c.db saed32rvt_ss0p75v125c.db saed32io_wb_ss0p95v125c_2p25v.db"


set libs ""
# should we use _pg_c.ndm, _c.ndm, dlvl_v.ndm, _ulvl_v.ndm
set suffix "c.ndm 5v.ndm v.ndm"


# Look for files like this "/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/ndm/saed32hvt$suffix"
set libs ""
foreach i $lib_types { 
    foreach j $suffix {
        foreach k $sub_lib_type {
          foreach m [glob -nocomplain $lib_dir/lib/$i/ndm/$k$j ] {
            lappend libs $m
          }
        }
    }
}


set tf_dir "$lib_dir/tech/milkyway/"
set tlu_dir "$lib_dir/tech/star_rcxt/"

#set_tlu_plus_files  -max_tluplus $tlu_dir/saed32nm_1p9m_Cmax.tluplus  \
#                    -min_tluplus $tlu_dir/saed32nm_1p9m_Cmin.tluplus  \
#                    -tech2itf_map  $tlu_dir/saed32nm_tf_itf_tluplus.map



