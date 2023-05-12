create_library_set -name worst_libs_vddh -timing {
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ss0p95vn40c.lib 
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p95vn40c.lib 
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ss0p95vn40c.lib 
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_dlvl_ss0p75vn40c_i0p95v.lib 
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_lvt/db_nldm/saed32lvt_ulvl_ss0p95vn40c_i0p75v.lib 
/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/sram/db_nldm/saed32sram_ss0p95vn40c.lib}
update_delay_corner -name worst_corner -power_domain PD_RISC_CORE -library_set worst_libs_vddh

#/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_dlvl_ss0p75vn40c_i0p95v.lib 
#/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_hvt/db_nldm/saed32hvt_ulvl_ss0p95vn40c_i0p75v.lib
#/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_dlvl_ss0p75vn40c_i0p95v.lib 
#/pkgs/synopsys/2020/32_28nm/SAED32_EDK/lib/stdcell_rvt/db_nldm/saed32rvt_ulvl_ss0p95vn40c_i0p75v.lib 


