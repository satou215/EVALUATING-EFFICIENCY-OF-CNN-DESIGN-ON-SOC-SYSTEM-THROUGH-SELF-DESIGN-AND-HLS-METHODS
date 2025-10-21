//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import CNN_subsystem_pkg::*;
`include "CNN_subsys_test_sequence_lib.sv"
`include "CNN_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_CNN_top.AESL_clock), .reset(apatb_CNN_top.AESL_reset) );
    assign apatb_CNN_top.ap_start = misc_if.tb2dut_ap_start;
    assign misc_if.dut2tb_ap_done = apatb_CNN_top.ap_done;
    assign misc_if.dut2tb_ap_ready = apatb_CNN_top.ap_ready;
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(16)  svr_OutModel_if    (.clk  (apatb_CNN_top.AESL_clock), .rst(apatb_CNN_top.AESL_reset));
    assign svr_OutModel_if.valid = apatb_CNN_top.OutModel_ap_vld;
    assign svr_OutModel_if.data[15:0] = apatb_CNN_top.OutModel;
    initial begin
        uvm_config_db #( virtual svr_if#(16) )::set(null, "uvm_test_top.top_env.env_slave_svr_OutModel.*", "vif", svr_OutModel_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
