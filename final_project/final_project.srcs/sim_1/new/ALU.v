//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 09:23:02 PM
// Design Name: 
// Module Name: ALU
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
`timescale 1ns / 1ps
`include "common.vh"

module ALU
(
	input  wire                                 CLK,
	input  wire                                 RST,
	
	//-----------------------------------------------------//
	//          			Input Signals                  // 
	//-----------------------------------------------------//
	input  wire 					            En_in,
	input  wire signed [`ALU_OPCODE-2:0]         Opcode_in,
	input  wire 					            ReLU_en_in,
	input  wire 					            S0_valid_in,
	input  wire signed [`DATA_WIDTH-1:0]         S0_in,
	input  wire 					            S1_valid_in,
	input  wire signed [`DATA_WIDTH-1:0]         S1_in,
	input  wire 					            S2_valid_in,
	input  wire signed [`DATA_WIDTH-1:0]         S2_in,
	//-----------------------------------------------------//
	//          			Output Signals                 // 
	//-----------------------------------------------------//
	output wire signed [`DATA_WIDTH-1:0]         Result_out,
	output wire  					           	Valid_out
);

	// *************** Wire signals *************** //
	wire signed [`DATA_WIDTH-1:0]      			MAC_wr;
	wire 				      					MAC_valid_wr;
	wire signed [`DATA_WIDTH-1:0]      			Max_wr;
	wire 				      					Max_valid_wr;
	
	wire signed [`DATA_WIDTH-1:0]                Weight_wr = S0_in; // 16'h0080 = 1
	// *************** Register signals *************** //
	reg signed [`DATA_WIDTH-1:0]      			Result_rg;
	reg 				      					Result_valid_rg;
	reg [`ALU_OPCODE-2:0]             		    Opcode_1_rg, Opcode_2_rg;
	reg											En_1_rg, En_2_rg; 

	
	MAC  mac
	(
    .CLK(CLK),                      
    .RST(RST),
	.ReLU_en_in(ReLU_en_in),
    .S0_valid_in(S0_valid_in),        
    .S0_in(Weight_wr),  
    .S1_valid_in(S1_valid_in),        
    .S1_in(S1_in),  
    .S2_valid_in(S2_valid_in),        
    .S2_in(S2_in), 
    .MAC_valid_out(MAC_valid_wr),  
    .MAC_out(MAC_wr)  
	);


	MAX  max (
		.CLK(CLK),                    
		.RST(RST),   
		.data1_valid_in(S1_valid_in),	
		.data1_in(S1_in),    
		.data2_valid_in(S2_valid_in),	
		.data2_in(S2_in), 
		.data_max_valid_out(Max_valid_wr),
		.data_max_out(Max_wr)
	);
 
    always @(posedge CLK) begin
        if (RST) begin
            Opcode_1_rg 		<= 0; 
			Opcode_2_rg		    <= 0;
			
            Opcode_1_rg 		<= 0; 
			Opcode_2_rg		    <= 0;
        end
        else begin
			Opcode_1_rg 		<= Opcode_in; 
			Opcode_2_rg		    <= Opcode_1_rg;
			
			En_1_rg 		    <= En_in; 
			En_2_rg			    <= En_1_rg;
        end
    end
	
	always @(*) begin
		case (Opcode_2_rg)
			2'b00: begin   ///*** No Operation ***///
				Result_rg		= 0;
				Result_valid_rg	= 0;
			end
			2'b01: begin   ///*** Mutiply-Adder Operation ***///
				Result_rg 		= MAC_wr; 
				Result_valid_rg	= MAC_valid_wr;
			end
			2'b10: begin   ///*** Adder Operation ***///
				Result_rg 		= MAC_wr; 
				Result_valid_rg	= MAC_valid_wr;
			end
			2'b11: begin   ///*** Max Pooling Operation ***///
				Result_rg		= Max_wr; 
				Result_valid_rg	= Max_valid_wr;
			end
			default: begin
				Result_rg		= 0;
				Result_valid_rg	= 0;
			end
		endcase
	end
	assign Result_out 			= (En_2_rg == 1) ? Result_rg : 0;
	assign Valid_out		    = (En_2_rg == 1) ? Result_valid_rg : 0;
	
endmodule



module MAC
(
    input wire                          CLK,                      
    input wire                          RST,
	input wire							ReLU_en_in,
    input wire                          S0_valid_in,        
    input wire signed [`DATA_WIDTH-1:0]  S0_in,   // Fixed-point input: 1 sign bit, 8 integer bits, 7 fractional bits
    input wire                          S1_valid_in,        
    input wire signed [`DATA_WIDTH-1:0]  S1_in,   // Fixed-point input: 1 sign bit, 8 integer bits, 7 fractional bits
    input wire                          S2_valid_in,        
    input wire signed [`DATA_WIDTH-1:0]  S2_in,   // Fixed-point input: 1 sign bit, 8 integer bits, 7 fractional bits
    output reg                          MAC_valid_out,  
    output reg signed [`DATA_WIDTH-1:0]  MAC_out  // Fixed-point output: 1 sign bit, 8 integer bits, 7 fractional bits
);

    // *************** Wire signals *************** //
    wire signed [`DATA_WIDTH*2-1:0]      partial_sum_0_wr, partial_sum_1_wr, partial_sum_2_wr, partial_sum_3_wr;
    wire signed [`DATA_WIDTH*2-1:0]      partial_sum_4_wr, partial_sum_5_wr, partial_sum_6_wr, partial_sum_7_wr;
    wire signed [`DATA_WIDTH*2-1:0]      partial_sum_8_wr, partial_sum_9_wr, partial_sum_10_wr, partial_sum_11_wr;
    wire signed [`DATA_WIDTH*2-1:0]      partial_sum_12_wr, partial_sum_13_wr, partial_sum_14_wr, partial_sum_15_wr;
    wire signed [`DATA_WIDTH*2-1:0]      sign_extend_factor_wr;
    wire signed [`DATA_WIDTH*2-1:0]      sum_stage1_wr, sum_stage2_wr;
	wire signed [`DATA_WIDTH-1:0]		sum_final_wr;
    wire signed [`DATA_WIDTH-1:0]        factor_wr;       
	wire signed [`DATA_WIDTH-1:0]      	Bias_wr;
	wire 								both_negative_wr;
	wire signed [`DATA_WIDTH-1:0]  		MAC_wr, MAC_ReLU_wr;
    wire                                ReLU_Valid_wr;
    
    // *************** Register signals *************** //
	reg signed [`DATA_WIDTH-1:0]      	accumulation_rg;
	reg signed [`DATA_WIDTH-1:0]      	Bias_rg;
    reg signed [`DATA_WIDTH*2-1:0]       sum_stage1_rg;
    reg signed [`DATA_WIDTH*2-1:0]       sign_extend_factor_rg;
    reg signed [`DATA_WIDTH-1:0]         factor_rg; 
    reg                                 Weight_valid_rg, Signal_valid_rg, Bias_valid_rg;
	reg 								both_negative_rg;
	reg 								ReLU_en_rg;       

    wire signed [`DATA_WIDTH-1:0] abs_S0_in = (S0_in < 0) ? -S0_in : S0_in;
    wire signed [`DATA_WIDTH-1:0] abs_S1_in = (S1_in < 0) ? -S1_in : S1_in;
	
    assign both_negative_wr	 			= ((S0_in < 0) && (S1_in < 0))|((S0_in > 0) && (S1_in > 0));

    // Sign-extend inputs to 32 bits using the absolute values if both are negative
    assign sign_extend_factor_wr   			= {{16{abs_S0_in[`DATA_WIDTH-1]}}, abs_S0_in};  // Sign-extend absolute S0_in to 32 bits
    assign factor_wr     			        = abs_S1_in;  // No need to extend, keeping 16 bits


	assign partial_sum_0_wr  			= factor_wr[0]  ? sign_extend_factor_wr : 32'sd0;
    assign partial_sum_1_wr  			= factor_wr[1]  ? ($signed(sign_extend_factor_wr) << 1)  : 32'sd0;
    assign partial_sum_2_wr  			= factor_wr[2]  ? ($signed(sign_extend_factor_wr) << 2)  : 32'sd0;
    assign partial_sum_3_wr  			= factor_wr[3]  ? ($signed(sign_extend_factor_wr) << 3)  : 32'sd0;
    assign partial_sum_4_wr  			= factor_wr[4]  ? ($signed(sign_extend_factor_wr) << 4)  : 32'sd0;
    assign partial_sum_5_wr  			= factor_wr[5]  ? ($signed(sign_extend_factor_wr) << 5)  : 32'sd0;
    assign partial_sum_6_wr  			= factor_wr[6]  ? ($signed(sign_extend_factor_wr) << 6)  : 32'sd0;
    assign partial_sum_7_wr  			= factor_wr[7]  ? ($signed(sign_extend_factor_wr) << 7)  : 32'sd0;
	assign partial_sum_8_wr  			= factor_wr[8]  ? ($signed(sign_extend_factor_wr) << 8)  : 32'sd0;
	assign partial_sum_9_wr   			= factor_wr[9]  ? ($signed(sign_extend_factor_wr) << 9)  : 32'sd0;

    assign sum_stage1_wr = partial_sum_0_wr + partial_sum_1_wr + partial_sum_2_wr + partial_sum_3_wr + partial_sum_4_wr 
							+ partial_sum_5_wr + partial_sum_6_wr + partial_sum_7_wr + partial_sum_8_wr + partial_sum_9_wr;

    
    assign partial_sum_10_wr  			= factor_rg[10] ? ($signed(sign_extend_factor_rg) << 10) : 32'sd0;
    assign partial_sum_11_wr  			= factor_rg[11] ? ($signed(sign_extend_factor_rg) << 11) : 32'sd0;
    assign partial_sum_12_wr  			= factor_rg[12] ? ($signed(sign_extend_factor_rg) << 12) : 32'sd0;
    assign partial_sum_13_wr  			= factor_rg[13] ? ($signed(sign_extend_factor_rg) << 13) : 32'sd0;
    assign partial_sum_14_wr  			= factor_rg[14] ? ($signed(sign_extend_factor_rg) << 14) : 32'sd0;
    assign partial_sum_15_wr  			= factor_rg[15] ? ($signed(sign_extend_factor_rg) << 15) : 32'sd0;


    assign sum_stage2_wr 				= partial_sum_10_wr + partial_sum_11_wr + partial_sum_12_wr + partial_sum_13_wr 
										+ partial_sum_14_wr + partial_sum_15_wr + sum_stage1_rg;

	assign sum_final_wr					= (both_negative_rg) ? $signed(sum_stage2_wr[23:8]+sum_stage2_wr[7:7]) : -$signed(sum_stage2_wr[23:8]+sum_stage2_wr[7:7]);
		
	assign Bias_wr						= (Bias_valid_rg) ? Bias_rg : 0;
	assign ReLU_Valid_wr                = Bias_valid_rg & ReLU_en_rg;
	
	assign MAC_wr						= sum_final_wr + accumulation_rg + Bias_wr;
	
	assign MAC_ReLU_wr					= (ReLU_Valid_wr & MAC_wr[`DATA_WIDTH-1:`DATA_WIDTH-1]) ? 0 : MAC_wr;
    // Clocked process
    always @(posedge CLK) begin
        if (RST | ~S0_valid_in | ~S1_valid_in) begin
            sum_stage1_rg       		<= 0;
            sign_extend_factor_rg     	<= 0;
            factor_rg       		    <= 0;
            Weight_valid_rg         	<= 0;
            Signal_valid_rg         	<= 0;
            Bias_valid_rg         		<= 0;
            MAC_out              		<= 0;
			both_negative_rg			<= 0;
			accumulation_rg				<= 0;
			Bias_rg						<= 0;
			MAC_valid_out            	<= 0;
			ReLU_en_rg					<= 0;
        end 		
        else begin		
            sum_stage1_rg       		<= sum_stage1_wr;
            sign_extend_factor_rg     	<= sign_extend_factor_wr;
            factor_rg       		    <= abs_S1_in;
            Weight_valid_rg         	<= S0_valid_in;
            Signal_valid_rg             <= S1_valid_in;
            Bias_valid_rg         		<= S2_valid_in;
			Bias_rg						<= S2_in;
			both_negative_rg			<= both_negative_wr;
			if(Bias_valid_rg) begin
				accumulation_rg			<= 0;  
			end                         
			else if(Weight_valid_rg|Signal_valid_rg)  begin                  
				accumulation_rg			<= MAC_wr;  
			end
			else begin
				accumulation_rg			<= 0;
			end
			ReLU_en_rg					<= ReLU_en_in;

            // Adjust the output scaling to maintain the fixed-point format: 1 sign, 9 integer, 6 fractional bits
			MAC_out            		    <= MAC_ReLU_wr;
            MAC_valid_out            	<= Bias_valid_rg;
        end
    end
    
