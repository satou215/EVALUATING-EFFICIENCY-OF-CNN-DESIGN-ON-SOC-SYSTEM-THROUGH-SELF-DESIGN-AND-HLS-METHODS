//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef CNN_SUBSYSTEM_PKG__SV          
    `define CNN_SUBSYSTEM_PKG__SV      
                                                     
    package CNN_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "CNN_config.sv"           
        `include "CNN_reference_model.sv"  
        `include "CNN_scoreboard.sv"       
        `include "CNN_subsystem_monitor.sv"
        `include "CNN_virtual_sequencer.sv"
        `include "CNN_pkg_sequence_lib.sv" 
        `include "CNN_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
