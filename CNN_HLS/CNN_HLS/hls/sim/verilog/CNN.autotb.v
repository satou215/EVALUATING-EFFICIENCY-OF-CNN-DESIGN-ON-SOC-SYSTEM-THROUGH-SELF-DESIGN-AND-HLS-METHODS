// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps


`define AUTOTB_DUT      CNN
`define AUTOTB_DUT_INST AESL_inst_CNN
`define AUTOTB_TOP      apatb_CNN_top
`define AUTOTB_LAT_RESULT_FILE "CNN.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "CNN.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_CNN_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_MEM_InModel AESL_automem_InModel
`define AESL_MEM_INST_InModel mem_inst_InModel
`define AESL_DEPTH_OutModel 1
`define AESL_MEM_Weights AESL_automem_Weights
`define AESL_MEM_INST_Weights mem_inst_Weights
`define AUTOTB_TVIN_InModel  "../tv/cdatafile/c.CNN.autotvin_InModel.dat"
`define AUTOTB_TVIN_Weights  "../tv/cdatafile/c.CNN.autotvin_Weights.dat"
`define AUTOTB_TVIN_InModel_out_wrapc  "../tv/rtldatafile/rtl.CNN.autotvin_InModel.dat"
`define AUTOTB_TVIN_Weights_out_wrapc  "../tv/rtldatafile/rtl.CNN.autotvin_Weights.dat"
`define AUTOTB_TVOUT_OutModel  "../tv/cdatafile/c.CNN.autotvout_OutModel.dat"
`define AUTOTB_TVOUT_OutModel_out_wrapc  "../tv/rtldatafile/rtl.CNN.autotvout_OutModel.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 504806;
parameter LENGTH_InModel = 320;
parameter LENGTH_OutModel = 1;
parameter LENGTH_Weights = 11065;

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [8 : 0] InModel_address0;
wire  InModel_ce0;
wire [15 : 0] InModel_q0;
wire [15 : 0] OutModel;
wire  OutModel_ap_vld;
wire [13 : 0] Weights_address0;
wire  Weights_ce0;
wire [15 : 0] Weights_q0;
wire [13 : 0] Weights_address1;
wire  Weights_ce1;
wire [15 : 0] Weights_q1;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;


wire all_finish;
wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .InModel_address0(InModel_address0),
    .InModel_ce0(InModel_ce0),
    .InModel_q0(InModel_q0),
    .OutModel(OutModel),
    .OutModel_ap_vld(OutModel_ap_vld),
    .Weights_address0(Weights_address0),
    .Weights_ce0(Weights_ce0),
    .Weights_q0(Weights_q0),
    .Weights_address1(Weights_address1),
    .Weights_ce1(Weights_ce1),
    .Weights_q1(Weights_q1));
assign ap_clk = AESL_clock;
assign ap_rst = AESL_reset;
assign ap_rst_n = ~AESL_reset;
assign AESL_reset = dut_rst;
assign AESL_start = svtb_top.misc_if.tb2dut_ap_start;
assign AESL_ready = svtb_top.misc_if.dut2tb_ap_ready;
assign AESL_done  = svtb_top.misc_if.dut2tb_ap_done;
assign all_finish = svtb_top.misc_if.finished;
initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    # 0.1;
    rst = 0;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    # 0.1;
    dut_rst = 0;
end
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end

    sv_module_top svtb_top();
//------------------------arrayInModel Instantiation--------------

// The input and output of arrayInModel
wire    arrayInModel_ce0, arrayInModel_ce1;
wire [2 - 1 : 0]    arrayInModel_we0, arrayInModel_we1;
wire    [8 : 0]    arrayInModel_address0, arrayInModel_address1;
wire    [15 : 0]    arrayInModel_din0, arrayInModel_din1;
wire    [15 : 0]    arrayInModel_dout0, arrayInModel_dout1;
wire    arrayInModel_ready;
wire    arrayInModel_done;

