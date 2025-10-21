module LSU#(
    parameter DATA_WIDTH = 16,
    parameter ALU_OPCODE = 3,
    parameter LDM_NUM_BITS = 2,
    parameter LDM_AD_WIDTH = 6,
    parameter LDM_SRC_BITS = 2,
    parameter LDM_DES_BITS = 2
)
(
	input  wire                                 	CLK,
	input  wire                                 	RST,
	
	//-----------------------------------------------------//
	//          			Input Signals                    // 
	//-----------------------------------------------------//
	
	///*** From AXI Bus ***///
	input  wire [LDM_NUM_BITS+LDM_AD_WIDTH-1:0] 	AXI_LDM_addra_in,
	input  wire signed [DATA_WIDTH-1:0]          	AXI_LDM_dina_in,
	input  wire 					              	AXI_LDM_ena_in,
	input  wire 					              	AXI_LDM_wea_in,
												
	output  wire signed [DATA_WIDTH-1:0]         	AXI_LDM_douta_out,
	///*** From the Controller ***///	
	input wire										Padding_Read_in,
	
	input  wire [LDM_SRC_BITS+LDM_AD_WIDTH-1:0]  	CTRL_LDM_addra_in,
	input  wire 					              	CTRL_LDM_ena_in,
	input  wire 					              	CTRL_LDM_wea_in,
	
	input  wire [LDM_SRC_BITS+LDM_AD_WIDTH-1:0]  	CTRL_LDM_addrb_in,
	input  wire 					              	CTRL_LDM_enb_in,
	input  wire 					              	CTRL_LDM_web_in,

	input  wire signed [ALU_OPCODE-2:0]			CFG_in,

	///*** From the ALU ***///
	input  wire [LDM_DES_BITS+LDM_AD_WIDTH-1:0]  	ALU_LDM_addrb_in,
	input  wire signed [DATA_WIDTH-1:0]          	ALU_LDM_dinb_in,
	input  wire 					              	ALU_LDM_enb_in,
	input  wire 					              	ALU_LDM_web_in, 
	
	//-----------------------------------------------------//
	//          			Output Signals                   // 
	//-----------------------------------------------------//  
	
	///*** To Global Buffer ***///
	output wire signed [DATA_WIDTH-1:0]           	Pixel_0_out,
	output wire 						           	Pixel_0_valid_out,
	output wire signed [DATA_WIDTH-1:0]           	Pixel_1_out,
	output wire 						           	Pixel_1_valid_out,
 	///*** To ALU ***///
	output wire signed [DATA_WIDTH-1:0]           	Pixel_2_out,
	output wire 						           	Pixel_2_valid_out
);
 
	// *************** Wire signals *************** //
	wire  					     					LDM0_ena_wr, LDM1_ena_wr, LDM2_ena_wr, LDM3_ena_wr, LDM0_enb_wr, LDM1_enb_wr, LDM2_enb_wr, LDM3_enb_wr;
	wire  					     					LDM0_wea_wr, LDM1_wea_wr, LDM2_wea_wr, LDM3_wea_wr, LDM0_web_wr, LDM1_web_wr, LDM2_web_wr, LDM3_web_wr;
	wire [LDM_AD_WIDTH-1:0]						LDM0_addra_wr, LDM1_addra_wr, LDM2_addra_wr, LDM3_addra_wr, LDM0_addrb_wr, LDM1_addrb_wr, LDM2_addrb_wr, LDM3_addrb_wr;
	wire [DATA_WIDTH-1:0]							LDM0_dina_wr, LDM1_dina_wr, LDM2_dina_wr, LDM3_dina_wr, LDM0_dinb_wr, LDM1_dinb_wr, LDM2_dinb_wr, LDM3_dinb_wr;
	wire [DATA_WIDTH-1:0]							LDM0_douta_wr, LDM1_douta_wr, LDM2_douta_wr, LDM3_douta_wr, LDM0_doutb_wr, LDM1_doutb_wr, LDM2_doutb_wr, LDM3_doutb_wr;
	wire signed [DATA_WIDTH-1:0]           			Pixel_2_wr;
	wire 						           			Pixel_2_valid_wr;	
	// *************** Register signals *************** //

	reg  					     					LDM0_ena_rg, LDM1_ena_rg, LDM2_ena_rg, LDM3_ena_rg, LDM0_enb_rg, LDM1_enb_rg, LDM2_enb_rg, LDM3_enb_rg;
	reg  					     					LDM0_wea_rg, LDM1_wea_rg, LDM2_wea_rg, LDM3_wea_rg, LDM0_web_rg, LDM1_web_rg, LDM2_web_rg, LDM3_web_rg;
	reg												AXI_LDM_ena_rg;
	reg	[LDM_NUM_BITS-1:0]							AXI_LDM_addra_rg;
	reg [LDM_SRC_BITS-1:0]  							CTRL_LDM_addra_rg, CTRL_LDM_addrb_rg;
	reg signed [DATA_WIDTH-1:0]           			Pixel_2_rg;
	reg 						           			Pixel_2_valid_rg;
	reg signed [ALU_OPCODE-2:0]					CFG_rg;
	
	//------- LDM0 -------//
	assign LDM0_ena_wr 		= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? AXI_LDM_ena_in:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? CTRL_LDM_ena_in: 0;
							  
	assign LDM0_wea_wr 		= (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0) ? AXI_LDM_wea_in: 0;

	assign LDM0_addra_wr 	= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? AXI_LDM_addra_in[LDM_AD_WIDTH-1:0]:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? CTRL_LDM_addra_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM0_dina_wr 	= (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0) ? AXI_LDM_dina_in: 0;

	assign LDM0_enb_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? ALU_LDM_enb_in:
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? CTRL_LDM_enb_in: 0;
							  
	assign LDM0_web_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? ALU_LDM_web_in: 0;

	assign LDM0_addrb_wr 	= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? ALU_LDM_addrb_in[LDM_AD_WIDTH-1:0]:
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==0)) ? CTRL_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM0_dinb_wr 	= ALU_LDM_dinb_in;
	
	//------- LDM1 -------//
	assign LDM1_ena_wr 		= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? AXI_LDM_ena_in:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? CTRL_LDM_ena_in: 0;
							  
	assign LDM1_wea_wr 		= (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1) ? AXI_LDM_wea_in : 0;

	assign LDM1_addra_wr 	= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? AXI_LDM_addra_in[LDM_AD_WIDTH-1:0]:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? CTRL_LDM_addra_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM1_dina_wr 	= (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH] == 1) ? AXI_LDM_dina_in: 0;

	assign LDM1_enb_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? ALU_LDM_enb_in:
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? CTRL_LDM_enb_in: 0;
							  
	assign LDM1_web_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? ALU_LDM_web_in: 0;

	assign LDM1_addrb_wr 	= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? ALU_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==1)) ? CTRL_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM1_dinb_wr 	= ALU_LDM_dinb_in;
	
	//------- LDM2 -------//
	assign LDM2_ena_wr 		= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? AXI_LDM_ena_in:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? CTRL_LDM_ena_in: 0;
							  
	assign LDM2_wea_wr 		= 0;

	assign LDM2_addra_wr 	= (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? AXI_LDM_addra_in[LDM_AD_WIDTH-1:0]:
							  (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? CTRL_LDM_addra_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM2_dina_wr 	= 0;

	assign LDM2_enb_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? ALU_LDM_enb_in:
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? CTRL_LDM_enb_in: 0;
							  
	assign LDM2_web_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? ALU_LDM_web_in: 0;

	assign LDM2_addrb_wr 	= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? ALU_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==2)) ? CTRL_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM2_dinb_wr 	= ALU_LDM_dinb_in;	
	
	//------- LDM3 -------//
	assign LDM3_ena_wr 		= (CFG_in == 2'b10) ? CTRL_LDM_ena_in: (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? AXI_LDM_ena_in:
							 (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? CTRL_LDM_ena_in : 0;						  
	assign LDM3_wea_wr 		= 0;
	assign LDM3_addra_wr 	= (CFG_in == 2'b10) ? CTRL_LDM_addra_in: (AXI_LDM_ena_in & (AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? AXI_LDM_addra_in[LDM_AD_WIDTH-1:0]:
						      (CTRL_LDM_ena_in & (CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? CTRL_LDM_addra_in[LDM_AD_WIDTH-1:0] : 0;						  
	assign LDM3_dina_wr 	= 0;

	assign LDM3_enb_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? ALU_LDM_enb_in:
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? CTRL_LDM_enb_in: 0;					  
	assign LDM3_web_wr 		= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? ALU_LDM_web_in: 0;
	assign LDM3_addrb_wr 	= (ALU_LDM_enb_in & (ALU_LDM_addrb_in[LDM_DES_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? ALU_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 
							  (CTRL_LDM_enb_in & (CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH]==3)) ? CTRL_LDM_addrb_in[LDM_AD_WIDTH-1:0]: 0;
							  
	assign LDM3_dinb_wr 	= ALU_LDM_dinb_in;
	
	/// BRAM 16-bit x 64

	Dual_Port_RAM_2 #
	(.DWIDTH(DATA_WIDTH), .AWIDTH(LDM_AD_WIDTH))
	 LDM0 (
	  .clka(CLK), // clock
	  ///*** Port A***///
	  .ena(LDM0_ena_wr), // port A read enable
	  .wea(LDM0_wea_wr), // port A write enable
	  .addra(LDM0_addra_wr), // port A address
	  .dina(LDM0_dina_wr), // port A data
	  .douta(LDM0_douta_wr), // port A data output
	  
	  .clkb(CLK), // clock
	  ///*** Port B***///
	  .enb(LDM0_enb_wr), // port A read enable
	  .web(LDM0_web_wr), // port A write enable
	  .addrb(LDM0_addrb_wr), // port A address
	  .dinb(LDM0_dinb_wr), // port A data
	  .doutb(LDM0_doutb_wr) // port A data output
	  );
	  
	Dual_Port_RAM_2 #
	(.DWIDTH(DATA_WIDTH), .AWIDTH(LDM_AD_WIDTH))
	 LDM1 (
	  .clka(CLK), // clock
	  ///*** Port A***///
	  .ena(LDM1_ena_wr), // port A read enable
	  .wea(LDM1_wea_wr), // port A write enable
	  .addra(LDM1_addra_wr), // port A address
	  .dina(LDM1_dina_wr), // port A data
	  .douta(LDM1_douta_wr), // port A data output
	  
	  .clkb(CLK), // clock
	  ///*** Port B***///
	  .enb(LDM1_enb_wr), // port A read enable
	  .web(LDM1_web_wr), // port A write enable
	  .addrb(LDM1_addrb_wr), // port A address
	  .dinb(LDM1_dinb_wr), // port A data
	  .doutb(LDM1_doutb_wr) // port A data output
	  );

	Dual_Port_RAM_2 #
	(.DWIDTH(DATA_WIDTH), .AWIDTH(LDM_AD_WIDTH))
	 LDM2 (
	  .clka(CLK), // clock
	  ///*** Port A***///
	  .ena(LDM2_ena_wr), // port A read enable
	  .wea(LDM2_wea_wr), // port A write enable
	  .addra(LDM2_addra_wr), // port A address
	  .dina(LDM2_dina_wr), // port A data
	  .douta(LDM2_douta_wr), // port A data output
	  
	  .clkb(CLK), // clock
	  ///*** Port B***///
	  .enb(LDM2_enb_wr), // port A read enable
	  .web(LDM2_web_wr), // port A write enable
	  .addrb(LDM2_addrb_wr), // port A address
	  .dinb(LDM2_dinb_wr), // port A data
	  .doutb(LDM2_doutb_wr) // port A data output
	  );

	Dual_Port_RAM_2 #
	(.DWIDTH(DATA_WIDTH), .AWIDTH(LDM_AD_WIDTH))
	 LDM3 (
	  .clka(CLK), // clock
	  ///*** Port A***///
	  .ena(LDM3_ena_wr), // port A read enable
	  .wea(LDM3_wea_wr), // port A write enable
	  .addra(LDM3_addra_wr), // port A address
	  .dina(LDM3_dina_wr), // port A data
	  .douta(LDM3_douta_wr), // port A data output
	  
	  .clkb(CLK), // clock
	  ///*** Port B***///
	  .enb(LDM3_enb_wr), // port A read enable
	  .web(LDM3_web_wr), // port A write enable
	  .addrb(LDM3_addrb_wr), // port A address
	  .dinb(LDM3_dinb_wr), // port A data
	  .doutb(LDM3_doutb_wr) // port A data output
	  );
	  
	always @(posedge CLK or negedge RST) begin
		if (~RST) begin
			LDM0_ena_rg			<= 0;
			LDM1_ena_rg			<= 0;
			LDM2_ena_rg			<= 0;
			LDM3_ena_rg			<= 0;
			LDM0_enb_rg			<= 0;
			LDM1_enb_rg			<= 0;
			LDM2_enb_rg			<= 0;
			LDM3_enb_rg			<= 0;
			
			LDM0_wea_rg			<= 0;
			LDM1_wea_rg			<= 0;
			LDM2_wea_rg			<= 0;
			LDM3_wea_rg			<= 0;
			LDM0_web_rg			<= 0;
			LDM1_web_rg			<= 0;
			LDM2_web_rg			<= 0;
			LDM3_web_rg			<= 0;
			
			CTRL_LDM_addra_rg	<= 0;
			CTRL_LDM_addrb_rg	<= 0;
			
			AXI_LDM_addra_rg	<= 0;
			
			AXI_LDM_ena_rg		<= 0;

			Pixel_2_rg			<= 0;
			Pixel_2_valid_rg	<= 0;
			
			CFG_rg				<= 0;
		end	
		else begin	
			LDM0_ena_rg			<= LDM0_ena_wr;
			LDM1_ena_rg			<= LDM1_ena_wr;
			LDM2_ena_rg			<= LDM2_ena_wr;
			LDM3_ena_rg			<= LDM3_ena_wr;
			LDM0_enb_rg			<= LDM0_enb_wr;
			LDM1_enb_rg			<= LDM1_enb_wr;
			LDM2_enb_rg			<= LDM2_enb_wr;
			LDM3_enb_rg			<= LDM3_enb_wr;
											
			LDM0_wea_rg			<= LDM0_wea_wr;
			LDM1_wea_rg			<= LDM1_wea_wr;
			LDM2_wea_rg			<= LDM2_wea_wr;
			LDM3_wea_rg			<= LDM3_wea_wr;
			LDM0_web_rg			<= LDM0_web_wr;
			LDM1_web_rg			<= LDM1_web_wr;
			LDM2_web_rg			<= LDM2_web_wr;
			LDM3_web_rg			<= LDM3_web_wr;
			
			CTRL_LDM_addra_rg	<= CTRL_LDM_addra_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH];
			CTRL_LDM_addrb_rg	<= CTRL_LDM_addrb_in[LDM_SRC_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH];
			
			AXI_LDM_addra_rg	<= AXI_LDM_addra_in[LDM_NUM_BITS+LDM_AD_WIDTH-1:LDM_AD_WIDTH];
			AXI_LDM_ena_rg		<= AXI_LDM_ena_in;
			
			Pixel_2_rg			<= Pixel_2_wr;
			Pixel_2_valid_rg	<= Pixel_2_valid_wr;
			
			CFG_rg				<= CFG_in;
		end
	 end
  
	assign Pixel_0_out  		= (CTRL_LDM_addra_rg==0) ? LDM0_douta_wr : (CTRL_LDM_addra_rg==1) ? LDM1_douta_wr: (CTRL_LDM_addra_rg==2) ? LDM2_douta_wr: LDM3_douta_wr;							 
	assign Pixel_0_valid_out  	= (CTRL_LDM_addra_rg==0) ? LDM0_ena_rg&~LDM0_wea_rg : (CTRL_LDM_addra_rg==1) ? LDM1_ena_rg&~LDM1_wea_rg : (CTRL_LDM_addra_rg==2) ? LDM2_ena_rg&~LDM2_wea_rg : LDM3_ena_rg&~LDM3_wea_rg;
								
	assign Pixel_1_out  		= (CTRL_LDM_addrb_rg==0) ? LDM0_doutb_wr : (CTRL_LDM_addra_rg==1) ? LDM1_doutb_wr : (CTRL_LDM_addra_rg==2) ? LDM2_doutb_wr : LDM3_doutb_wr;
	assign Pixel_1_valid_out  	= (CTRL_LDM_addrb_rg==0) ? LDM0_enb_rg&~LDM0_web_rg : (CTRL_LDM_addra_rg==1) ? LDM1_enb_rg&~LDM1_web_rg : (CTRL_LDM_addra_rg==2) ? LDM2_enb_rg&~LDM2_web_rg :LDM3_enb_rg&~LDM3_web_rg;
								
	assign Pixel_2_wr	  		= (CFG_rg==2'b10) ? LDM3_douta_wr : 0;
	assign Pixel_2_valid_wr  	= (CFG_rg==2'b10) ? LDM3_ena_rg&~LDM3_wea_rg : 0;

	assign Pixel_2_out  		= Pixel_2_rg;
	assign Pixel_2_valid_out  	= Pixel_2_valid_rg;
	
	assign AXI_LDM_douta_out	= ((AXI_LDM_addra_rg==0) & AXI_LDM_ena_rg) ? LDM0_douta_wr : ((AXI_LDM_addra_rg==1) & AXI_LDM_ena_rg) ? LDM1_douta_wr: ((AXI_LDM_addra_rg==2) & AXI_LDM_ena_rg) ? LDM2_douta_wr: ((AXI_LDM_addra_rg==3) & AXI_LDM_ena_rg) ? LDM3_douta_wr: 0;
	
endmodule