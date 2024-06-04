#####################################################
# Main Code
####################################################
source -echo -verbose ../../${top_design}.design_config.tcl

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


source -echo -verbose ../../${top_design}.design_options.tcl

source -echo -verbose ../scripts/floorplan-innovus.tcl

