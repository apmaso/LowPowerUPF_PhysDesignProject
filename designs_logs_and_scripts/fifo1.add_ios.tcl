# This is design dependent code to put IOs on particular sides of the block
proc get_port_names { port_collection } {
global synopsys_program_name
    if [ info exists synopsys_program_name ] {
       return [join [ get_attribute $port_collection full_name ] ]
    } else {
        return [ get_db $port_collection .name ]
    }
}

foreach i [get_port_names [ get_ports rdata* ] ]  {
  insert_io  $i l 
}
foreach i [ get_port_names [ get_ports wdata* ] ] {
  insert_io  $i r 
}
foreach i { rempty wfull }  {
  insert_io  $i t 
}
foreach i { rrst_n rclk rinc wrst_n wclk2x wclk winc }  {
  insert_io  $i b 
}