endmodule


module MAX
(
    input                                       CLK,
    input                                       RST,
    input                                       data1_valid_in,
    input       signed      [`DATA_WIDTH-1:0]    data1_in,
    input                                       data2_valid_in,
    input       signed      [`DATA_WIDTH-1:0]    data2_in,
    output reg                                  data_max_valid_out,
    output reg  signed      [`DATA_WIDTH-1:0]    data_max_out
);
    
    wire    signed [`DATA_WIDTH-1:0] max_value_wr;
    wire    data_max_valid_wr;
    reg     signed [`DATA_WIDTH-1:0] max_value_rg;
    reg     data1_valid_rg, data2_valid_rg;
    assign max_value_wr = (data1_in > data2_in) ? data1_in : data2_in;
    
    always@ (posedge CLK) begin
        if(RST) begin
            data1_valid_rg      <= 0;
            data2_valid_rg      <= 0;
            max_value_rg        <= 0;
        end
        else begin
            max_value_rg        <= max_value_wr;
            data1_valid_rg      <= data1_valid_in;
            data2_valid_rg      <= data2_valid_in;
            data_max_out        <= max_value_rg;
            if(data1_valid_rg & data2_valid_rg) begin
                data_max_valid_out  <= 1'b1;
            end
            else begin
                data_max_valid_out  <= 1'b0;
            end               
        end
    end
endmodule

