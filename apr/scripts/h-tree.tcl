# rotate through clocks
# Need to debug SYS_2x_CLK some more.  It works on its own, but may need some more special treatment when done with SYS_CLK as well.
# {SYS_2x_CLK {{ 254 481 } { 390 490 } } } 

foreach i { {PCI_CLK { {287 49} { 492 169} } } 
            { SDRAM_CLK { { 186 175 } {361 422 } } } 
            { SYS_CLK { { 190 230 } {573 460 } } } 
            } {
    set clock_name [lindex $i 0 ]
    echo "Working on " $clock_name
    set clock [ get_clock $clock_name ]
    set clkport [ get_attribute $clock sources ]
    if { $clock_name == "SYS_2x_CLK" } { 
        # Insert a guide buffer so we can force the h-tree inside the voltage area
        current_instance I_RISC_CORE
        insert_buffer -new_cell_names sys_2x_clk_risc_buf -new_net_name sys_2x_clk_risc_net [get_port clk ] -lib_cell NBUFFX16_LVT
        current_instance
        set clknet [ get_net I_RISC_CORE/sys_2x_clk_risc_net ]
    } elseif { $clock_name == "SDRAM_CLK"} {
        # the clk* output of the occ block is not the right one for some reason and this is better.  Maybe related to MV stuff?
        set clknet [get_net -of_obj [ get_pin occ_int2/p_aps_clk_data0 ] ]
    } else {
        set clknet [ get_net -of_obj [filter_collection [ all_fanout -from $clkport ] "full_name=~*occ_int*/clk*" ] ]
    }
    # The occ block output is the high fanout net to the FFs.
    # Pick a high drive buffer for H-tree to typically drive long distances.  I suppose it may not be for ORCA_TOP.
    set clkbuf [ get_lib_cell */NBUFFX8_LVT ]
    # Locate all the related FFs and visually determine a rectangular box for the Htree buffers that does not overlap macros or another voltage area.
    #change_selection [ all_registers -clock $clock ]
    set boundary [lindex $i 1 ]
    set htree_name [ get_attribute $clock name ]_htree
    create_clock_drivers -loads $clknet -configuration [list [list -level 1 -boxes {1 1} -lib_cells $clkbuf ]   [list -level 2 -boxes {2 2} -lib_cells $clkbuf ] ] -boundary $boundary -prefix $htree_name
    if { $clock_name == "SYS_2x_CLK" } {
        # Remove the guide buffer
        remove_buffer I_RISC_CORE/sys_2x_clk_risc_buf
    }
    legalize_placement
    synthesize_multisource_global_clock_trees -roots $clkport -leaves [get_pins -hier *${htree_name}_l2_*/A] -use_zroute_for_pin_connections
    set_multisource_clock_tap_options -clock $clock -driver_objects [get_pins -hier *${htree_name}_l2_*/Y ] -num_taps 4
}
synthesize_multisource_clock_taps

