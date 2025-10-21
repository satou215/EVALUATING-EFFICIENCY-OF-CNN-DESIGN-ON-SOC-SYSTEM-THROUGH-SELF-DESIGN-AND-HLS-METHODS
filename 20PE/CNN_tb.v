`timescale 1ns/1ns
`include "common.vh"

module CNN_tb;
  // Clock and reset
  reg CLK;
  reg RST;

  // AXI LDM interface
  reg  [`PE_NUM_BITS+`LDM_NUM_BITS+`LDM_ADDR_BITS-1:0] AXI_LDM_addra_in;
  reg  signed [`DATA_WIDTH-1:0]                         AXI_LDM_dina_in;
  reg                                                  AXI_LDM_ena_in;
  reg                                                  AXI_LDM_wea_in;

  // AXI CRAM interface
  reg  [`CRAM_ADDR_BITS-1:0]            AXI_CRAM_addra_in;
  reg  signed [`CTX_BITS-1:0]           AXI_CRAM_dina_in;
  reg                                   AXI_CRAM_ena_in;
  reg                                   AXI_CRAM_wea_in;

  // AXI WRAM interface
  reg  [`WRAM_ADDR_BITS-1:0]            AXI_WRAM_addra_in;
  reg  signed [`DATA_WIDTH-1:0]         AXI_WRAM_dina_in;
  reg                                   AXI_WRAM_ena_in;
  reg                                   AXI_WRAM_wea_in;

  // AXI BRAM interface
  reg  [`BRAM_ADDR_BITS-1:0]            AXI_BRAM_addra_in;
  reg  signed [`DATA_WIDTH-1:0]         AXI_BRAM_dina_in;
  reg                                   AXI_BRAM_ena_in;
  reg                                   AXI_BRAM_wea_in;

  // Control signals
  reg start_in;
  reg AXI_CRAM_enb_in, AXI_CRAM_web_in;
  // Outputs
  wire signed [`LABEL-1:0] AXI_LDM_douta_out;
  wire                          complete_out;

  // Instantiate DUT
  CNN dut (
    .CLK               (CLK),
    .RST               (RST),
    .AXI_LDM_addra_in  (AXI_LDM_addra_in),
    .AXI_LDM_dina_in   (AXI_LDM_dina_in),
    .AXI_LDM_ena_in    (AXI_LDM_ena_in),
    .AXI_LDM_wea_in    (AXI_LDM_wea_in),
    .AXI_CRAM_addra_in (AXI_CRAM_addra_in),
    .AXI_CRAM_dina_in  (AXI_CRAM_dina_in),
    .AXI_CRAM_ena_in   (AXI_CRAM_ena_in),
    .AXI_CRAM_wea_in   (AXI_CRAM_wea_in),
    .AXI_WRAM_addra_in (AXI_WRAM_addra_in),
    .AXI_WRAM_dina_in  (AXI_WRAM_dina_in),
    .AXI_WRAM_ena_in   (AXI_WRAM_ena_in),
    .AXI_WRAM_wea_in   (AXI_WRAM_wea_in),
    .AXI_BRAM_addra_in (AXI_BRAM_addra_in),
    .AXI_BRAM_dina_in  (AXI_BRAM_dina_in),
    .AXI_BRAM_ena_in   (AXI_BRAM_ena_in),
    .AXI_BRAM_wea_in   (AXI_BRAM_wea_in),
    .start_in          (start_in),
    .AXI_LDM_douta_out (AXI_LDM_douta_out),
    .complete_out      (complete_out)
  );

  // Memory declarations
  localparam WRAM_DEPTH = 2 ** `WRAM_ADDR_BITS;
  localparam BRAM_DEPTH = 2 ** `BRAM_ADDR_BITS;
  localparam LDM_DEPTH  = 320; // adjust to actual number of lines;
  localparam CTX_DEPTH  = 64;
  reg signed [`DATA_WIDTH-1:0] weight_mem [0:WRAM_DEPTH-1];
  reg signed [`DATA_WIDTH-1:0] bias_mem   [0:BRAM_DEPTH-1];
  reg signed [`DATA_WIDTH-1:0]   ldm_mem    [0:LDM_DEPTH-1];
  reg signed [`CTX_BITS-1:0]   context_mem    [0:CTX_DEPTH-1];
  reg [`WRAM_ADDR_BITS-1:0] i_wr;
  reg [`BRAM_ADDR_BITS-1:0] i_br;
  reg [`LDM_NUM_BITS-1:0]   i_ldm;
  reg [`PE_NUM_BITS-1:0]    pe_idx;
  reg [`LDM_ADDR_BITS-1:0]  i_address;
  reg [9-1:0]               i_signal;
  reg                       start_rg;
  reg [6-1:0]               i_ctx;
  // Clock generation: 10ns period
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  // Initial setup and stimulus
  initial begin
    // Read input files
    $readmemh("D:/Verilog/weight_nopad.txt", weight_mem);
    $readmemh("D:/Verilog/bias_nopad.txt",   bias_mem);
    $readmemh("D:/Verilog/signals_label_N_hex.txt", ldm_mem);
    $readmemh("D:/Verilog/context_20.txt", context_mem);
    // Initialize counters and control signals
    i_wr      = 0;
    i_br      = 0;
    i_ldm     = 0;
    pe_idx    = 0;
    i_address = 0;
    i_signal  = 0;
    i_ctx     = 0;
    RST       = 1;
    AXI_LDM_ena_in  = 1;
    AXI_LDM_wea_in  = 1;
    AXI_WRAM_ena_in = 1;
    AXI_WRAM_wea_in = 1;
    AXI_BRAM_ena_in = 1;
    AXI_BRAM_wea_in = 1;
    AXI_CRAM_ena_in = 1;
    AXI_CRAM_wea_in = 1;
    start_in        = 0;

    // Release reset
    #20 RST = 0;

  end
  wire start = (i_signal == 9'b1_0100_0000);
  // Drive AXI data each clock
  always @(posedge CLK) begin
    start_in <= start_rg;
    start_rg <= start;
    if(start == 1) begin
        AXI_LDM_ena_in  = 0;
        AXI_LDM_wea_in  = 0;
    end
    if (i_ctx == 6'b100110) begin
        i_ctx <= i_ctx;
    end
    else begin
        AXI_CRAM_addra_in <= i_ctx;
        AXI_CRAM_dina_in  <= context_mem[i_wr];
        i_ctx             <= i_ctx + 1;
    end
    if (i_wr == 14'b10_1010_1010_1000) begin
        i_wr <= i_wr;
    end
    else begin 
        AXI_WRAM_addra_in <= i_wr;
        AXI_WRAM_dina_in  <= weight_mem[i_wr];
        i_wr <= i_wr + 1;
    end
    if (i_br == 8'b1001_0001) begin
        i_br <= i_br;
    end
    else begin
        AXI_BRAM_addra_in <= i_br;
        AXI_BRAM_dina_in  <= bias_mem[i_br];
        i_br <= i_br + 1;
    end
    if (i_signal == 9'b1_0100_0000) begin
        i_signal <= i_signal;
    end
    else begin
        if (pe_idx == 6'b10_1000) begin
            pe_idx <= 0;
            i_address <= i_address + 1;
        end
        else begin
            i_signal <= i_signal + 1;
            AXI_LDM_dina_in <= ldm_mem[i_signal];
            AXI_LDM_addra_in <= {pe_idx,i_ldm,i_address};
            pe_idx <= pe_idx + 1;
        end
     end
  end
  
endmodule
 