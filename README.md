# Low-Power UPF Physical Implementation

## Project Overview

This project focuses on the physical implementation aspects of a Multi-Voltage (MV) design using Unified Power Format (UPF) in electronic design automation (EDA). The goal is to understand and implement the Physical Design components of a Multi-Voltage design using Synopsys Design Compiler, Cadence Genus, and Cadence Innovus.

## Authors

- **Alexander Maso** (amaso@pdx.edu)
- **Jie Sun** (sun5@pdx.edu)

Graduate Students, Department of Electrical and Computer Engineering, Portland State University

## Introduction

### 1.1 Overview

UPF serves as a standardized methodology and format used in EDA to describe and manage the power intent of a digital design. This project aims to comprehend the Physical Design components of a Multi-Voltage design, including RTL synthesis, floorplanning, power domain implementation, and power routing.

### 1.2 Significance of Power Management

Power management in digital design is crucial for energy efficiency, performance enhancement, reliability, cost reduction, addressing thermal challenges, and promoting environmental sustainability.

## General Process Flow

### 2.1 Progress Flow

The project implementation involved individual and collaborative tasks:
- **Jie**: Executed synthesis on RTL, UPF, and SDC using Synopsys Compiler.
- **Alex**: Executed synthesis on RTL, UPF, and SDC using Cadence Genus, created a schematic of the entire design, and highlighted power management cells.

The synthesis results from Genus were used for the physical implementation presented in the final presentation.

## Design Goals

The main objective was to delve into the Physical Design aspects of MV design implementation, focusing on RTL synthesis and generating metrics using Synopsys Design Compiler and Cadence Genus. The physical implementation was performed using Cadence Innovus.

## Project Design Progress and Results

### 4.1 Synthesis in Genus and Design Compiler

The synthesis involved running provided RTL and UPF files through both Genus and Design Compiler, comparing the timing results, and generating various reports on power domains, level shifters, power switches, isolation cells, supply nets, and quality of results (QoR).

### 4.2 Inputs & Constraints

The process involved creating aliases, using floorplan-macros-innovus.tcl as a template, and referring to UPF and SV files for power net and other differences.

### 4.3 Floorplanning

The task focused on using floorplan and editPin commands in Innovus, with reference to the ORCA_TOP design and lab assignment scripts.

### 4.4 Power Domains

Separate power domains were created using the modifyPowerDomainAttr command and the floorplan was updated using planDesign.

### 4.5 Power Management Cells

Power switches were inserted into each of the four power domains using the addPowerSwitch command, with specific parameters determined through trial and error.

### 4.6 Power Routing, Ring, Stripes, and Routing

This was the most challenging task, involving the creation of power rings and stripes for the top power domain and each of the four modules, and using the sroute command for routing.

### 4.7 Place and Route

Level shifters, isolation cells, etc., were placed using the place_opt_design command and the entire design was routed using routeDesign.

### 4.8 Summary

Iterative improvements were made to minimize DRC violations, ultimately eliminating all violations before place_opt_design and routeDesign.

## Challenges Faced

- Determining the correct layers and nets for power routing.
- Understanding the need for globalNetConnect commands.
- Resolving missing files and understanding enable nets for power switches.

## Timeline

The project was completed over a series of tasks, with the most challenging part being power routing.

## Conclusion

The project provided valuable insights into the challenges and intricacies of implementing MV design in physical design aspects, with a focus on optimizing design and summarizing results at each stage.

## References

- Synopsys HDL Compiler for Verilog User Guide
- Cadence Genus and Innovus User Guides
- Course lecture slides and lab assignment scripts

## Acknowledgements

Special thanks to Professor Venkatesh and T.A. Adithya Rajesh for their invaluable support and guidance.
