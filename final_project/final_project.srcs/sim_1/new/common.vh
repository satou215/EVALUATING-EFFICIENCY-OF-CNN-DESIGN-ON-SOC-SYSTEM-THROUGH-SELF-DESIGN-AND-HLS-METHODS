
///////////////////////////////////////////////
/// 				Controller 	   		   ////
///////////////////////////////////////////////

`define WRAM_ADDR_BITS      14
`define BRAM_ADDR_BITS      8
`define CRAM_ADDR_BITS      6

`define CTX_BITS      		32 // Padding: 2, n: 5, y: 3, k: 5, j: 3, ALU_CFG_BITS: 3, stride: 1, Source_LDM: 2, Destinate_LDM: 2, Starting_Address_Store: 6
`define PAD_BITS      		2
`define N_BITS      		5
`define Y_BITS      		3
`define K_BITS      		5
`define J_BITS      		3
`define STRIDE_BITS      	1
`define LDM_SRC_BITS     	2
`define LDM_DES_BITS     	2
`define LDM_SA_BITS     	5
`define LABEL               3
///////////////////////////////////////////////
/// 	Processing Element Array (PEA) 	   ////
///////////////////////////////////////////////
	
`define PE_NUM		       40
`define PE_NUM_BITS	       6

///***---- Processing Element (PE)----***////
	`define DATA_WIDTH		   16
///--------- Load Store Unit (LSU) ---------////
	`define LDM_ADDR_BITS      5
	`define LDM_NUM_BITS       2
	`define LSU_CFG_BITS       (1+`LDM_ADDR_BITS)

///------ Arithmetic Logic Unit (ALU)------///
	`define ALU_OPCODE   	   3
///-------------Dual-port RAM-------------///
	