# Create DFT ports and signals.
create_port_bus -name test_mode -input ${top_design}
define_dft test_mode -name test_mode -active high test_mode
create_port_bus -name scan_enable -input ${top_design}
define_dft shift_enable -name shift_enable_signal -active high scan_enable
# OPCG dependent ports and signals.
create_port_bus -name scan_clk -input ${top_design}
create_port_bus -name opcg_enable -input ${top_design}
create_port_bus -name opcg_load_clk -input ${top_design}
define_dft test_mode -name opcg_enable -active high opcg_enable
define_dft test_clock -name opcg_load_clk opcg_load_clk 
define_dft test_clock -name scan_clk scan_clk

# Define oscillator sources
define_dft osc_source -name osc_source_1 fifo1_sram/pll_wclk/CLK_1X -ref_clock_pin wclk -design ${top_design} -min_input_period 1.0 -max_input_period 600.0 -min_output_period 1.0 -max_output_period 600.0 

define_dft osc_source -name osc_source_2 fifo1_sram/pll_wclk2x/CLK_1X -ref_clock_pin wclk2x -design ${top_design} -min_input_period 1.0 -max_input_period 1200.0 -min_output_period 1.0 -max_output_period 1200.0 

define_dft osc_source -name osc_source_3 fifo1_sram/pll_rclk/CLK_1X -ref_clock_pin rclk -design ${top_design} -min_input_period 1.0 -max_input_period 300.0 -min_output_period 1.0 -max_output_period 300.0 

# Defining OPCG trigger. 
create_port_bus -name GOPORT1 -input ${top_design}
define_dft opcg_trigger -active high -osc_source osc_source_1 GOPORT1 -create_port -name TRIGGER -scan_clock scan_clk

# Defining domain macros.
define_dft domain_macro_parameters -name domain_parameters -max_num_pulses 8 -counter_length 4

# Defining DFT domains. 
define_dft opcg_domain -name domain_1 -osc_source osc_source_1 -opcg_trigger TRIGGER -scan_clock scan_clk -domain_macro_parameter domain_parameters -location fifo1_sram/pll_wclk/CLK_1X -min_domain_period 600

define_dft opcg_domain -name domain_2 -osc_source osc_source_2 -opcg_trigger TRIGGER -scan_clock scan_clk -domain_macro_parameter domain_parameters -location fifo1_sram/pll_wclk2x/CLK_1X -min_domain_period 1200

define_dft opcg_domain -name domain_3 -osc_source osc_source_3 -opcg_trigger TRIGGER -scan_clock scan_clk -domain_macro_parameter domain_parameters -location fifo1_sram/pll_rclk/CLK_1X -min_domain_period 300

# Insert OPCG logic. 
insert_dft opcg -opcg_enable opcg_enable -opcg_load_clock opcg_load_clk -scan_clock scan_clk -test_enable test_mode
