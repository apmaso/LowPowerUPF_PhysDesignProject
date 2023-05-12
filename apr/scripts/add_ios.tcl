#####################################################
proc insert_io { port side} {
  set this_io io_${side}_${port}
  if {  $side == "t"   } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/B8I1025_NS
    set side 2
  }
  if { $side == "b"  } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/B8I1025_NS
    set side 4
  }
  if {  $side == "r"  } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/B8I1025_NS
    set side 3
  }
  if { $side == "l"  } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/B8I1025_NS
    set side 1
  }
#  set_pad_physical_constraints -side $side -pad_name $this_io
  set pins [ get_pins -of_obj [ get_net $port ] ]
  foreach_in i $pins { disconnect_net [get_net $port ] $i }
  connect_net [get_net $port ]  $this_io/PADIO
  create_net ${this_io}_net
  foreach_in i $pins { connect_net ${this_io}_net $i }
  #DIN is input to IO_PAD
  #DOUT is output of IO_PAD
  #EN is the IO_PAD enable to output
  if { [get_attribute [get_port $port ] direction ] == "in" } {
     connect_net [get_nets -all *Logic0* ] ${this_io}/EN 
     connect_net [get_nets -all *Logic1* ] ${this_io}/R_EN 
     connect_net ${this_io}_net ${this_io}/DOUT
  } else {
     connect_net [get_nets -all *Logic1* ] $this_io/EN 
     connect_net [get_nets -all *Logic0* ] $this_io/R_EN 
     connect_net ${this_io}_net $this_io/DIN
  }
}
####################################################

# Source common setup file

if { [ sizeof_coll [ get_nets  -quiet *Logic0*  ] ] == 0 } { 
  create_net -ground *Logic0*  
}
if { [ sizeof_coll [ get_nets  -quiet *Logic1*  ] ] == 0 } { 
  create_net -power *Logic1*  
}
# ICC uses SNPS_LOGIC1 


#foreach net {VDD} { derive_pg_connection -power_net $net -power_pin $net -create_ports top}
#foreach net {VSS} { derive_pg_connection -ground_net $net -ground_pin $net -create_ports top}

create_cell io_e_vdd1 saed32io_wb_ss0p95v125c_2p25v/VDD_EW
create_cell io_e_vss1 saed32io_wb_ss0p95v125c_2p25v/VSS_EW
create_cell io_e_vddio1 saed32io_wb_ss0p95v125c_2p25v/IOVDD_EW
create_cell io_e_vssio1 saed32io_wb_ss0p95v125c_2p25v/IOVSS_EW
#foreach i [get_attribute  [get_cells -all io_e_v* ] full_name ] { set_pad_physical_constraints -side 3 -pad_name $i }

create_cell io_n_vdd1 saed32io_wb_ss0p95v125c_2p25v/VDD_NS
create_cell io_n_vss1 saed32io_wb_ss0p95v125c_2p25v/VSS_NS
create_cell io_n_vddio1 saed32io_wb_ss0p95v125c_2p25v/IOVDD_NS
create_cell io_n_vssio1 saed32io_wb_ss0p95v125c_2p25v/IOVSS_NS
#foreach i [get_attribute  [get_cells -all io_n_v* ] full_name ] { set_pad_physical_constraints -side 2 -pad_name $i }

create_cell io_s_vdd1 saed32io_wb_ss0p95v125c_2p25v/VDD_NS
create_cell io_s_vss1 saed32io_wb_ss0p95v125c_2p25v/VSS_NS
create_cell io_s_vddio1 saed32io_wb_ss0p95v125c_2p25v/IOVDD_NS
create_cell io_s_vssio1 saed32io_wb_ss0p95v125c_2p25v/IOVSS_NS
#foreach i [get_attribute  [get_cells -all io_s_v* ] full_name ] { set_pad_physical_constraints -side 4 -pad_name $i }

create_cell io_w_vdd1 saed32io_wb_ss0p95v125c_2p25v/VDD_EW
create_cell io_w_vss1 saed32io_wb_ss0p95v125c_2p25v/VSS_EW
create_cell io_w_vddio1 saed32io_wb_ss0p95v125c_2p25v/IOVDD_EW
create_cell io_w_vssio1 saed32io_wb_ss0p95v125c_2p25v/IOVSS_EW
#foreach i [get_attribute  [get_cells -all io_w_v* ] full_name ] { set_pad_physical_constraints -side 1 -pad_name $i }

#create_cell io_corner_se saed32io_wb_ss0p95v125c_2p25v/CAPCORNER
#create_cell io_corner_ne saed32io_wb_ss0p95v125c_2p25v/CAPCORNER

foreach i [join [get_attribute [ get_port rdata* ] full_name ] ] {
  insert_io  $i l 
}
foreach i [ join [get_attribute [ get_port wdata* ] full_name ] ] {
  insert_io  $i r 
}
foreach i { rempty wfull }  {
  insert_io  $i t 
}
foreach i { rrst_n rclk rinc wrst_n wclk2x wclk winc }  {
  insert_io  $i b 
}

create_cell sram_example [ get_lib_cells saed32sram_*/SRAM1RW64x8 ] 

#create_floorplan -control_type width_and_height -core_width 560 -core_height 560 -left_io2core 10 -bottom_io2core 10 -right_io2core 10 -top_io2core 10

