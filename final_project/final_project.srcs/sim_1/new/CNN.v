//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2025 04:43:45 AM
// Design Name: 
// Module Name: CNN
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ns
`include "common.vh"

module CNN
(
	input  wire                                 	CLK,
	input  wire                                 	RST,
	
	//-----------------------------------------------------//
	//          			Input Signals                  // 
	//-----------------------------------------------------//

	///*** From AXI Mapper ***///				
	input  wire [`PE_NUM_BITS+`LDM_NUM_BITS+`LDM_ADDR_BITS-1:0] AXI_LDM_addra_in,
	input  wire signed [`DATA_WIDTH-1:0]          	AXI_LDM_dina_in,
	input  wire 					              	AXI_LDM_ena_in,
	input  wire 					              	AXI_LDM_wea_in,

	input  wire [`CRAM_ADDR_BITS-1:0] 				AXI_CRAM_addra_in,
	input  wire signed [`CTX_BITS-1:0]          	AXI_CRAM_dina_in,
	input  wire 					              	AXI_CRAM_ena_in,
	input  wire 					              	AXI_CRAM_wea_in,
	
	input  wire [`WRAM_ADDR_BITS-1:0]   			AXI_WRAM_addra_in,
	input  wire [`DATA_WIDTH-1:0]              		AXI_WRAM_dina_in,
	input  wire 					              	AXI_WRAM_ena_in,
	input  wire 					              	AXI_WRAM_wea_in,

	input  wire [`BRAM_ADDR_BITS-1:0]   			AXI_BRAM_addra_in,
	input  wire [`DATA_WIDTH-1:0]              		AXI_BRAM_dina_in,
	input  wire 					              	AXI_BRAM_ena_in,
	input  wire 					              	AXI_BRAM_wea_in,
	
	input  wire 					              	start_in,
	
	//-----------------------------------------------------//
	//          			Output Signals                 // 
	//-----------------------------------------------------//  
	
	///*** To  AXI Mapper  ***///
	output  wire            [`DATA_WIDTH-1:0]         	AXI_LDM_douta_out,
	output  wire 						         	complete_out  
);
 
	// *************** Wire signals *************** //
	wire [`CTX_BITS-1:0]             				CTX_wr;	
			
	///*** Context RAM ***///			
	wire [`CRAM_ADDR_BITS-1:0] 						CTRL_CRAM_addrb_wr;
	wire 					              			CTRL_CRAM_enb_wr;
	wire 					              			CTRL_CRAM_web_wr;
		
	///*** Weight RAM ***///			
	wire [`WRAM_ADDR_BITS-1:0] 						CTRL_WRAM_addrb_wr;
	wire 					              			CTRL_WRAM_enb_wr;
	wire 					              			CTRL_WRAM_web_wr;
		
	wire signed [`DATA_WIDTH-1:0]             		Weight_wr;
	
	///*** Bias RAM ***///			
	wire [`BRAM_ADDR_BITS-1:0] 						CTRL_BRAM_addrb_wr;
	wire 					              			CTRL_BRAM_enb_wr;
	wire 					              			CTRL_BRAM_web_wr;

	wire signed [`DATA_WIDTH-1:0]             		Bias_wr;
	
	///*** SGB ***///		
	wire [`ALU_OPCODE-1:0]      					Opcode_wr;
	wire [`PE_NUM_BITS-1:0]  						MUX_Selection_wr;
	wire 					              			Stride_wr; //0 -> 1, 1 -> 2	
	///*** All PEs ***///
	wire 					              			En_wr;	
	wire 					              			layer_done_wr;
			
	wire 					              			Parity_PE_Selection_wr; //0 -> Even PEs, 1 -> Odd PEs
	
	wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0] 			CTRL_LDM_addra_wr;
	wire 					              			CTRL_LDM_ena_wr;
	wire 					              			CTRL_LDM_wea_wr;
		
	wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0] 			CTRL_LDM_addrb_wr;
	wire 					              			CTRL_LDM_enb_wr;
	wire 					              			CTRL_LDM_web_wr;
	
	wire [`LDM_DES_BITS+`LDM_SA_BITS-1:0] 			CTRL_LDM_Store_wr;
	
	wire  [`LABEL-1:0]         			   AXI_LDM_douta_out_wr;
	///***  specific PEs ***///
	wire											Overarray_wr;	
	wire	[`PE_NUM-1:0]							CTRL_LDM_addra_Incr_wr;
	
	///***  AXI Mapper ***///
	wire											complete_wr;
	
	///*** Global Allocator ***///			
	wire 					            			Pixel_0_valid_in_wr[`PE_NUM-1:0];	
	wire signed [`DATA_WIDTH-1:0]            		Pixel_0_in_wr[`PE_NUM-1:0];
	wire 					            			Pixel_1_valid_in_wr[`PE_NUM-1:0];	
	wire signed [`DATA_WIDTH-1:0]             		Pixel_1_in_wr[`PE_NUM-1:0];
	wire 					            			Pixel_2_valid_in_wr[`PE_NUM-1:0];	
	wire signed [`DATA_WIDTH-1:0]             		Pixel_2_in_wr[`PE_NUM-1:0];	

	wire signed [`DATA_WIDTH-1:0]           		Pixel_0_out_wr[`PE_NUM-1:0];
	wire 						           			Pixel_0_valid_out_wr[`PE_NUM-1:0];
	wire signed [`DATA_WIDTH-1:0]           		Pixel_1_out_wr[`PE_NUM-1:0];
	wire 						           			Pixel_1_valid_out_wr[`PE_NUM-1:0];	
	
	// *************** Register signals *************** //		
	reg 					            			Weight_valid_1_rg;
	reg 					            			Bias_valid_1_rg;
	reg signed [`DATA_WIDTH-1:0]             		Weight_rg;
	reg signed [`DATA_WIDTH-1:0]             		Bias_rg;

	reg 					            			Weight_valid_2_rg;
	reg 					            			Bias_valid_2_rg;
	
	reg  [`CRAM_ADDR_BITS-1:0]	          			CTX_maxaddra_rg;

	reg [`PE_NUM_BITS-1:0]  						MUX_Selection_rg;
	reg                                             complete_rg;
	assign complete_out		= complete_rg;

    // Assign output by bitwise OR-ing all 16-bit vectors in AXI_LDM_douta_out_wr
    assign AXI_LDM_douta_out = complete_rg ? {13'b0, AXI_LDM_douta_out_wr} : 3'b0;
							   
	always @(posedge CLK) begin
		if (RST) begin
			CTX_maxaddra_rg		<= `CRAM_ADDR_BITS'h0;
			Weight_valid_1_rg	<= 0;
			Bias_valid_1_rg		<= 0;
			Weight_valid_2_rg	<= 0;
			Bias_valid_2_rg		<= 0;
			
			Weight_rg			<= 0;
			Bias_rg				<= 0;
			
			MUX_Selection_rg	<= 0;
			complete_rg		<= 0;
		end
		else begin
		    complete_rg		= complete_wr;
			Weight_valid_1_rg	<= CTRL_WRAM_enb_wr;
			Bias_valid_1_rg		<= CTRL_BRAM_enb_wr;
			
			Weight_valid_2_rg	<= Weight_valid_1_rg;
			Bias_valid_2_rg		<= Bias_valid_1_rg;
			
			if(Weight_valid_1_rg) begin
				Weight_rg		<= Weight_wr;
			end                 
			else begin          
				Weight_rg		<= 0;
			end
			
			if(Bias_valid_1_rg) begin
				Bias_rg			<= Bias_wr;
			end                 
			else begin          
				Bias_rg			<= 0;
			end
			
			MUX_Selection_rg	<= MUX_Selection_wr;
			
			if(AXI_CRAM_ena_in&AXI_CRAM_wea_in) begin
				CTX_maxaddra_rg	<= AXI_CRAM_addra_in[`CRAM_ADDR_BITS-1:0];
			end   
			else begin
				CTX_maxaddra_rg	<= CTX_maxaddra_rg;
			end
		end
	end

	Dual_Port_RAM_16K #
	(.DWIDTH(`CTX_BITS), .AWIDTH(`CRAM_ADDR_BITS)) 
	 CRAM (
	  .clk(CLK), // clock
	  ///*** Port A***///
	  .ena(AXI_CRAM_ena_in), // port A read enable
	  .wea(AXI_CRAM_wea_in), // port A write enable
	  .addra(AXI_CRAM_addra_in), // port A address
	  .dina(AXI_CRAM_dina_in), // port A data
	  .douta(), // port A data output
	  
	  ///*** Port B***///
	  .enb(CTRL_CRAM_enb_wr), // port A read enable
	  .web(CTRL_CRAM_web_wr), // port A write enable
	  .addrb(CTRL_CRAM_addrb_wr), // port A address
	  .dinb(0), // port A data
	  .doutb(CTX_wr) // port A data output
	  );
	  
	Dual_Port_RAM_16K #
	(.DWIDTH(`DATA_WIDTH), .AWIDTH(`WRAM_ADDR_BITS)) 
	 WRAM (
	  .clk(CLK), // clock
	  ///*** Port A***///
	  .ena(AXI_WRAM_ena_in), // port A read enable
	  .wea(AXI_WRAM_wea_in), // port A write enable
	  .addra(AXI_WRAM_addra_in), // port A address
	  .dina(AXI_WRAM_dina_in), // port A data
	  .douta(), // port A data output
	  
	  ///*** Port B***///
	  .enb(CTRL_WRAM_enb_wr), // port A read enable
	  .web(CTRL_WRAM_web_wr), // port A write enable
	  .addrb(CTRL_WRAM_addrb_wr), // port A address
	  .dinb(0), // port A data
	  .doutb(Weight_wr) // port A data output
	  );

	Dual_Port_RAM_16K #
	(.DWIDTH(`DATA_WIDTH), .AWIDTH(`BRAM_ADDR_BITS))
	 BRAM (
	  .clk(CLK), // clock
	  ///*** Port A***///
	  .ena(AXI_BRAM_ena_in), // port A read enable
	  .wea(AXI_BRAM_wea_in), // port A write enable
	  .addra(AXI_BRAM_addra_in), // port A address
	  .dina(AXI_BRAM_dina_in), // port A data
	  .douta(), // port A data output
	  
	  ///*** Port B***///
	  .enb(CTRL_BRAM_enb_wr), // port A read enable
	  .web(CTRL_BRAM_web_wr), // port A write enable
	  .addrb(CTRL_BRAM_addrb_wr), // port A address
	  .dinb(0), // port A data
	  .doutb(Bias_wr) // port A data output
	  );
	  
	Controller controller
	(
		.CLK(CLK),
		.RST(RST),
		.start_in(start_in),
		.CTX_in(CTX_wr),
		.CTX_Max_addr_in(CTX_maxaddra_rg),    
		.CTRL_CRAM_addrb_out(CTRL_CRAM_addrb_wr),
		.CTRL_CRAM_enb_out(CTRL_CRAM_enb_wr),
		.CTRL_CRAM_web_out(CTRL_CRAM_web_wr),
		.CTRL_WRAM_addrb_out(CTRL_WRAM_addrb_wr),
		.CTRL_WRAM_enb_out(CTRL_WRAM_enb_wr),
		.CTRL_WRAM_web_out(CTRL_WRAM_web_wr),
		.CTRL_BRAM_addrb_out(CTRL_BRAM_addrb_wr),
		.CTRL_BRAM_enb_out(CTRL_BRAM_enb_wr),
		.CTRL_BRAM_web_out(CTRL_BRAM_web_wr),
		.Opcode_out(Opcode_wr),
		.MUX_Selection_out(MUX_Selection_wr),
		.Stride_out(Stride_wr),
		.Overarray_out(Overarray_wr),
		.En_out(En_wr),
		.layer_done_out(layer_done_wr),
		.Parity_PE_Selection_out(Parity_PE_Selection_wr),
		.CTRL_LDM_addra_out(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_out(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_out(CTRL_LDM_wea_wr),
		.CTRL_LDM_addrb_out(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_out(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_out(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_out(CTRL_LDM_Store_wr),
		.CTRL_LDM_addra_Incr_out(CTRL_LDM_addra_Incr_wr),
		.complete_out(complete_wr)
	);

	Global_Allocator gb
	(
		.CLK(CLK),
		.RST(RST),

		// Map PE0 signals
		.PE0_Pixel_0_in(Pixel_0_out_wr[0]),
		.PE0_Pixel_0_valid_in(Pixel_0_valid_out_wr[0]),
		.PE0_Pixel_1_in(Pixel_1_out_wr[0]),
		.PE0_Pixel_1_valid_in(Pixel_1_valid_out_wr[0]),

		// Map PE1 signals
		.PE1_Pixel_0_in(Pixel_0_out_wr[1]),
		.PE1_Pixel_0_valid_in(Pixel_0_valid_out_wr[1]),
		.PE1_Pixel_1_in(Pixel_1_out_wr[1]),
		.PE1_Pixel_1_valid_in(Pixel_1_valid_out_wr[1]),

		// Map PE2 signals
		.PE2_Pixel_0_in(Pixel_0_out_wr[2]),
		.PE2_Pixel_0_valid_in(Pixel_0_valid_out_wr[2]),
		.PE2_Pixel_1_in(Pixel_1_out_wr[2]),
		.PE2_Pixel_1_valid_in(Pixel_1_valid_out_wr[2]),

		// Map PE3 signals
		.PE3_Pixel_0_in(Pixel_0_out_wr[3]),
		.PE3_Pixel_0_valid_in(Pixel_0_valid_out_wr[3]),
		.PE3_Pixel_1_in(Pixel_1_out_wr[3]),
		.PE3_Pixel_1_valid_in(Pixel_1_valid_out_wr[3]),

		// Continue mapping for PEs 4-18
		.PE4_Pixel_0_in(Pixel_0_out_wr[4]),
		.PE4_Pixel_0_valid_in(Pixel_0_valid_out_wr[4]),
		.PE4_Pixel_1_in(Pixel_1_out_wr[4]),
		.PE4_Pixel_1_valid_in(Pixel_1_valid_out_wr[4]),

		.PE5_Pixel_0_in(Pixel_0_out_wr[5]),
		.PE5_Pixel_0_valid_in(Pixel_0_valid_out_wr[5]),
		.PE5_Pixel_1_in(Pixel_1_out_wr[5]),
		.PE5_Pixel_1_valid_in(Pixel_1_valid_out_wr[5]),

		.PE6_Pixel_0_in(Pixel_0_out_wr[6]),
		.PE6_Pixel_0_valid_in(Pixel_0_valid_out_wr[6]),
		.PE6_Pixel_1_in(Pixel_1_out_wr[6]),
		.PE6_Pixel_1_valid_in(Pixel_1_valid_out_wr[6]),

		.PE7_Pixel_0_in(Pixel_0_out_wr[7]),
		.PE7_Pixel_0_valid_in(Pixel_0_valid_out_wr[7]),
		.PE7_Pixel_1_in(Pixel_1_out_wr[7]),
		.PE7_Pixel_1_valid_in(Pixel_1_valid_out_wr[7]),

		.PE8_Pixel_0_in(Pixel_0_out_wr[8]),
		.PE8_Pixel_0_valid_in(Pixel_0_valid_out_wr[8]),
		.PE8_Pixel_1_in(Pixel_1_out_wr[8]),
		.PE8_Pixel_1_valid_in(Pixel_1_valid_out_wr[8]),

		.PE9_Pixel_0_in(Pixel_0_out_wr[9]),
		.PE9_Pixel_0_valid_in(Pixel_0_valid_out_wr[9]),
		.PE9_Pixel_1_in(Pixel_1_out_wr[9]),
		.PE9_Pixel_1_valid_in(Pixel_1_valid_out_wr[9]),

		.PE10_Pixel_0_in(Pixel_0_out_wr[10]),
		.PE10_Pixel_0_valid_in(Pixel_0_valid_out_wr[10]),
		.PE10_Pixel_1_in(Pixel_1_out_wr[10]),
		.PE10_Pixel_1_valid_in(Pixel_1_valid_out_wr[10]),

		.PE11_Pixel_0_in(Pixel_0_out_wr[11]),
		.PE11_Pixel_0_valid_in(Pixel_0_valid_out_wr[11]),
		.PE11_Pixel_1_in(Pixel_1_out_wr[11]),
		.PE11_Pixel_1_valid_in(Pixel_1_valid_out_wr[11]),

		.PE12_Pixel_0_in(Pixel_0_out_wr[12]),
		.PE12_Pixel_0_valid_in(Pixel_0_valid_out_wr[12]),
		.PE12_Pixel_1_in(Pixel_1_out_wr[12]),
		.PE12_Pixel_1_valid_in(Pixel_1_valid_out_wr[12]),

		.PE13_Pixel_0_in(Pixel_0_out_wr[13]),
		.PE13_Pixel_0_valid_in(Pixel_0_valid_out_wr[13]),
		.PE13_Pixel_1_in(Pixel_1_out_wr[13]),
		.PE13_Pixel_1_valid_in(Pixel_1_valid_out_wr[13]),

		.PE14_Pixel_0_in(Pixel_0_out_wr[14]),
		.PE14_Pixel_0_valid_in(Pixel_0_valid_out_wr[14]),
		.PE14_Pixel_1_in(Pixel_1_out_wr[14]),
		.PE14_Pixel_1_valid_in(Pixel_1_valid_out_wr[14]),

		.PE15_Pixel_0_in(Pixel_0_out_wr[15]),
		.PE15_Pixel_0_valid_in(Pixel_0_valid_out_wr[15]),
		.PE15_Pixel_1_in(Pixel_1_out_wr[15]),
		.PE15_Pixel_1_valid_in(Pixel_1_valid_out_wr[15]),

		.PE16_Pixel_0_in(Pixel_0_out_wr[16]),
		.PE16_Pixel_0_valid_in(Pixel_0_valid_out_wr[16]),
		.PE16_Pixel_1_in(Pixel_1_out_wr[16]),
		.PE16_Pixel_1_valid_in(Pixel_1_valid_out_wr[16]),

		.PE17_Pixel_0_in(Pixel_0_out_wr[17]),
		.PE17_Pixel_0_valid_in(Pixel_0_valid_out_wr[17]),
		.PE17_Pixel_1_in(Pixel_1_out_wr[17]),
		.PE17_Pixel_1_valid_in(Pixel_1_valid_out_wr[17]),

		.PE18_Pixel_0_in(Pixel_0_out_wr[18]),
		.PE18_Pixel_0_valid_in(Pixel_0_valid_out_wr[18]),
		.PE18_Pixel_1_in(Pixel_1_out_wr[18]),
		.PE18_Pixel_1_valid_in(Pixel_1_valid_out_wr[18]),

		.PE19_Pixel_0_in(Pixel_0_out_wr[19]),
		.PE19_Pixel_0_valid_in(Pixel_0_valid_out_wr[19]),
		.PE19_Pixel_1_in(Pixel_1_out_wr[19]),
		.PE19_Pixel_1_valid_in(Pixel_1_valid_out_wr[19]),
		
				.PE20_Pixel_0_in(Pixel_0_out_wr[20]),
		.PE20_Pixel_0_valid_in(Pixel_0_valid_out_wr[20]),
		.PE20_Pixel_1_in(Pixel_1_out_wr[20]),
		.PE20_Pixel_1_valid_in(Pixel_1_valid_out_wr[20]),

		.PE21_Pixel_0_in(Pixel_0_out_wr[21]),
		.PE21_Pixel_0_valid_in(Pixel_0_valid_out_wr[21]),
		.PE21_Pixel_1_in(Pixel_1_out_wr[21]),
		.PE21_Pixel_1_valid_in(Pixel_1_valid_out_wr[21]),

		.PE22_Pixel_0_in(Pixel_0_out_wr[22]),
		.PE22_Pixel_0_valid_in(Pixel_0_valid_out_wr[22]),
		.PE22_Pixel_1_in(Pixel_1_out_wr[22]),
		.PE22_Pixel_1_valid_in(Pixel_1_valid_out_wr[22]),

		.PE23_Pixel_0_in(Pixel_0_out_wr[23]),
		.PE23_Pixel_0_valid_in(Pixel_0_valid_out_wr[23]),
		.PE23_Pixel_1_in(Pixel_1_out_wr[23]),
		.PE23_Pixel_1_valid_in(Pixel_1_valid_out_wr[23]),

		.PE24_Pixel_0_in(Pixel_0_out_wr[24]),
		.PE24_Pixel_0_valid_in(Pixel_0_valid_out_wr[24]),
		.PE24_Pixel_1_in(Pixel_1_out_wr[24]),
		.PE24_Pixel_1_valid_in(Pixel_1_valid_out_wr[24]),

		.PE25_Pixel_0_in(Pixel_0_out_wr[25]),
		.PE25_Pixel_0_valid_in(Pixel_0_valid_out_wr[25]),
		.PE25_Pixel_1_in(Pixel_1_out_wr[25]),
		.PE25_Pixel_1_valid_in(Pixel_1_valid_out_wr[25]),

		.PE26_Pixel_0_in(Pixel_0_out_wr[26]),
		.PE26_Pixel_0_valid_in(Pixel_0_valid_out_wr[26]),
		.PE26_Pixel_1_in(Pixel_1_out_wr[26]),
		.PE26_Pixel_1_valid_in(Pixel_1_valid_out_wr[26]),

		.PE27_Pixel_0_in(Pixel_0_out_wr[27]),
		.PE27_Pixel_0_valid_in(Pixel_0_valid_out_wr[27]),
		.PE27_Pixel_1_in(Pixel_1_out_wr[27]),
		.PE27_Pixel_1_valid_in(Pixel_1_valid_out_wr[27]),

		.PE28_Pixel_0_in(Pixel_0_out_wr[28]),
		.PE28_Pixel_0_valid_in(Pixel_0_valid_out_wr[28]),
		.PE28_Pixel_1_in(Pixel_1_out_wr[28]),
		.PE28_Pixel_1_valid_in(Pixel_1_valid_out_wr[28]),

		.PE29_Pixel_0_in(Pixel_0_out_wr[29]),
		.PE29_Pixel_0_valid_in(Pixel_0_valid_out_wr[29]),
		.PE29_Pixel_1_in(Pixel_1_out_wr[29]),
		.PE29_Pixel_1_valid_in(Pixel_1_valid_out_wr[29]),

		.PE30_Pixel_0_in(Pixel_0_out_wr[30]),
		.PE30_Pixel_0_valid_in(Pixel_0_valid_out_wr[30]),
		.PE30_Pixel_1_in(Pixel_1_out_wr[30]),
		.PE30_Pixel_1_valid_in(Pixel_1_valid_out_wr[30]),

		.PE31_Pixel_0_in(Pixel_0_out_wr[31]),
		.PE31_Pixel_0_valid_in(Pixel_0_valid_out_wr[31]),
		.PE31_Pixel_1_in(Pixel_1_out_wr[31]),
		.PE31_Pixel_1_valid_in(Pixel_1_valid_out_wr[31]),

		.PE32_Pixel_0_in(Pixel_0_out_wr[32]),
		.PE32_Pixel_0_valid_in(Pixel_0_valid_out_wr[32]),
		.PE32_Pixel_1_in(Pixel_1_out_wr[32]),
		.PE32_Pixel_1_valid_in(Pixel_1_valid_out_wr[32]),

		.PE33_Pixel_0_in(Pixel_0_out_wr[33]),
		.PE33_Pixel_0_valid_in(Pixel_0_valid_out_wr[33]),
		.PE33_Pixel_1_in(Pixel_1_out_wr[33]),
		.PE33_Pixel_1_valid_in(Pixel_1_valid_out_wr[33]),

		.PE34_Pixel_0_in(Pixel_0_out_wr[34]),
		.PE34_Pixel_0_valid_in(Pixel_0_valid_out_wr[34]),
		.PE34_Pixel_1_in(Pixel_1_out_wr[34]),
		.PE34_Pixel_1_valid_in(Pixel_1_valid_out_wr[34]),

		.PE35_Pixel_0_in(Pixel_0_out_wr[35]),
		.PE35_Pixel_0_valid_in(Pixel_0_valid_out_wr[35]),
		.PE35_Pixel_1_in(Pixel_1_out_wr[35]),
		.PE35_Pixel_1_valid_in(Pixel_1_valid_out_wr[35]),

		.PE36_Pixel_0_in(Pixel_0_out_wr[36]),
		.PE36_Pixel_0_valid_in(Pixel_0_valid_out_wr[36]),
		.PE36_Pixel_1_in(Pixel_1_out_wr[36]),
		.PE36_Pixel_1_valid_in(Pixel_1_valid_out_wr[36]),

		.PE37_Pixel_0_in(Pixel_0_out_wr[37]),
		.PE37_Pixel_0_valid_in(Pixel_0_valid_out_wr[37]),
		.PE37_Pixel_1_in(Pixel_1_out_wr[37]),
		.PE37_Pixel_1_valid_in(Pixel_1_valid_out_wr[37]),

		.PE38_Pixel_0_in(Pixel_0_out_wr[38]),
		.PE38_Pixel_0_valid_in(Pixel_0_valid_out_wr[38]),
		.PE38_Pixel_1_in(Pixel_1_out_wr[38]),
		.PE38_Pixel_1_valid_in(Pixel_1_valid_out_wr[38]),

		.PE39_Pixel_0_in(Pixel_0_out_wr[39]),
		.PE39_Pixel_0_valid_in(Pixel_0_valid_out_wr[39]),
		.PE39_Pixel_1_in(Pixel_1_out_wr[39]),
		.PE39_Pixel_1_valid_in(Pixel_1_valid_out_wr[39]),

		// Map control signals from the Controller
		.En_in(En_wr),
		.Opcode_in(Opcode_wr[`ALU_OPCODE-2:0]),
		.MUX_Selection_in(MUX_Selection_rg),
		
		.PE0_Pixel_0_out(Pixel_0_in_wr[0]),
		.PE0_Pixel_0_valid_out(Pixel_0_valid_in_wr[0]),
		.PE0_Pixel_1_out(Pixel_1_in_wr[0]),
		.PE0_Pixel_1_valid_out(Pixel_1_valid_in_wr[0]),
		.PE0_Pixel_2_out(Pixel_2_in_wr[0]),
		.PE0_Pixel_2_valid_out(Pixel_2_valid_in_wr[0]),
		
		.PE1_Pixel_0_out(Pixel_0_in_wr[1]),
		.PE1_Pixel_0_valid_out(Pixel_0_valid_in_wr[1]),
		.PE1_Pixel_1_out(Pixel_1_in_wr[1]),
		.PE1_Pixel_1_valid_out(Pixel_1_valid_in_wr[1]),
		.PE1_Pixel_2_out(Pixel_2_in_wr[1]),
		.PE1_Pixel_2_valid_out(Pixel_2_valid_in_wr[1]),
		
		.PE2_Pixel_0_out(Pixel_0_in_wr[2]),
		.PE2_Pixel_0_valid_out(Pixel_0_valid_in_wr[2]),
		.PE2_Pixel_1_out(Pixel_1_in_wr[2]),
		.PE2_Pixel_1_valid_out(Pixel_1_valid_in_wr[2]),
		.PE2_Pixel_2_out(Pixel_2_in_wr[2]),
		.PE2_Pixel_2_valid_out(Pixel_2_valid_in_wr[2]),

		.PE3_Pixel_0_out(Pixel_0_in_wr[3]),
		.PE3_Pixel_0_valid_out(Pixel_0_valid_in_wr[3]),
		.PE3_Pixel_1_out(Pixel_1_in_wr[3]),
		.PE3_Pixel_1_valid_out(Pixel_1_valid_in_wr[3]),
		.PE3_Pixel_2_out(Pixel_2_in_wr[3]),
		.PE3_Pixel_2_valid_out(Pixel_2_valid_in_wr[3]),

		.PE4_Pixel_0_out(Pixel_0_in_wr[4]),
		.PE4_Pixel_0_valid_out(Pixel_0_valid_in_wr[4]),
		.PE4_Pixel_1_out(Pixel_1_in_wr[4]),
		.PE4_Pixel_1_valid_out(Pixel_1_valid_in_wr[4]),
		.PE4_Pixel_2_out(Pixel_2_in_wr[4]),
		.PE4_Pixel_2_valid_out(Pixel_2_valid_in_wr[4]),

		.PE5_Pixel_0_out(Pixel_0_in_wr[5]),
		.PE5_Pixel_0_valid_out(Pixel_0_valid_in_wr[5]),
		.PE5_Pixel_1_out(Pixel_1_in_wr[5]),
		.PE5_Pixel_1_valid_out(Pixel_1_valid_in_wr[5]),
		.PE5_Pixel_2_out(Pixel_2_in_wr[5]),
		.PE5_Pixel_2_valid_out(Pixel_2_valid_in_wr[5]),

		.PE6_Pixel_0_out(Pixel_0_in_wr[6]),
		.PE6_Pixel_0_valid_out(Pixel_0_valid_in_wr[6]),
		.PE6_Pixel_1_out(Pixel_1_in_wr[6]),
		.PE6_Pixel_1_valid_out(Pixel_1_valid_in_wr[6]),
		.PE6_Pixel_2_out(Pixel_2_in_wr[6]),
		.PE6_Pixel_2_valid_out(Pixel_2_valid_in_wr[6]),

		.PE7_Pixel_0_out(Pixel_0_in_wr[7]),
		.PE7_Pixel_0_valid_out(Pixel_0_valid_in_wr[7]),
		.PE7_Pixel_1_out(Pixel_1_in_wr[7]),
		.PE7_Pixel_1_valid_out(Pixel_1_valid_in_wr[7]),
		.PE7_Pixel_2_out(Pixel_2_in_wr[7]),
		.PE7_Pixel_2_valid_out(Pixel_2_valid_in_wr[7]),

		.PE8_Pixel_0_out(Pixel_0_in_wr[8]),
		.PE8_Pixel_0_valid_out(Pixel_0_valid_in_wr[8]),
		.PE8_Pixel_1_out(Pixel_1_in_wr[8]),
		.PE8_Pixel_1_valid_out(Pixel_1_valid_in_wr[8]),
		.PE8_Pixel_2_out(Pixel_2_in_wr[8]),
		.PE8_Pixel_2_valid_out(Pixel_2_valid_in_wr[8]),

		.PE9_Pixel_0_out(Pixel_0_in_wr[9]),
		.PE9_Pixel_0_valid_out(Pixel_0_valid_in_wr[9]),
		.PE9_Pixel_1_out(Pixel_1_in_wr[9]),
		.PE9_Pixel_1_valid_out(Pixel_1_valid_in_wr[9]),
		.PE9_Pixel_2_out(Pixel_2_in_wr[9]),
		.PE9_Pixel_2_valid_out(Pixel_2_valid_in_wr[9]),

		.PE10_Pixel_0_out(Pixel_0_in_wr[10]),
		.PE10_Pixel_0_valid_out(Pixel_0_valid_in_wr[10]),
		.PE10_Pixel_1_out(Pixel_1_in_wr[10]),
		.PE10_Pixel_1_valid_out(Pixel_1_valid_in_wr[10]),
		.PE10_Pixel_2_out(Pixel_2_in_wr[10]),
		.PE10_Pixel_2_valid_out(Pixel_2_valid_in_wr[10]),

		.PE11_Pixel_0_out(Pixel_0_in_wr[11]),
		.PE11_Pixel_0_valid_out(Pixel_0_valid_in_wr[11]),
		.PE11_Pixel_1_out(Pixel_1_in_wr[11]),
		.PE11_Pixel_1_valid_out(Pixel_1_valid_in_wr[11]),
		.PE11_Pixel_2_out(Pixel_2_in_wr[11]),
		.PE11_Pixel_2_valid_out(Pixel_2_valid_in_wr[11]),

		.PE12_Pixel_0_out(Pixel_0_in_wr[12]),
		.PE12_Pixel_0_valid_out(Pixel_0_valid_in_wr[12]),
		.PE12_Pixel_1_out(Pixel_1_in_wr[12]),
		.PE12_Pixel_1_valid_out(Pixel_1_valid_in_wr[12]),
		.PE12_Pixel_2_out(Pixel_2_in_wr[12]),
		.PE12_Pixel_2_valid_out(Pixel_2_valid_in_wr[12]),

		.PE13_Pixel_0_out(Pixel_0_in_wr[13]),
		.PE13_Pixel_0_valid_out(Pixel_0_valid_in_wr[13]),
		.PE13_Pixel_1_out(Pixel_1_in_wr[13]),
		.PE13_Pixel_1_valid_out(Pixel_1_valid_in_wr[13]),
		.PE13_Pixel_2_out(Pixel_2_in_wr[13]),
		.PE13_Pixel_2_valid_out(Pixel_2_valid_in_wr[13]),

		.PE14_Pixel_0_out(Pixel_0_in_wr[14]),
		.PE14_Pixel_0_valid_out(Pixel_0_valid_in_wr[14]),
		.PE14_Pixel_1_out(Pixel_1_in_wr[14]),
		.PE14_Pixel_1_valid_out(Pixel_1_valid_in_wr[14]),
		.PE14_Pixel_2_out(Pixel_2_in_wr[14]),
		.PE14_Pixel_2_valid_out(Pixel_2_valid_in_wr[14]),

		.PE15_Pixel_0_out(Pixel_0_in_wr[15]),
		.PE15_Pixel_0_valid_out(Pixel_0_valid_in_wr[15]),
		.PE15_Pixel_1_out(Pixel_1_in_wr[15]),
		.PE15_Pixel_1_valid_out(Pixel_1_valid_in_wr[15]),
		.PE15_Pixel_2_out(Pixel_2_in_wr[15]),
		.PE15_Pixel_2_valid_out(Pixel_2_valid_in_wr[15]),

		.PE16_Pixel_0_out(Pixel_0_in_wr[16]),
		.PE16_Pixel_0_valid_out(Pixel_0_valid_in_wr[16]),
		.PE16_Pixel_1_out(Pixel_1_in_wr[16]),
		.PE16_Pixel_1_valid_out(Pixel_1_valid_in_wr[16]),
		.PE16_Pixel_2_out(Pixel_2_in_wr[16]),
		.PE16_Pixel_2_valid_out(Pixel_2_valid_in_wr[16]),

		.PE17_Pixel_0_out(Pixel_0_in_wr[17]),
		.PE17_Pixel_0_valid_out(Pixel_0_valid_in_wr[17]),
		.PE17_Pixel_1_out(Pixel_1_in_wr[17]),
		.PE17_Pixel_1_valid_out(Pixel_1_valid_in_wr[17]),
		.PE17_Pixel_2_out(Pixel_2_in_wr[17]),
		.PE17_Pixel_2_valid_out(Pixel_2_valid_in_wr[17]),

		.PE18_Pixel_0_out(Pixel_0_in_wr[18]),
		.PE18_Pixel_0_valid_out(Pixel_0_valid_in_wr[18]),
		.PE18_Pixel_1_out(Pixel_1_in_wr[18]),
		.PE18_Pixel_1_valid_out(Pixel_1_valid_in_wr[18]),
		.PE18_Pixel_2_out(Pixel_2_in_wr[18]),
		.PE18_Pixel_2_valid_out(Pixel_2_valid_in_wr[18]),

		.PE19_Pixel_0_out(Pixel_0_in_wr[19]),
		.PE19_Pixel_0_valid_out(Pixel_0_valid_in_wr[19]),
		.PE19_Pixel_1_out(Pixel_1_in_wr[19]),
		.PE19_Pixel_1_valid_out(Pixel_1_valid_in_wr[19]),
		.PE19_Pixel_2_out(Pixel_2_in_wr[19]),
		.PE19_Pixel_2_valid_out(Pixel_2_valid_in_wr[19]),
		
		.PE20_Pixel_0_out(Pixel_0_in_wr[20]),
		.PE20_Pixel_0_valid_out(Pixel_0_valid_in_wr[20]),
		.PE20_Pixel_1_out(Pixel_1_in_wr[20]),
		.PE20_Pixel_1_valid_out(Pixel_1_valid_in_wr[20]),
		.PE20_Pixel_2_out(Pixel_2_in_wr[20]),
		.PE20_Pixel_2_valid_out(Pixel_2_valid_in_wr[20]),

        .PE21_Pixel_0_out(Pixel_0_in_wr[21]),
		.PE21_Pixel_0_valid_out(Pixel_0_valid_in_wr[21]),
		.PE21_Pixel_1_out(Pixel_1_in_wr[21]),
		.PE21_Pixel_1_valid_out(Pixel_1_valid_in_wr[21]),
		.PE21_Pixel_2_out(Pixel_2_in_wr[21]),
		.PE21_Pixel_2_valid_out(Pixel_2_valid_in_wr[21]),

        .PE22_Pixel_0_out(Pixel_0_in_wr[22]),
		.PE22_Pixel_0_valid_out(Pixel_0_valid_in_wr[22]),
		.PE22_Pixel_1_out(Pixel_1_in_wr[22]),
		.PE22_Pixel_1_valid_out(Pixel_1_valid_in_wr[22]),
		.PE22_Pixel_2_out(Pixel_2_in_wr[22]),
		.PE22_Pixel_2_valid_out(Pixel_2_valid_in_wr[22]),

        .PE23_Pixel_0_out(Pixel_0_in_wr[23]),
		.PE23_Pixel_0_valid_out(Pixel_0_valid_in_wr[23]),
		.PE23_Pixel_1_out(Pixel_1_in_wr[23]),
		.PE23_Pixel_1_valid_out(Pixel_1_valid_in_wr[23]),
		.PE23_Pixel_2_out(Pixel_2_in_wr[23]),
		.PE23_Pixel_2_valid_out(Pixel_2_valid_in_wr[23]),

        .PE24_Pixel_0_out(Pixel_0_in_wr[24]),
		.PE24_Pixel_0_valid_out(Pixel_0_valid_in_wr[24]),
		.PE24_Pixel_1_out(Pixel_1_in_wr[24]),
		.PE24_Pixel_1_valid_out(Pixel_1_valid_in_wr[24]),
		.PE24_Pixel_2_out(Pixel_2_in_wr[24]),
		.PE24_Pixel_2_valid_out(Pixel_2_valid_in_wr[24]),

        .PE25_Pixel_0_out(Pixel_0_in_wr[25]),
		.PE25_Pixel_0_valid_out(Pixel_0_valid_in_wr[25]),
		.PE25_Pixel_1_out(Pixel_1_in_wr[25]),
		.PE25_Pixel_1_valid_out(Pixel_1_valid_in_wr[25]),
		.PE25_Pixel_2_out(Pixel_2_in_wr[25]),
		.PE25_Pixel_2_valid_out(Pixel_2_valid_in_wr[25]),

        .PE26_Pixel_0_out(Pixel_0_in_wr[26]),
		.PE26_Pixel_0_valid_out(Pixel_0_valid_in_wr[26]),
		.PE26_Pixel_1_out(Pixel_1_in_wr[26]),
		.PE26_Pixel_1_valid_out(Pixel_1_valid_in_wr[26]),
		.PE26_Pixel_2_out(Pixel_2_in_wr[26]),
		.PE26_Pixel_2_valid_out(Pixel_2_valid_in_wr[26]),

        .PE27_Pixel_0_out(Pixel_0_in_wr[27]),
		.PE27_Pixel_0_valid_out(Pixel_0_valid_in_wr[27]),
		.PE27_Pixel_1_out(Pixel_1_in_wr[27]),
		.PE27_Pixel_1_valid_out(Pixel_1_valid_in_wr[27]),
		.PE27_Pixel_2_out(Pixel_2_in_wr[27]),
		.PE27_Pixel_2_valid_out(Pixel_2_valid_in_wr[27]),

        .PE28_Pixel_0_out(Pixel_0_in_wr[28]),
		.PE28_Pixel_0_valid_out(Pixel_0_valid_in_wr[28]),
		.PE28_Pixel_1_out(Pixel_1_in_wr[28]),
		.PE28_Pixel_1_valid_out(Pixel_1_valid_in_wr[28]),
		.PE28_Pixel_2_out(Pixel_2_in_wr[28]),
		.PE28_Pixel_2_valid_out(Pixel_2_valid_in_wr[28]),

        .PE29_Pixel_0_out(Pixel_0_in_wr[29]),
		.PE29_Pixel_0_valid_out(Pixel_0_valid_in_wr[29]),
		.PE29_Pixel_1_out(Pixel_1_in_wr[29]),
		.PE29_Pixel_1_valid_out(Pixel_1_valid_in_wr[29]),
		.PE29_Pixel_2_out(Pixel_2_in_wr[29]),
		.PE29_Pixel_2_valid_out(Pixel_2_valid_in_wr[29]),

        .PE30_Pixel_0_out(Pixel_0_in_wr[30]),
		.PE30_Pixel_0_valid_out(Pixel_0_valid_in_wr[30]),
		.PE30_Pixel_1_out(Pixel_1_in_wr[30]),
		.PE30_Pixel_1_valid_out(Pixel_1_valid_in_wr[30]),
		.PE30_Pixel_2_out(Pixel_2_in_wr[30]),
		.PE30_Pixel_2_valid_out(Pixel_2_valid_in_wr[30]),

        .PE31_Pixel_0_out(Pixel_0_in_wr[31]),
		.PE31_Pixel_0_valid_out(Pixel_0_valid_in_wr[31]),
		.PE31_Pixel_1_out(Pixel_1_in_wr[31]),
		.PE31_Pixel_1_valid_out(Pixel_1_valid_in_wr[31]),
		.PE31_Pixel_2_out(Pixel_2_in_wr[31]),
		.PE31_Pixel_2_valid_out(Pixel_2_valid_in_wr[31]),

        .PE32_Pixel_0_out(Pixel_0_in_wr[32]),
		.PE32_Pixel_0_valid_out(Pixel_0_valid_in_wr[32]),
		.PE32_Pixel_1_out(Pixel_1_in_wr[32]),
		.PE32_Pixel_1_valid_out(Pixel_1_valid_in_wr[32]),
		.PE32_Pixel_2_out(Pixel_2_in_wr[32]),
		.PE32_Pixel_2_valid_out(Pixel_2_valid_in_wr[32]),

        .PE33_Pixel_0_out(Pixel_0_in_wr[33]),
		.PE33_Pixel_0_valid_out(Pixel_0_valid_in_wr[33]),
		.PE33_Pixel_1_out(Pixel_1_in_wr[33]),
		.PE33_Pixel_1_valid_out(Pixel_1_valid_in_wr[33]),
		.PE33_Pixel_2_out(Pixel_2_in_wr[33]),
		.PE33_Pixel_2_valid_out(Pixel_2_valid_in_wr[33]),

        .PE34_Pixel_0_out(Pixel_0_in_wr[34]),
		.PE34_Pixel_0_valid_out(Pixel_0_valid_in_wr[34]),
		.PE34_Pixel_1_out(Pixel_1_in_wr[34]),
		.PE34_Pixel_1_valid_out(Pixel_1_valid_in_wr[34]),
		.PE34_Pixel_2_out(Pixel_2_in_wr[34]),
		.PE34_Pixel_2_valid_out(Pixel_2_valid_in_wr[34]),

        .PE35_Pixel_0_out(Pixel_0_in_wr[35]),
		.PE35_Pixel_0_valid_out(Pixel_0_valid_in_wr[35]),
		.PE35_Pixel_1_out(Pixel_1_in_wr[35]),
		.PE35_Pixel_1_valid_out(Pixel_1_valid_in_wr[35]),
		.PE35_Pixel_2_out(Pixel_2_in_wr[35]),
		.PE35_Pixel_2_valid_out(Pixel_2_valid_in_wr[35]),

        .PE36_Pixel_0_out(Pixel_0_in_wr[36]),
		.PE36_Pixel_0_valid_out(Pixel_0_valid_in_wr[36]),
		.PE36_Pixel_1_out(Pixel_1_in_wr[36]),
		.PE36_Pixel_1_valid_out(Pixel_1_valid_in_wr[36]),
		.PE36_Pixel_2_out(Pixel_2_in_wr[36]),
		.PE36_Pixel_2_valid_out(Pixel_2_valid_in_wr[36]),

        .PE37_Pixel_0_out(Pixel_0_in_wr[37]),
		.PE37_Pixel_0_valid_out(Pixel_0_valid_in_wr[37]),
		.PE37_Pixel_1_out(Pixel_1_in_wr[37]),
		.PE37_Pixel_1_valid_out(Pixel_1_valid_in_wr[37]),
		.PE37_Pixel_2_out(Pixel_2_in_wr[37]),
		.PE37_Pixel_2_valid_out(Pixel_2_valid_in_wr[37]),

        .PE38_Pixel_0_out(Pixel_0_in_wr[38]),
		.PE38_Pixel_0_valid_out(Pixel_0_valid_in_wr[38]),
		.PE38_Pixel_1_out(Pixel_1_in_wr[38]),
		.PE38_Pixel_1_valid_out(Pixel_1_valid_in_wr[38]),
		.PE38_Pixel_2_out(Pixel_2_in_wr[38]),
		.PE38_Pixel_2_valid_out(Pixel_2_valid_in_wr[38]),

        .PE39_Pixel_0_out(Pixel_0_in_wr[39]),
		.PE39_Pixel_0_valid_out(Pixel_0_valid_in_wr[39]),
		.PE39_Pixel_1_out(Pixel_1_in_wr[39]),
		.PE39_Pixel_1_valid_out(Pixel_1_valid_in_wr[39]),
		.PE39_Pixel_2_out(Pixel_2_in_wr[39]),
		.PE39_Pixel_2_valid_out(Pixel_2_valid_in_wr[39])

	);

	PE 
	#(
		.PE_IDX(0)
	)
	pe0 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),                                                
		.AXI_LDM_douta_out(AXI_LDM_douta_out_wr),
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[0]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[0]),    
		.Pixel_0_in(Pixel_0_in_wr[0]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[0]),    
		.Pixel_1_in(Pixel_1_in_wr[0]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[0]),    
		.Pixel_2_in(Pixel_2_in_wr[0]),    
		.Pixel_0_out(Pixel_0_out_wr[0]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[0]),
		.Pixel_1_out(Pixel_1_out_wr[0]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[0])
	);

	PE 
	#(
		.PE_IDX(1)
	)
	pe1 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),                                                
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
        .Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[1]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[1]),    
		.Pixel_0_in(Pixel_0_in_wr[1]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[1]),    
		.Pixel_1_in(Pixel_1_in_wr[1]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[1]),    
		.Pixel_2_in(Pixel_2_in_wr[1]),    
		.Pixel_0_out(Pixel_0_out_wr[1]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[1]),
		.Pixel_1_out(Pixel_1_out_wr[1]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[1])
	);

	PE 
	#(
		.PE_IDX(2)
	)
	pe2 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),  
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[2]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[2]),    
		.Pixel_0_in(Pixel_0_in_wr[2]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[2]),    
		.Pixel_1_in(Pixel_1_in_wr[2]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[2]),    
		.Pixel_2_in(Pixel_2_in_wr[2]),    
		.Pixel_0_out(Pixel_0_out_wr[2]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[2]),
		.Pixel_1_out(Pixel_1_out_wr[2]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[2])
	);

	PE 
	#(
		.PE_IDX(3)
	)
	pe3 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[3]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[3]),    
		.Pixel_0_in(Pixel_0_in_wr[3]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[3]),    
		.Pixel_1_in(Pixel_1_in_wr[3]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[3]),    
		.Pixel_2_in(Pixel_2_in_wr[3]),    
		.Pixel_0_out(Pixel_0_out_wr[3]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[3]),
		.Pixel_1_out(Pixel_1_out_wr[3]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[3])
	);

	PE 
	#(
		.PE_IDX(4)
	)
	pe4 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),        
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[4]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[4]),    
		.Pixel_0_in(Pixel_0_in_wr[4]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[4]),    
		.Pixel_1_in(Pixel_1_in_wr[4]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[4]),    
		.Pixel_2_in(Pixel_2_in_wr[4]),    
		.Pixel_0_out(Pixel_0_out_wr[4]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[4]),
		.Pixel_1_out(Pixel_1_out_wr[4]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[4])
	);

	PE 
	#(
		.PE_IDX(5)
	)
	pe5 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[5]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[5]),    
		.Pixel_0_in(Pixel_0_in_wr[5]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[5]),    
		.Pixel_1_in(Pixel_1_in_wr[5]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[5]),    
		.Pixel_2_in(Pixel_2_in_wr[5]),    
		.Pixel_0_out(Pixel_0_out_wr[5]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[5]),
		.Pixel_1_out(Pixel_1_out_wr[5]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[5])
	);

	PE 
	#(
		.PE_IDX(6)
	)
	pe6 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[6]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[6]),    
		.Pixel_0_in(Pixel_0_in_wr[6]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[6]),    
		.Pixel_1_in(Pixel_1_in_wr[6]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[6]),    
		.Pixel_2_in(Pixel_2_in_wr[6]),    
		.Pixel_0_out(Pixel_0_out_wr[6]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[6]),
		.Pixel_1_out(Pixel_1_out_wr[6]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[6])
	);

	PE 
	#(
		.PE_IDX(7)
	)
	pe7 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[7]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[7]),    
		.Pixel_0_in(Pixel_0_in_wr[7]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[7]),    
		.Pixel_1_in(Pixel_1_in_wr[7]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[7]),    
		.Pixel_2_in(Pixel_2_in_wr[7]),    
		.Pixel_0_out(Pixel_0_out_wr[7]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[7]),
		.Pixel_1_out(Pixel_1_out_wr[7]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[7])
	);

	PE 
	#(
		.PE_IDX(8)
	)
	pe8 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[8]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[8]),    
		.Pixel_0_in(Pixel_0_in_wr[8]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[8]),    
		.Pixel_1_in(Pixel_1_in_wr[8]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[8]),    
		.Pixel_2_in(Pixel_2_in_wr[8]),    
		.Pixel_0_out(Pixel_0_out_wr[8]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[8]),
		.Pixel_1_out(Pixel_1_out_wr[8]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[8])
	);

	PE 
	#(
		.PE_IDX(9)
	)
	pe9 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[9]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[9]),    
		.Pixel_0_in(Pixel_0_in_wr[9]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[9]),    
		.Pixel_1_in(Pixel_1_in_wr[9]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[9]),    
		.Pixel_2_in(Pixel_2_in_wr[9]),    
		.Pixel_0_out(Pixel_0_out_wr[9]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[9]),
		.Pixel_1_out(Pixel_1_out_wr[9]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[9])
	);

	PE 
	#(
		.PE_IDX(10)
	)
	pe10 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[10]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[10]),    
		.Pixel_0_in(Pixel_0_in_wr[10]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[10]),    
		.Pixel_1_in(Pixel_1_in_wr[10]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[10]),    
		.Pixel_2_in(Pixel_2_in_wr[10]),    
		.Pixel_0_out(Pixel_0_out_wr[10]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[10]),
		.Pixel_1_out(Pixel_1_out_wr[10]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[10])
	);

	PE 
	#(
		.PE_IDX(11)
	)
	pe11 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),      
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[11]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[11]),    
		.Pixel_0_in(Pixel_0_in_wr[11]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[11]),    
		.Pixel_1_in(Pixel_1_in_wr[11]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[11]),    
		.Pixel_2_in(Pixel_2_in_wr[11]),    
		.Pixel_0_out(Pixel_0_out_wr[11]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[11]),
		.Pixel_1_out(Pixel_1_out_wr[11]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[11])
	);

	PE 
	#(
		.PE_IDX(12)
	)
	pe12 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[12]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[12]),    
		.Pixel_0_in(Pixel_0_in_wr[12]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[12]),    
		.Pixel_1_in(Pixel_1_in_wr[12]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[12]),    
		.Pixel_2_in(Pixel_2_in_wr[12]),    
		.Pixel_0_out(Pixel_0_out_wr[12]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[12]),
		.Pixel_1_out(Pixel_1_out_wr[12]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[12])
	);

	PE 
	#(
		.PE_IDX(13)
	)
	pe13 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),  
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[13]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[13]),    
		.Pixel_0_in(Pixel_0_in_wr[13]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[13]),    
		.Pixel_1_in(Pixel_1_in_wr[13]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[13]),    
		.Pixel_2_in(Pixel_2_in_wr[13]),    
		.Pixel_0_out(Pixel_0_out_wr[13]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[13]),
		.Pixel_1_out(Pixel_1_out_wr[13]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[13])
	);

	PE 
	#(
		.PE_IDX(14)
	)
	pe14 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),       
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[14]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[14]),    
		.Pixel_0_in(Pixel_0_in_wr[14]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[14]),    
		.Pixel_1_in(Pixel_1_in_wr[14]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[14]),    
		.Pixel_2_in(Pixel_2_in_wr[14]),    
		.Pixel_0_out(Pixel_0_out_wr[14]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[14]),
		.Pixel_1_out(Pixel_1_out_wr[14]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[14])
	);

	PE 
	#(
		.PE_IDX(15)
	)
	pe15 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[15]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[15]),    
		.Pixel_0_in(Pixel_0_in_wr[15]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[15]),    
		.Pixel_1_in(Pixel_1_in_wr[15]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[15]),    
		.Pixel_2_in(Pixel_2_in_wr[15]),    
		.Pixel_0_out(Pixel_0_out_wr[15]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[15]),
		.Pixel_1_out(Pixel_1_out_wr[15]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[15])
	);

	PE 
	#(
		.PE_IDX(16)
	)
	pe16 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),        
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[16]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[16]),    
		.Pixel_0_in(Pixel_0_in_wr[16]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[16]),    
		.Pixel_1_in(Pixel_1_in_wr[16]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[16]),    
		.Pixel_2_in(Pixel_2_in_wr[16]),    
		.Pixel_0_out(Pixel_0_out_wr[16]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[16]),
		.Pixel_1_out(Pixel_1_out_wr[16]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[16])
	);

	PE 
	#(
		.PE_IDX(17)
	)
	pe17 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),      
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[17]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[17]),    
		.Pixel_0_in(Pixel_0_in_wr[17]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[17]),    
		.Pixel_1_in(Pixel_1_in_wr[17]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[17]),    
		.Pixel_2_in(Pixel_2_in_wr[17]),    
		.Pixel_0_out(Pixel_0_out_wr[17]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[17]),
		.Pixel_1_out(Pixel_1_out_wr[17]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[17])
	);

	PE 
	#(
		.PE_IDX(18)
	)
	pe18 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),       
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[18]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[18]),    
		.Pixel_0_in(Pixel_0_in_wr[18]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[18]),    
		.Pixel_1_in(Pixel_1_in_wr[18]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[18]),    
		.Pixel_2_in(Pixel_2_in_wr[18]),    
		.Pixel_0_out(Pixel_0_out_wr[18]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[18]),
		.Pixel_1_out(Pixel_1_out_wr[18]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[18])
	);

	PE 
	#(
		.PE_IDX(19)
	)
	pe19 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[19]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[19]),    
		.Pixel_0_in(Pixel_0_in_wr[19]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[19]),    
		.Pixel_1_in(Pixel_1_in_wr[19]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[19]),    
		.Pixel_2_in(Pixel_2_in_wr[19]),    
		.Pixel_0_out(Pixel_0_out_wr[19]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[19]),
		.Pixel_1_out(Pixel_1_out_wr[19]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[19])
	);

	PE 
	#(
		.PE_IDX(20)
	)
	pe20 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),      
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[20]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[20]),    
		.Pixel_0_in(Pixel_0_in_wr[20]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[20]),    
		.Pixel_1_in(Pixel_1_in_wr[20]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[20]),    
		.Pixel_2_in(Pixel_2_in_wr[20]),    
		.Pixel_0_out(Pixel_0_out_wr[20]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[20]),
		.Pixel_1_out(Pixel_1_out_wr[20]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[20])
	);

	PE 
	#(
		.PE_IDX(21)
	)
	pe21 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[21]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[21]),    
		.Pixel_0_in(Pixel_0_in_wr[21]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[21]),    
		.Pixel_1_in(Pixel_1_in_wr[21]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[21]),    
		.Pixel_2_in(Pixel_2_in_wr[21]),    
		.Pixel_0_out(Pixel_0_out_wr[21]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[21]),
		.Pixel_1_out(Pixel_1_out_wr[21]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[21])
	);

	PE 
	#(
		.PE_IDX(22)
	)
	pe22 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[22]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[22]),    
		.Pixel_0_in(Pixel_0_in_wr[22]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[22]),    
		.Pixel_1_in(Pixel_1_in_wr[22]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[22]),    
		.Pixel_2_in(Pixel_2_in_wr[22]),    
		.Pixel_0_out(Pixel_0_out_wr[22]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[22]),
		.Pixel_1_out(Pixel_1_out_wr[22]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[22])
	);

	PE 
	#(
		.PE_IDX(23)
	)
	pe23 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[23]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[23]),    
		.Pixel_0_in(Pixel_0_in_wr[23]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[23]),    
		.Pixel_1_in(Pixel_1_in_wr[23]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[23]),    
		.Pixel_2_in(Pixel_2_in_wr[23]),    
		.Pixel_0_out(Pixel_0_out_wr[23]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[23]),
		.Pixel_1_out(Pixel_1_out_wr[23]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[23])
	);

	PE 
	#(
		.PE_IDX(24)
	)
	pe24 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in), 
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[24]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[24]),    
		.Pixel_0_in(Pixel_0_in_wr[24]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[24]),    
		.Pixel_1_in(Pixel_1_in_wr[24]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[24]),    
		.Pixel_2_in(Pixel_2_in_wr[24]),    
		.Pixel_0_out(Pixel_0_out_wr[24]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[24]),
		.Pixel_1_out(Pixel_1_out_wr[24]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[24])
	);

	PE 
	#(
		.PE_IDX(25)
	)
	pe25 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[25]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[25]),    
		.Pixel_0_in(Pixel_0_in_wr[25]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[25]),    
		.Pixel_1_in(Pixel_1_in_wr[25]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[25]),    
		.Pixel_2_in(Pixel_2_in_wr[25]),    
		.Pixel_0_out(Pixel_0_out_wr[25]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[25]),
		.Pixel_1_out(Pixel_1_out_wr[25]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[25])
	);

	PE 
	#(
		.PE_IDX(26)
	)
	pe26 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[26]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[26]),    
		.Pixel_0_in(Pixel_0_in_wr[26]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[26]),    
		.Pixel_1_in(Pixel_1_in_wr[26]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[26]),    
		.Pixel_2_in(Pixel_2_in_wr[26]),    
		.Pixel_0_out(Pixel_0_out_wr[26]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[26]),
		.Pixel_1_out(Pixel_1_out_wr[26]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[26])
	);

	PE 
	#(
		.PE_IDX(27)
	)
	pe27 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[27]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[27]),    
		.Pixel_0_in(Pixel_0_in_wr[27]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[27]),    
		.Pixel_1_in(Pixel_1_in_wr[27]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[27]),    
		.Pixel_2_in(Pixel_2_in_wr[27]),    
		.Pixel_0_out(Pixel_0_out_wr[27]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[27]),
		.Pixel_1_out(Pixel_1_out_wr[27]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[27])
	);

	PE 
	#(
		.PE_IDX(28)
	)
	pe28 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),  
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[28]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[28]),    
		.Pixel_0_in(Pixel_0_in_wr[28]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[28]),    
		.Pixel_1_in(Pixel_1_in_wr[28]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[28]),    
		.Pixel_2_in(Pixel_2_in_wr[28]),    
		.Pixel_0_out(Pixel_0_out_wr[28]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[28]),
		.Pixel_1_out(Pixel_1_out_wr[28]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[28])
	);

	PE 
	#(
		.PE_IDX(29)
	)
	pe29 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[29]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[29]),    
		.Pixel_0_in(Pixel_0_in_wr[29]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[29]),    
		.Pixel_1_in(Pixel_1_in_wr[29]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[29]),    
		.Pixel_2_in(Pixel_2_in_wr[29]),    
		.Pixel_0_out(Pixel_0_out_wr[29]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[29]),
		.Pixel_1_out(Pixel_1_out_wr[29]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[29])
	);

	PE 
	#(
		.PE_IDX(30)
	)
	pe30 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[30]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[30]),    
		.Pixel_0_in(Pixel_0_in_wr[30]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[30]),    
		.Pixel_1_in(Pixel_1_in_wr[30]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[30]),    
		.Pixel_2_in(Pixel_2_in_wr[30]),    
		.Pixel_0_out(Pixel_0_out_wr[30]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[30]),
		.Pixel_1_out(Pixel_1_out_wr[30]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[30])
	);

	PE 
	#(
		.PE_IDX(31)
	)
	pe31 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[31]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[31]),    
		.Pixel_0_in(Pixel_0_in_wr[31]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[31]),    
		.Pixel_1_in(Pixel_1_in_wr[31]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[31]),    
		.Pixel_2_in(Pixel_2_in_wr[31]),    
		.Pixel_0_out(Pixel_0_out_wr[31]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[31]),
		.Pixel_1_out(Pixel_1_out_wr[31]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[31])
	);

	PE 
	#(
		.PE_IDX(32)
	)
	pe32 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),      
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[32]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[32]),    
		.Pixel_0_in(Pixel_0_in_wr[32]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[32]),    
		.Pixel_1_in(Pixel_1_in_wr[32]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[32]),    
		.Pixel_2_in(Pixel_2_in_wr[32]),    
		.Pixel_0_out(Pixel_0_out_wr[32]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[32]),
		.Pixel_1_out(Pixel_1_out_wr[32]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[32])
	);

	PE 
	#(
		.PE_IDX(33)
	)
	pe33 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),  
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[33]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[33]),    
		.Pixel_0_in(Pixel_0_in_wr[33]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[33]),    
		.Pixel_1_in(Pixel_1_in_wr[33]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[33]),    
		.Pixel_2_in(Pixel_2_in_wr[33]),    
		.Pixel_0_out(Pixel_0_out_wr[33]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[33]),
		.Pixel_1_out(Pixel_1_out_wr[33]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[33])
	);

	PE 
	#(
		.PE_IDX(34)
	)
	pe34 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[34]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[34]),    
		.Pixel_0_in(Pixel_0_in_wr[34]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[34]),    
		.Pixel_1_in(Pixel_1_in_wr[34]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[34]),    
		.Pixel_2_in(Pixel_2_in_wr[34]),    
		.Pixel_0_out(Pixel_0_out_wr[34]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[34]),
		.Pixel_1_out(Pixel_1_out_wr[34]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[34])
	);

	PE 
	#(
		.PE_IDX(35)
	)
	pe35 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),     
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[35]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[35]),    
		.Pixel_0_in(Pixel_0_in_wr[35]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[35]),    
		.Pixel_1_in(Pixel_1_in_wr[35]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[35]),    
		.Pixel_2_in(Pixel_2_in_wr[35]),    
		.Pixel_0_out(Pixel_0_out_wr[35]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[35]),
		.Pixel_1_out(Pixel_1_out_wr[35]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[35])
	);

	PE 
	#(
		.PE_IDX(36)
	)
	pe36 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),       
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[36]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[36]),    
		.Pixel_0_in(Pixel_0_in_wr[36]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[36]),    
		.Pixel_1_in(Pixel_1_in_wr[36]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[36]),    
		.Pixel_2_in(Pixel_2_in_wr[36]),    
		.Pixel_0_out(Pixel_0_out_wr[36]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[36]),
		.Pixel_1_out(Pixel_1_out_wr[36]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[36])
	);

	PE 
	#(
		.PE_IDX(37)
	)
	pe37 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),    
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[37]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[37]),    
		.Pixel_0_in(Pixel_0_in_wr[37]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[37]),    
		.Pixel_1_in(Pixel_1_in_wr[37]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[37]),    
		.Pixel_2_in(Pixel_2_in_wr[37]),    
		.Pixel_0_out(Pixel_0_out_wr[37]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[37]),
		.Pixel_1_out(Pixel_1_out_wr[37]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[37])
	);

	PE 
	#(
		.PE_IDX(38)
	)
	pe38 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[38]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[38]),    
		.Pixel_0_in(Pixel_0_in_wr[38]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[38]),    
		.Pixel_1_in(Pixel_1_in_wr[38]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[38]),    
		.Pixel_2_in(Pixel_2_in_wr[38]),    
		.Pixel_0_out(Pixel_0_out_wr[38]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[38]),
		.Pixel_1_out(Pixel_1_out_wr[38]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[38])
	);

	PE 
	#(
		.PE_IDX(39)
	)
	pe39 (
		.CLK(CLK),
		.RST(RST),
		.AXI_LDM_addra_in(AXI_LDM_addra_in),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_in),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),   
		.layer_done_in(layer_done_wr),
		.En_in(En_wr),
		.Overarray_in(Overarray_wr),
		.Opcode_in(Opcode_wr),    
		.Parity_PE_Selection_in(Parity_PE_Selection_wr), 
		.CTRL_LDM_addra_in(CTRL_LDM_addra_wr),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_wr),    
		.CTRL_LDM_addrb_in(CTRL_LDM_addrb_wr),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_wr),
		.CTRL_LDM_Store_in(CTRL_LDM_Store_wr),
		.Stride_in(Stride_wr),
		.CTRL_LDM_addra_Incr_in(CTRL_LDM_addra_Incr_wr[39]), 
		.Weight_valid_in(Weight_valid_2_rg),    
		.Weight_in(Weight_rg),    
		.Bias_valid_in(Bias_valid_2_rg),    
		.Bias_in(Bias_rg),            
		.Pixel_0_valid_in(Pixel_0_valid_in_wr[39]),    
		.Pixel_0_in(Pixel_0_in_wr[39]),
		.Pixel_1_valid_in(Pixel_1_valid_in_wr[39]),    
		.Pixel_1_in(Pixel_1_in_wr[39]),
		.Pixel_2_valid_in(Pixel_2_valid_in_wr[39]),    
		.Pixel_2_in(Pixel_2_in_wr[39]),    
		.Pixel_0_out(Pixel_0_out_wr[39]),
		.Pixel_0_valid_out(Pixel_0_valid_out_wr[39]),
		.Pixel_1_out(Pixel_1_out_wr[39]),
		.Pixel_1_valid_out(Pixel_1_valid_out_wr[39])
	);





	
endmodule


