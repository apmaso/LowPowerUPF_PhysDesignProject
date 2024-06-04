# For the Risc V design
if { $top_design == "ExampleRocketSystem" } {
    create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {1850 50}}
    set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
}

if { $top_design == "ORCA_TOP" } {
    create_placement_blockage -type hard_macro -boundary {{10.0 10.0} {1000 50}}
    set_individual_pin_constraints -sides 4 -ports [get_attribute [get_ports ] name ]
#load_upf ../../syn/outputs/ORCA_TOP.dc.upf.place_2020

create_voltage_area  -region {{580 0} {1000 400}} -power_domains PD_RISC_CORE


}


