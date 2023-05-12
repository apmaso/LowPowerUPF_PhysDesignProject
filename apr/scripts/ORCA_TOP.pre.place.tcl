if { [info exists synopsys_program_name ] } {
    source -echo -verbose ../scripts/fix_macro_outputs_place.tcl
    echo READING SCANDEF
    read_def ../../syn/outputs/ORCA_TOP.dct.scan.def
    echo FINISHED READING SCANDEF

    # Creating seperate voltage area for core area. 
    create_voltage_area -power_domains PD_RISC_CORE -region {{11 400} {450 640}}
    # Commit the UPF settings for ORCA.
    commit_upf
} else {
  source ../scripts/update_vddh_libs.tcl

  setEcoMode -batchMode true

  foreach_in_collection i [ get_cells -hier -filter "ref_name=~LSD*||ref_name==LSUP" ] {
     set vt [regsub  ".VT" [get_db $i .base_cell.base_name ] LVT ] 
      ecoChangeCell -inst [get_db $i .name ] -cell $vt  
  }
  setEcoMode -batchMode false
}

