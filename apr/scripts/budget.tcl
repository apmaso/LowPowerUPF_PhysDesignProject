echo "########starting budget#######"

file delete -force budgets  

#create_abstract -estimate_timing

estimate_timing

#add_feedtrough_buffers

#create_abstract

set_pin_budget_constraints -all -internal_percent 40

set_boundary_budget_constraints -name OUTload -default -load_capacitance 0.15

set_boundary_budget_constraints -name driving_cell_buf -driving_cell NBUFFX2_RVT

set_pin_budget_constraints -late_boundary driving_cell_buf -inputs -all

set_app_options -name plan.estimate_timing.maximum_net_delay -value 1.0

set_app_options -name plan.estimate_timing.maximum_cell_delay -value 1.0

set_budget_options -add_blocks $macro_block

compute_budget_constraints -latency_targets actual -balance true

compute_budget_constraints

write_budgets -blocks $macro_block

set_app_options -name plan.budget.write_hold_budgets -value true

echo "########budget done#######"
