`timescale 1ns/1ns
`include "common.vh"

module PE
#(
	parameter                                   	PE_IDX = 0
)
(
	input  wire                                 	CLK,
	input  wire                                 	RST,
	
	//-----------------------------------------------------//
	//          			Input Signals                  // 
	//-----------------------------------------------------//

	///*** From AXI Bus ***///				
	input  wire [`PE_NUM_BITS+`LDM_NUM_BITS+`LDM_ADDR_BITS-1:0] AXI_LDM_addra_in,
	input  wire signed [`DATA_WIDTH-1:0]          	AXI_LDM_dina_in,
	input  wire 					              	AXI_LDM_ena_in,
	input  wire 					              	AXI_LDM_wea_in,
												
	output  wire            [`LABEL-1:0]         	AXI_LDM_douta_out,

	///*** From the Controller ***///	
	input  wire 					              	En_in,
	input  wire                                     Overarray_in,
	input  wire 					              	layer_done_in,
	input  wire signed [`ALU_OPCODE-1:0]			Opcode_in,
	
	input  wire 					              	Parity_PE_Selection_in, //0 -> Even PEs, 1 -> Odd PEs
	
	input  wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0]  CTRL_LDM_addra_in,
	input  wire 					              	CTRL_LDM_ena_in,
	input  wire 					              	CTRL_LDM_wea_in,
	
	input  wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0]  CTRL_LDM_addrb_in,
	input  wire 					              	CTRL_LDM_enb_in,
	input  wire 					              	CTRL_LDM_web_in,

	input  wire [`LDM_DES_BITS+`LDM_SA_BITS-1:0]  	CTRL_LDM_Store_in,
	
	input  wire 					              	Stride_in, //0 -> 1, 1 -> 2
	
	input  wire 					              	CTRL_LDM_addra_Incr_in, //0 -> 1, 1 -> 2
	
	///*** From the Weight RAM ***///	
	input  wire 					            	Weight_valid_in,	
	input  wire signed [`DATA_WIDTH-1:0]             Weight_in,

	///*** From the Bias RAM ***///	
	input  wire 					            	Bias_valid_in,	
	input  wire signed [`DATA_WIDTH-1:0]             Bias_in,
	
	///*** From Global Buffer ***///			
	input  wire 					            	Pixel_0_valid_in,	
	input  wire signed [`DATA_WIDTH-1:0]             Pixel_0_in,
	input  wire 					            	Pixel_1_valid_in,	
	input  wire signed [`DATA_WIDTH-1:0]             Pixel_1_in,
	input  wire 					            	Pixel_2_valid_in,	
	input  wire signed [`DATA_WIDTH-1:0]             Pixel_2_in,	
	//-----------------------------------------------------//
	//          			Output Signals                 // 
	//-----------------------------------------------------//  
	
	///*** To Global Buffer ***///
	output wire signed [`DATA_WIDTH-1:0]           	Pixel_0_out,
	output wire 						           	Pixel_0_valid_out,
	output wire signed [`DATA_WIDTH-1:0]           	Pixel_1_out,
	output wire 						           	Pixel_1_valid_out
  
);
 
	// *************** Wire signals *************** //
	wire  					           	  			S0_valid_wr;
	wire signed [`DATA_WIDTH-1:0]           	  		S0_wr;
	wire  					           	  			S1_valid_wr;
	wire signed [`DATA_WIDTH-1:0]           	  		S1_wr;
	wire  					           	  			S2_valid_wr;
	wire signed [`DATA_WIDTH-1:0]           	  		S2_wr;

	wire  					           	  			Result_valid_wr;
	wire signed [`DATA_WIDTH-1:0]           	  		Result_wr;

	wire signed [`DATA_WIDTH-1:0]           			Pixel_2_out_wr;
	wire 						           			Pixel_2_valid_out_wr;
	
	wire [`LDM_ADDR_BITS-1:0] 						CTRL_LDM_addra_wr;
	wire [`LDM_ADDR_BITS-1:0] 						CTRL_LDM_addrb_wr;
	
	wire 					              			CTRL_LDM_ena_wr, CTRL_LDM_enb_wr;

	
	wire signed [`DATA_WIDTH-1:0]          			ALU_LDM_dinb_wr;
	wire 					              			ALU_LDM_enb_wr;
	wire 					              			ALU_LDM_web_wr;
	wire [`LDM_DES_BITS+`LDM_ADDR_BITS-1:0]  			ALU_LDM_addrb_wr;
	
	// *************** Register signals *************** //		

	reg [`LDM_ADDR_BITS-1:0]  						ALU_LDM_addrb_rg;
	reg												Pixel_0_valid_rg;
								
	/// LDM memory			
				
	wire 					              			AXI_LDM_ena_wr;
					
	assign AXI_LDM_ena_wr 		= (AXI_LDM_addra_in[`PE_NUM_BITS+`LDM_NUM_BITS+`LDM_ADDR_BITS-1:`LDM_NUM_BITS+`LDM_ADDR_BITS] == PE_IDX) ? AXI_LDM_ena_in: 1'b0;
		
	assign CTRL_LDM_ena_wr		= CTRL_LDM_ena_in;
	assign CTRL_LDM_enb_wr		= CTRL_LDM_enb_in;
	
	assign S0_valid_wr 			= (Opcode_in[`ALU_OPCODE-2:0] == 2'b01) ? Weight_valid_in :
	                              (Opcode_in[`ALU_OPCODE-2:0] == 2'b10) ? 1 : Pixel_0_valid_in ;
	assign S0_wr 				= (Opcode_in[`ALU_OPCODE-2:0] == 2'b01) ? Weight_in :
	                              (Opcode_in[`ALU_OPCODE-2:0] == 2'b10) ? 8'h0015 : Pixel_0_in;
		
	assign S1_valid_wr 			= (Opcode_in[`ALU_OPCODE-2:0] == 2'b00) ? 0 : (Opcode_in[`ALU_OPCODE-2:0] == 2'b11) ? Pixel_1_valid_in : Pixel_0_valid_in;
	assign S1_wr 				= (Opcode_in[`ALU_OPCODE-2:0] == 2'b11) ? Pixel_1_in : (PE_IDX == 39 & Overarray_in ? 0 : Pixel_0_in);
		
	assign S2_valid_wr 			= (Opcode_in[`ALU_OPCODE-2:0] == 2'b11) ? Pixel_2_valid_in : 
								  (Opcode_in[`ALU_OPCODE-2:0] == 2'b01) ? Bias_valid_in : Pixel_2_valid_out_wr;
								
	assign S2_wr 				= (Opcode_in[`ALU_OPCODE-2:0] == 2'b11) ? Pixel_2_in : 
								  ((Opcode_in[`ALU_OPCODE-2:0] == 2'b01) & (Bias_valid_in)) ? Bias_in : Pixel_2_out_wr;
	
	assign CTRL_LDM_addra_wr	= CTRL_LDM_addra_Incr_in + CTRL_LDM_addra_in[`LDM_ADDR_BITS-1:0];
	assign CTRL_LDM_addrb_wr	= CTRL_LDM_addra_Incr_in + CTRL_LDM_addrb_in[`LDM_ADDR_BITS-1:0];
	
	LSU lsu(
		.CLK(CLK),
		.RST(RST),
		///*** From AXI Bus ***///
		.AXI_LDM_addra_in(AXI_LDM_addra_in[`LDM_NUM_BITS+`LDM_ADDR_BITS-1:0]),
		.AXI_LDM_dina_in(AXI_LDM_dina_in),
		.AXI_LDM_ena_in(AXI_LDM_ena_wr),
		.AXI_LDM_wea_in(AXI_LDM_wea_in),
		.AXI_LDM_douta_out(AXI_LDM_douta_out),
		///*** From the Controller ***///
		.CTRL_LDM_addra_in({CTRL_LDM_addra_in[`LDM_SRC_BITS+`LDM_ADDR_BITS-1:`LDM_ADDR_BITS],CTRL_LDM_addra_wr}),
		.CTRL_LDM_ena_in(CTRL_LDM_ena_wr),
		.CTRL_LDM_wea_in(CTRL_LDM_wea_in),
		.CTRL_LDM_addrb_in({CTRL_LDM_addrb_in[`LDM_SRC_BITS+`LDM_ADDR_BITS-1:`LDM_ADDR_BITS],CTRL_LDM_addrb_wr}),
		.CTRL_LDM_enb_in(CTRL_LDM_enb_wr),
		.CTRL_LDM_web_in(CTRL_LDM_web_in),
		.Opcode_in(Opcode_in[`ALU_OPCODE-2:0]),
		///*** From the ALU ***///		
		.ALU_LDM_addrb_in(ALU_LDM_addrb_wr),
		.ALU_LDM_dinb_in(ALU_LDM_dinb_wr),
		.ALU_LDM_enb_in(ALU_LDM_enb_wr),
		.ALU_LDM_web_in(ALU_LDM_web_wr),
		
		///*** To Global Buffer ***///
		.Pixel_0_out(Pixel_0_out),
		.Pixel_0_valid_out(Pixel_0_valid_out),
		.Pixel_1_out(Pixel_1_out),
		.Pixel_1_valid_out(Pixel_1_valid_out),		
	

		///*** To ALU ***///
		.Pixel_2_out(Pixel_2_out_wr),
		.Pixel_2_valid_out(Pixel_2_valid_out_wr)	
	);
 
	ALU alu
	(
		.CLK(CLK),
		.RST(RST),
		.En_in(En_in),
		.Opcode_in(Opcode_in[`ALU_OPCODE-2:0]),
		.ReLU_en_in(Opcode_in[`ALU_OPCODE-1:`ALU_OPCODE-1]),
		.S0_valid_in(S0_valid_wr),
		.S0_in(S0_wr),
		.S1_valid_in(S1_valid_wr),
		.S1_in(S1_wr),
		.S2_valid_in(S2_valid_wr),
		.S2_in(S2_wr),
		.Result_out(Result_wr),
		.Valid_out(Result_valid_wr)
	);

	assign ALU_LDM_dinb_wr 	= Result_wr;
	assign ALU_LDM_enb_wr 	= Result_valid_wr&En_in;
	assign ALU_LDM_web_wr 	= Result_valid_wr&En_in;
	assign ALU_LDM_addrb_wr	= {CTRL_LDM_Store_in[`LDM_DES_BITS+`LDM_SA_BITS-1:`LDM_SA_BITS],ALU_LDM_addrb_rg+CTRL_LDM_Store_in[`LDM_SA_BITS-1:0]};
	
	always @(posedge CLK) begin
		if (RST) begin
			ALU_LDM_addrb_rg	<= 6'h3F;
			Pixel_0_valid_rg	<= 0;
		end	
		else begin			
			
			if(layer_done_in) begin
				ALU_LDM_addrb_rg	<= 6'h3F;
				Pixel_0_valid_rg	<= 0;
			end
			else if(En_in) begin
				Pixel_0_valid_rg	<= Pixel_0_valid_in;
				if(Opcode_in[`ALU_OPCODE-2:0] == 2'b01) begin
					ALU_LDM_addrb_rg	<= ALU_LDM_addrb_rg + Bias_valid_in;
				end
				else if (Opcode_in[`ALU_OPCODE-2:0] == 2'b10) begin
				    ALU_LDM_addrb_rg	<= ALU_LDM_addrb_rg + Pixel_2_valid_out_wr;
				end
				else begin 
					ALU_LDM_addrb_rg	<= ALU_LDM_addrb_rg + Pixel_0_valid_rg;
				end
			end
		end
	 end
  
endmodule
