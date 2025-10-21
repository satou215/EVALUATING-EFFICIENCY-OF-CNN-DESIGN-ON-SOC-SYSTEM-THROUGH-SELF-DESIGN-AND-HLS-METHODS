//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2025 12:35:41 AM
// Design Name: 
// Module Name: Controller
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

module Controller
(
	input  wire                                 	CLK,
	input  wire                                 	RST,
	
	//-----------------------------------------------------//
	//          			Input Signals                  // 
	//-----------------------------------------------------//
	input  wire 					              	start_in,
	input  wire [`CTX_BITS-1:0]             		CTX_in,	
	input  wire [`CRAM_ADDR_BITS-1:0]             	CTX_Max_addr_in,	
	
	//-----------------------------------------------------//
	//          			Output Signals                 // 
	//-----------------------------------------------------// 
	
	///*** To the Context RAM ***///	
	output  wire [`CRAM_ADDR_BITS-1:0] 				CTRL_CRAM_addrb_out,
	output  wire 					              	CTRL_CRAM_enb_out,
	output  wire 					              	CTRL_CRAM_web_out,

	///*** To the Weight RAM ***///	
	output  wire [`WRAM_ADDR_BITS-1:0] 				CTRL_WRAM_addrb_out,
	output  wire 					              	CTRL_WRAM_enb_out,
	output  wire 					              	CTRL_WRAM_web_out,

	///*** To the Bias RAM ***///	
	output  wire [`BRAM_ADDR_BITS-1:0] 				CTRL_BRAM_addrb_out,
	output  wire 					              	CTRL_BRAM_enb_out,
	output  wire 					              	CTRL_BRAM_web_out,
	
	///*** To SGB ***///
	output  wire [`ALU_OPCODE-1:0]      			Opcode_out,
	output  wire [`PE_NUM_BITS-1:0]  				MUX_Selection_out,
	output  wire 					              	Stride_out, //0 -> 1, 1 -> 2
	
	///*** To All PEs ***///
	output  wire 					              	En_out,
	
	output  wire 					              	layer_done_out,
	
	output  wire 					              	Parity_PE_Selection_out, //0 -> Even PEs, 1 -> Odd PEs
	
	output  wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0] CTRL_LDM_addra_out,
	output  wire 					              	CTRL_LDM_ena_out,
	output  wire 					              	CTRL_LDM_wea_out,

	output  wire [`LDM_SRC_BITS+`LDM_ADDR_BITS-1:0] CTRL_LDM_addrb_out,
	output  wire 					              	CTRL_LDM_enb_out,
	output  wire 					              	CTRL_LDM_web_out,
	
	output  wire [`LDM_DES_BITS+`LDM_SA_BITS-1:0]  	CTRL_LDM_Store_out,
	
	///*** To specific PEs ***///
	output wire										Overarray_out,
	output wire	[`PE_NUM-1:0]						CTRL_LDM_addra_Incr_out,
	
	///*** To AXI Mapper ***///
	output  wire									complete_out
	
);
 
	// *************** Wire signals *************** //
	wire 					              			load_ctx_wr;
	wire 					              			complete_flg_wr;
	wire 					              			next_ctx_flg_wr;
	wire [`PAD_BITS-1:0]                            pad_wr;
	wire [`N_BITS-1:0]             					n_wr;
	wire [`Y_BITS-1:0]             					y_wr;
	wire [`K_BITS-1:0]             					k_wr;
	wire [`J_BITS-1:0]             					j_wr;
	wire [`STRIDE_BITS-1:0]             			stride_wr;
	wire [`LDM_SRC_BITS-1:0]             			source_LDM_wr;
	wire [`LDM_DES_BITS-1:0]             			destination_LDM_wr;	
	wire [`LDM_SA_BITS-1:0]             			starting_address_LDM_wr;
	
	wire [`ALU_OPCODE-1:0]             			    Opcode_wr;
	
	
	wire [`LDM_ADDR_BITS-1:0]             			CTRL_LDM_addra_inc_wr;
	
	wire [`PE_NUM_BITS-1:0]  						MUX_Selection_wr;
	wire [`PE_NUM_BITS-1:0]  						MUX_Selection_2_wr;
	
	wire [`PE_NUM_BITS-1:0]  						PE_Incr_wr;
	
	wire [`CTX_BITS-1:0]             				CTX_wr;	
	
	wire 					            			conv_en_wr;
	wire [`LDM_ADDR_BITS-1:0]						CTRL_LDM_addrb_wr;
	
	// *************** Register signals *************** //		
	reg  [1:0]           	  			  			STATE_rg;
	reg [`CRAM_ADDR_BITS-1:0]						CTRL_CRAM_addrb_rg;
	reg [`WRAM_ADDR_BITS-1:0] 						CTRL_WRAM_addra_1_rg;
	reg [`WRAM_ADDR_BITS-1:0] 						CTRL_WRAM_addra_2_rg;
	
	reg [`BRAM_ADDR_BITS-1:0] 						CTRL_BRAM_addra_rg;
	
	reg [`N_BITS-1:0]             					n_count_rg;
	reg [`Y_BITS-1:0]             					y_count_rg;
	reg [`K_BITS-1:0]             					k_count_rg;
	reg [`J_BITS-1:0]             					j_count_rg;	

	reg [`J_BITS-1:0]             					j_count_2_rg;	
	
	reg 					              			next_ctx_flg_1_rg, next_ctx_flg_2_rg, next_ctx_flg_3_rg, next_ctx_flg_4_rg;
	

	reg [`LDM_ADDR_BITS-1:0] 						CTRL_LDM_addra_rg;
	reg [`LDM_ADDR_BITS-1:0]             			CTRL_LDM_y_count_rg;
	
	reg												Overarray_rg, Overarray_2_rg;
	reg	[`PE_NUM-1:0]								CTRL_LDM_addra_Incr_rg;
	reg                                             complete_rg;
	localparam  									IDLE 		= 0;
	localparam  									LOAD_CTX 	= 1; 
	localparam  									EXEC 		= 2;	
	
	//--------- To CRAM and CTX decoder ---------///
	assign CTX_wr				= (STATE_rg == EXEC) ? CTX_in : 0;
	assign En_out				= (STATE_rg == EXEC) ? 1'b1 : 0;
	assign load_ctx_wr			= (STATE_rg == LOAD_CTX) ? 1'b1:1'b0;
	
	assign CTRL_CRAM_addrb_out	= CTRL_CRAM_addrb_rg;
	
	assign CTRL_CRAM_enb_out	    = load_ctx_wr;
	assign CTRL_CRAM_web_out	    = 0;
    assign pad_wr                   = CTX_wr[`CTX_BITS-1:`CTX_BITS-`PAD_BITS];
	assign n_wr					    = CTX_wr[`CTX_BITS-`PAD_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS];
	assign y_wr					    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS];
	assign k_wr					    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS];
	assign j_wr					    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS];
	assign Opcode_wr			    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE];
	assign stride_wr			    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS];
	assign source_LDM_wr		    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-`LDM_SRC_BITS];
	assign destination_LDM_wr	    = CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-`LDM_SRC_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-`LDM_SRC_BITS-`LDM_DES_BITS];	
	assign starting_address_LDM_wr	= CTX_wr[`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-`LDM_SRC_BITS-`LDM_DES_BITS-1:`CTX_BITS-`PAD_BITS-`N_BITS-`Y_BITS-`K_BITS-`J_BITS-`ALU_OPCODE-`STRIDE_BITS-`LDM_SRC_BITS-`LDM_DES_BITS-`LDM_SA_BITS];	
	

	assign conv_en_wr			= (Opcode_wr[`ALU_OPCODE-2:0] == 2'b01) ? 1'b1 : 1'b0;
	///--------- To Weight RAM ---------///
	assign CTRL_WRAM_addrb_out	= CTRL_WRAM_addra_1_rg + CTRL_WRAM_addra_2_rg;
	assign CTRL_WRAM_enb_out	= (STATE_rg == EXEC) ? conv_en_wr:1'b0;
	assign CTRL_WRAM_web_out	= 0;

	///--------- To Bias RAM ---------///
	assign CTRL_BRAM_addrb_out	= CTRL_BRAM_addra_rg;
	assign CTRL_BRAM_enb_out	= ((STATE_rg == EXEC) & (j_count_rg == j_wr)&(k_count_rg == k_wr)) ? conv_en_wr :1'b0;
	assign CTRL_BRAM_web_out	= 0;
	///--------- To SGB ---------///
	assign	MUX_Selection_out	= (Opcode_wr[`ALU_OPCODE-2:0] == 2'b10) ? k_count_rg : j_count_rg;
	assign  Stride_out			= stride_wr;
	///--------- To All PEs ---------///
	assign Opcode_out				= Opcode_wr;
	assign layer_done_out		= next_ctx_flg_wr|complete_flg_wr;
		
	assign CTRL_LDM_addra_inc_wr	= ((stride_wr == 0) & (y_wr == 7)) ? 8: ((stride_wr == 1) & (y_wr == 7)) ? 16: ((stride_wr == 0) & (y_wr == 3)) ? 4: ((stride_wr == 1) & (y_wr == 3)) ? 8 : ((stride_wr == 0) & (y_wr == 1)) ? 2: ((stride_wr == 1) & (y_wr == 1)) ? 4: ((stride_wr == 0) & (y_wr == 0)) ? 1: ((stride_wr == 1) & (y_wr == 1)) ? 2:  1; //*** Need to be changed when PE number is changed

	
	assign CTRL_LDM_addra_out	= {source_LDM_wr,CTRL_LDM_addra_rg+CTRL_LDM_y_count_rg};
	assign CTRL_LDM_ena_out		= (STATE_rg == EXEC) ? 1'b1:1'b0;
	assign CTRL_LDM_wea_out		= 0;
	
	assign CTRL_LDM_addrb_wr	= CTRL_LDM_addra_rg+CTRL_LDM_y_count_rg+1;
	assign CTRL_LDM_addrb_out	= {source_LDM_wr,CTRL_LDM_addrb_wr};
	assign CTRL_LDM_enb_out		= (STATE_rg == EXEC) ? 1'b1:1'b0;
	assign CTRL_LDM_web_out		= 0;
	
	assign CTRL_LDM_Store_out	= {destination_LDM_wr,starting_address_LDM_wr};
	
	///--------- To specific PEs ---------///
	assign Overarray_out		= Overarray_2_rg;
	assign PE_Incr_wr			= j_count_rg;
	assign CTRL_LDM_addra_Incr_out	= CTRL_LDM_addra_Incr_rg;	
	///--------- State Machine ---------///
	
	assign next_ctx_flg_wr		= next_ctx_flg_4_rg;
	assign complete_flg_wr		= next_ctx_flg_4_rg & (CTRL_CRAM_addrb_rg > CTX_Max_addr_in);
	
	assign complete_out 		= complete_rg;
	
	assign Parity_PE_Selection_out	= j_count_rg[0];
		
	always @(posedge CLK) begin
		if (RST) begin
			STATE_rg  			<= IDLE;
		end
		else begin
			if((STATE_rg == IDLE)& start_in) begin
				STATE_rg		<= LOAD_CTX;
			end
			else if(STATE_rg == LOAD_CTX) begin
				STATE_rg		<= EXEC;
			end
			else if((STATE_rg == EXEC)& complete_flg_wr) begin
				STATE_rg		<= IDLE;
			end
			else if((STATE_rg == EXEC)& next_ctx_flg_wr) begin
				STATE_rg		<= LOAD_CTX;
			end
			else begin
				STATE_rg		<= STATE_rg;
			end
		end
	end

	always @(posedge CLK) begin
		if (RST) begin
			n_count_rg	  			<= 0;
			y_count_rg				<= 0;
			k_count_rg				<= 0;
			j_count_rg				<= 0;
			
			j_count_2_rg			<= 0;
				
			next_ctx_flg_1_rg		<= 0;
			next_ctx_flg_2_rg		<= 0;
			next_ctx_flg_3_rg		<= 0;
			
			CTRL_WRAM_addra_1_rg	<= 0;
			CTRL_WRAM_addra_2_rg	<= 0;
			
			CTRL_LDM_addra_rg		<= 0;
			
			CTRL_LDM_addra_Incr_rg	<= 0;
			CTRL_BRAM_addra_rg		<= 0;
			
			Overarray_rg			<= 0;
			Overarray_2_rg			<= 0;
			complete_rg             <= 0;
		end
		else begin
			Overarray_2_rg			<= Overarray_rg;
			complete_rg             <= complete_flg_wr;
			if(STATE_rg == IDLE) begin
				n_count_rg	  				<= 0;
				y_count_rg					<= 0;
				k_count_rg					<= 0;
				j_count_rg					<= 0;
				
				j_count_2_rg				<= 0;
				
				CTRL_LDM_addra_rg			<= 0;
				
				CTRL_LDM_addra_Incr_rg		<= 0;
				CTRL_LDM_y_count_rg			<= 0;
				
				next_ctx_flg_1_rg			<= 0;
				next_ctx_flg_2_rg			<= 0;
				next_ctx_flg_3_rg			<= 0;				
				next_ctx_flg_4_rg			<= 0;

				
				CTRL_WRAM_addra_1_rg		<= 0;
				CTRL_WRAM_addra_2_rg		<= 0;
				CTRL_BRAM_addra_rg			<= 0;
				
				Overarray_rg				<= 0;
			end	
			else if(STATE_rg == LOAD_CTX) begin
				n_count_rg	  				<= 0;
				y_count_rg					<= 0;
				k_count_rg					<= 0;
				j_count_rg					<= 0;
				
				j_count_2_rg				<= 0;
				
				CTRL_LDM_addra_rg			<= 0;
				
				CTRL_LDM_addra_Incr_rg		<= 0;
				CTRL_LDM_y_count_rg			<= 0;
				
				next_ctx_flg_1_rg			<= 0;
				next_ctx_flg_2_rg			<= 0;
				next_ctx_flg_3_rg			<= 0;				
				next_ctx_flg_4_rg			<= 0;
				
				
				CTRL_WRAM_addra_1_rg		<= 0;
				
				Overarray_rg			<= 0;
			end
			else begin
				j_count_2_rg				<= j_count_rg;			
				if (j_count_rg == j_wr) begin
					j_count_rg 						<= 0;
					CTRL_LDM_addra_Incr_rg			<= 0;
					if (k_count_rg == k_wr) begin
						k_count_rg 					<= 0;
						CTRL_WRAM_addra_1_rg 		<= 0;
						
						if(conv_en_wr) begin
							CTRL_LDM_addra_rg 		<= 0;
						end
						else begin
						    if(Opcode_wr[`ALU_OPCODE-2:0] == 2'b11 && stride_wr == 0) begin
						         CTRL_LDM_addra_rg 		<= CTRL_LDM_addra_rg + 2;
						    end
						    else begin
							     CTRL_LDM_addra_rg 		<= CTRL_LDM_addra_rg + 1;
							end
						end
						
						if (y_count_rg == y_wr) begin
							y_count_rg 				<= 0;
							
						
							CTRL_LDM_y_count_rg		<= 0;
							Overarray_rg			<= 1;
							if (n_count_rg == n_wr) begin
								// Reset all counters when reaching the max value for n, y, k, and j
								n_count_rg 		   <= 0;
								CTRL_BRAM_addra_rg	<= CTRL_BRAM_addra_rg + conv_en_wr;
							end 
							else begin
								// Increment n and reset y, k, j counters
								n_count_rg 			<= n_count_rg + 1;
								CTRL_BRAM_addra_rg	<= CTRL_BRAM_addra_rg + conv_en_wr;
							end
						end 
						else begin
							// Increment y and reset k, j counters
							y_count_rg 		<= y_count_rg + 1;
							if(conv_en_wr) begin
								CTRL_LDM_y_count_rg	<= CTRL_LDM_y_count_rg + 1 + stride_wr;
							end                     
							else begin              
								CTRL_LDM_y_count_rg	<= CTRL_LDM_y_count_rg;
							end                     
													
							
						end
					end 
					else begin
						// Increment k and reset j counter
						k_count_rg 					<= k_count_rg + 1;
						
						if(conv_en_wr) begin
							CTRL_LDM_addra_rg 		<= CTRL_LDM_addra_rg + CTRL_LDM_addra_inc_wr;
						end
						else begin
							CTRL_LDM_addra_rg 		<= CTRL_LDM_addra_rg;
						end
						
						CTRL_WRAM_addra_1_rg 		<= CTRL_WRAM_addra_1_rg + conv_en_wr;
					end
				end 
				else begin
					j_count_rg 						<= j_count_rg + 1;

					k_count_rg 						<= k_count_rg;
					y_count_rg 						<= y_count_rg;
					n_count_rg 						<= n_count_rg;

					CTRL_WRAM_addra_1_rg 			<= CTRL_WRAM_addra_1_rg + conv_en_wr;

					CTRL_LDM_addra_Incr_rg[PE_Incr_wr]		<= 1'b1;
					
					Overarray_rg					<= 0;
				end		
				
				next_ctx_flg_2_rg		<= next_ctx_flg_1_rg;
				next_ctx_flg_3_rg		<= next_ctx_flg_2_rg;
				next_ctx_flg_4_rg		<= next_ctx_flg_3_rg;
				
				if((n_count_rg == n_wr) & (y_count_rg == y_wr) & (k_count_rg == k_wr) & (j_wr==0)) begin
				    next_ctx_flg_1_rg			<= 1;
				end	
				else if((n_count_rg == n_wr) & (y_count_rg == y_wr) & (k_count_rg == k_wr)& (j_count_rg == j_wr)) begin
                    next_ctx_flg_1_rg			<= 1;
				end	
				else begin	
					next_ctx_flg_1_rg			<= 0;
				end

				if((y_count_rg == y_wr)&(j_count_rg == j_wr)&(k_count_rg == k_wr)) begin
					CTRL_WRAM_addra_2_rg	<= CTRL_WRAM_addra_2_rg + CTRL_WRAM_addra_1_rg + conv_en_wr;
				end
				else begin
					CTRL_WRAM_addra_2_rg	<= CTRL_WRAM_addra_2_rg;
				end				
			end
		end
	end	
	
	always @(posedge CLK) begin
		if (RST) begin
			CTRL_CRAM_addrb_rg  		<= 0;
			
		end
		else begin
			if(complete_flg_wr) begin
				CTRL_CRAM_addrb_rg		<= 0;
			end
			else if(load_ctx_wr) begin
				CTRL_CRAM_addrb_rg		<= CTRL_CRAM_addrb_rg + load_ctx_wr;
			end
			else begin
				CTRL_CRAM_addrb_rg		<= CTRL_CRAM_addrb_rg;
			end
		end
	end	
	
endmodule

