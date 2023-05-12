# Setting name of PLL cell in library.
set pll_ref_name PLL

# Creating PLL instances for each clock path.
create_inst -name pll_wclk $pll_ref_name fifo1_sram
create_inst -name pll_wclk2x $pll_ref_name fifo1_sram
create_inst -name pll_rclk $pll_ref_name fifo1_sram

# Connecting the inputs of the PLL. 
connect wclk pll_wclk/REF_CLK -net_name wclk
connect wclk2x pll_wclk2x/REF_CLK -net_name wclk2x
connect rclk pll_rclk/REF_CLK -net_name rclk

set wclk_pin [get_pins wdata_reg*/clk]

foreach_in_collection i $wclk_pin {
   
   set name [get_db $i .name]
   disconnect $name
   connect pll_wclk2x/CLK_1X $name -net_name wclk2x_1X
   
}

# Get wclk pin for registers.
set wclk_pin [get_pins sync_r2w/wclk]
# Disconnect the pin.
disconnect $wclk_pin 
# Connect the output of PLL to the registers.
connect pll_wclk/CLK_1X $wclk_pin -net_name wclk_1X
set wclk_pin [get_pins fifomem/wclk]
disconnect $wclk_pin 
connect pll_wclk/CLK_1X $wclk_pin -net_name wclk_1X
set wclk_pin [get_pins wptr_full/wclk]
disconnect $wclk_pin 
connect pll_wclk/CLK_1X $wclk_pin -net_name wclk_1X

# Get pin connected to rclk.
set rclk_pin [get_pins sync_w2r/rclk]
# Disconnect the pin.
disconnect $rclk_pin 
# Connect output of PLL to the disconnected pin.
connect pll_rclk/CLK_1X $rclk_pin -net_name rclk_1X
set rclk_pin [get_pins fifomem/rclk]
disconnect $rclk_pin 
connect pll_rclk/CLK_1X $rclk_pin -net_name rclk_1X
set rclk_pin [get_pins rptr_empty/rclk]
disconnect $rclk_pin 
connect pll_rclk/CLK_1X $rclk_pin -net_name rclk_1X
