#####################################################
proc insert_io { port side} {
global top_design
  set this_io io_${side}_${port}
  if {  $side == "t"   } {
   if { [get_db [get_port $port ] .direction ] == "in" } {
    create_inst -name $this_io I1025_NS $top_design 
   } else {
    create_inst -name $this_io D8I1025_NS $top_design
   }
  }
  if { $side == "b"  } {
   if { [get_db [get_port $port ] .direction ] == "in" } {
    create_inst -name $this_io I1025_NS $top_design
   } else {
    create_inst -name $this_io D8I1025_NS $top_design
   }
  }
  if {  $side == "r"  } {
   if { [get_db [get_port $port ] .direction ] == "in" } {
    create_inst -name $this_io I1025_NS $top_design
   } else {
    create_inst -name $this_io D8I1025_NS $top_design
   }
  }
  if { $side == "l"  } {
   if { [get_db [get_port $port ] .direction ] == "in" } {
    create_inst -name $this_io I1025_NS $top_design
   } else {
    create_inst -name $this_io D8I1025_NS $top_design 
   }
  }



  #DIN is input to IO_PAD
  #DOUT is output of IO_PAD
  #EN is the IO_PAD enable to output
  if { [get_db [get_port $port ] .direction ] == "in" } {
     # Disconnect all pins related to the old port and make a new net name and connect them up to that new net.
     
     # Find all the hpins or real pins connected at the top level to the port net.
     # this is a little tricky since Genus indicates leaf pins which might cross hierarchy boundaries except for the all_connected command
     set pins [get_db [ all_connected $port ] -if ".obj_type==*pin"] 
     # disconnect seems to be working better with the get_db object instead of the text name.
     foreach_in i $pins { disconnect $i  }
     foreach_in i $pins { 
        # Connect arguments must have the driver pin/port followed by a load.  net name is optional, but needed if a new net.
        connect -net ${this_io}_net ${this_io}/DOUT [get_db $i .name ]
     }

     # connect up the PADIO to the original port net and connect other important PAD pins.
     connect -net $port $port $this_io/PADIO
     #connect_net [get_nets  *Logic0* ] ${this_io}/EN 
     connect 1 ${this_io}/R_EN
  } else {
     # Find all the hpins or real pins connected at the top level to the port net.
     # this is a little tricky since Genus indicates leaf pins which might cross hierarchy boundaries except for the all_connected command
     set pins [get_db [ all_connected $port ] -if ".obj_type==*pin"] 
     # disconnect seems to be working better with the get_db object instead of the text name.
     foreach_in i $pins { disconnect $i  }
     # Connect arguments must have the driver pin/port followed by a load.  net name is optional, but needed if a new net.
     connect -net ${this_io}_net [get_db $pins -if ".direction==out" ] $this_io/DIN
     # This internal driver might drive to other loads other than the port.  It might drive back into other spots in the design.
     set other_receivers [get_db $pins -if ".direction==in" ]
     if {$other_receivers!=""} { 
        connect -net ${this_io}_net [get_db $pins -if ".direction==out" ] $other_receivers
     }

     # connect up the PADIO to the original port net and connect other important PAD pins.
     connect -net $port $this_io/PADIO $port
     connect 1 $this_io/EN 
     #connect_net [get_nets  *Logic0* ] $this_io/R_EN 
  }
}
####################################################