`AESL_MEM_InModel `AESL_MEM_INST_InModel(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayInModel_ce0),
    .we0        (arrayInModel_we0),
    .address0   (arrayInModel_address0),
    .din0       (arrayInModel_din0),
    .dout0      (arrayInModel_dout0),
    .ce1        (arrayInModel_ce1),
    .we1        (arrayInModel_we1),
    .address1   (arrayInModel_address1),
    .din1       (arrayInModel_din1),
    .dout1      (arrayInModel_dout1),
    .ready      (arrayInModel_ready),
    .done    (arrayInModel_done)
);

// Assignment between dut and arrayInModel
assign arrayInModel_address0 = InModel_address0;
assign arrayInModel_ce0 = InModel_ce0;
assign InModel_q0 = arrayInModel_dout0;
assign arrayInModel_we0 = 0;
assign arrayInModel_din0 = 0;
assign arrayInModel_we1 = 0;
assign arrayInModel_din1 = 0;
assign arrayInModel_ready=    ready;
assign arrayInModel_done = 0;

event InModel_reshape_ap_done_evt;
event InModel_reshape_ap_ready_evt;
initial begin
     `AESL_MEM_INST_InModel.initialed       = svtb_top.misc_if.initialed_evt  ;
     `AESL_MEM_INST_InModel.finished        = svtb_top.misc_if.finished_evt   ;
     `AESL_MEM_INST_InModel.dut2tb_ap_ready = svtb_top.misc_if.dut2tb_ap_ready_evt;
     `AESL_MEM_INST_InModel.dut2tb_ap_done = svtb_top.misc_if.dut2tb_ap_ready_evt;
end
//------------------------arrayWeights Instantiation--------------

// The input and output of arrayWeights
wire    arrayWeights_ce0, arrayWeights_ce1;
wire [2 - 1 : 0]    arrayWeights_we0, arrayWeights_we1;
wire    [13 : 0]    arrayWeights_address0, arrayWeights_address1;
wire    [15 : 0]    arrayWeights_din0, arrayWeights_din1;
wire    [15 : 0]    arrayWeights_dout0, arrayWeights_dout1;
wire    arrayWeights_ready;
wire    arrayWeights_done;

`AESL_MEM_Weights `AESL_MEM_INST_Weights(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayWeights_ce0),
    .we0        (arrayWeights_we0),
    .address0   (arrayWeights_address0),
    .din0       (arrayWeights_din0),
    .dout0      (arrayWeights_dout0),
    .ce1        (arrayWeights_ce1),
    .we1        (arrayWeights_we1),
    .address1   (arrayWeights_address1),
    .din1       (arrayWeights_din1),
    .dout1      (arrayWeights_dout1),
    .ready      (arrayWeights_ready),
    .done    (arrayWeights_done)
);

// Assignment between dut and arrayWeights
assign arrayWeights_address0 = Weights_address0;
assign arrayWeights_ce0 = Weights_ce0;
assign Weights_q0 = arrayWeights_dout0;
assign arrayWeights_we0 = 0;
assign arrayWeights_din0 = 0;
assign arrayWeights_address1 = Weights_address1;
assign arrayWeights_ce1 = Weights_ce1;
assign Weights_q1 = arrayWeights_dout1;
assign arrayWeights_we1 = 0;
assign arrayWeights_din1 = 0;
assign arrayWeights_ready=    ready;
assign arrayWeights_done = 0;

event Weights_reshape_ap_done_evt;
event Weights_reshape_ap_ready_evt;
initial begin
     `AESL_MEM_INST_Weights.initialed       = svtb_top.misc_if.initialed_evt  ;
     `AESL_MEM_INST_Weights.finished        = svtb_top.misc_if.finished_evt   ;
     `AESL_MEM_INST_Weights.dut2tb_ap_ready = svtb_top.misc_if.dut2tb_ap_ready_evt;
     `AESL_MEM_INST_Weights.dut2tb_ap_done = svtb_top.misc_if.dut2tb_ap_ready_evt;
end

////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 1) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(rst),
    .finish(all_finish));

`include "fifo_para.vh"
endmodule
