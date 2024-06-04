#####################################################
proc insert_io { port side} {
  set this_io io_${side}_${port}
  if {  $side == "t"   } {
   if { [get_attribute [get_ports $port ] direction ] == "in" } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/I1025_NS
   } else {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/D8I1025_NS
   }
  }
  if { $side == "b"  } {
   if { [get_attribute [get_ports $port ] direction ] == "in" } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/I1025_NS
   } else {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/D8I1025_NS
   }
  }
  if {  $side == "r"  } {
   if { [get_attribute [get_ports $port ] direction ] == "in" } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/I1025_NS
   } else {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/D8I1025_NS
   }
  }
  if { $side == "l"  } {
   if { [get_attribute [get_ports $port ] direction ] == "in" } {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/I1025_NS
   } else {
    create_cell $this_io saed32io_wb_ss0p95v125c_2p25v/D8I1025_NS
   }
  }
  set pins [ get_pins -of_obj [ get_net $port ] ]
  foreach_in i $pins { disconnect_net [get_net $port ] $i }
  set port_net [get_nets -quiet $port ]

  # If only a port is created, the related net is not created and connected to the port.  Do that here.
  if { [sizeof_collection $port_net ] == 0 } { 
      create_net $port 
      connect_net $port [get_ports $port ]
  }

  connect_net [get_net $port ]  $this_io/PADIO
  create_net ${this_io}_net
  foreach_in i $pins { connect_net ${this_io}_net $i }
  #DIN is input to IO_PAD
  #DOUT is output of IO_PAD
  #EN is the IO_PAD enable to output
  if { [get_attribute [get_ports $port ] direction ] == "in" } {
     #connect_net [get_nets  *Logic0* ] ${this_io}/EN 
     connect_net [get_nets  *Logic1* ] ${this_io}/R_EN 
     connect_net ${this_io}_net ${this_io}/DOUT
  } else {
     connect_net [get_nets  *Logic1* ] $this_io/EN 
     #connect_net [get_nets  *Logic0* ] $this_io/R_EN 
     connect_net ${this_io}_net $this_io/DIN
  }
}
####################################################


