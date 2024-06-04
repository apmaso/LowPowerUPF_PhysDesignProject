# Create DFT ports and signals.
create_port_bus -name test_mode -input ${top_design}
define_dft test_mode -name test_mode -active high test_mode
create_port_bus -name scan_enable -input ${top_design}
define_dft shift_enable -name shift_enable_signal -active high scan_enable
