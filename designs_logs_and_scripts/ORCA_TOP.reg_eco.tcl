set se_pins [get_pins -of_object [get_cells -hier -filter "is_sequential==true"] -filter "full_name=~*/SE"]

foreach_in_collection i $se_pins {
   disconnect $i
   connect scan_enable $i -net_name scan_enable
}
set si_pins [get_pins -of_object [get_cells -hier -filter "is_sequential==true"] -filter "full_name=~*/SI"]

foreach_in_collection i $si_pins {
   disconnect $i
}
