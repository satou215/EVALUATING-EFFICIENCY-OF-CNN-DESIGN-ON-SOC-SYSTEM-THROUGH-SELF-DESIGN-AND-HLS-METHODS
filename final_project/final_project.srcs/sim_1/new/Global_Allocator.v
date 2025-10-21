//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 11:39:27 AM
// Design Name: 
// Module Name: Global_Buffer
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

module Global_Allocator
(
// ---- INPUT----
    input wire CLK,
    input wire RST,
    // PE0
    input wire                              PE0_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE0_Pixel_0_in,
    input wire                              PE0_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE0_Pixel_1_in,
    // PE1
    input wire                              PE1_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE1_Pixel_0_in,
    input wire                              PE1_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE1_Pixel_1_in,
    // PE2
    input wire                              PE2_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE2_Pixel_0_in,
    input wire                              PE2_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE2_Pixel_1_in,
    // PE3
    input wire                              PE3_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE3_Pixel_0_in,
    input wire                              PE3_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE3_Pixel_1_in,
    // PE4
    input wire                              PE4_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE4_Pixel_0_in,
    input wire                              PE4_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE4_Pixel_1_in,
    // PE5
    input wire                              PE5_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE5_Pixel_0_in,
    input wire                              PE5_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE5_Pixel_1_in,
    // PE6
    input wire                              PE6_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE6_Pixel_0_in,
    input wire                              PE6_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE6_Pixel_1_in,
    // PE7
    input wire                              PE7_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE7_Pixel_0_in,
    input wire                              PE7_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE7_Pixel_1_in,
    // PE8
    input wire                              PE8_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE8_Pixel_0_in,
    input wire                              PE8_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE8_Pixel_1_in,
    // PE9
    input wire                              PE9_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE9_Pixel_0_in,
    input wire                              PE9_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE9_Pixel_1_in,
    // PE10
    input wire                              PE10_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE10_Pixel_0_in,
    input wire                              PE10_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE10_Pixel_1_in,
    // PE11
    input wire                              PE11_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE11_Pixel_0_in,
    input wire                              PE11_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE11_Pixel_1_in,
    // PE12
    input wire                              PE12_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE12_Pixel_0_in,
    input wire                              PE12_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE12_Pixel_1_in,
    // PE13
    input wire                              PE13_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE13_Pixel_0_in,
    input wire                              PE13_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE13_Pixel_1_in,
    // PE14
    input wire                              PE14_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE14_Pixel_0_in,
    input wire                              PE14_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE14_Pixel_1_in,
    // PE15
    input wire                              PE15_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE15_Pixel_0_in,
    input wire                              PE15_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE15_Pixel_1_in,
    // PE16
    input wire                              PE16_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE16_Pixel_0_in,
    input wire                              PE16_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE16_Pixel_1_in,
    // PE17
    input wire                              PE17_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE17_Pixel_0_in,
    input wire                              PE17_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE17_Pixel_1_in,
    // PE18
    input wire                              PE18_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE18_Pixel_0_in,
    input wire                              PE18_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE18_Pixel_1_in,
    // PE19
    input wire                              PE19_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE19_Pixel_0_in,
    input wire                              PE19_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE19_Pixel_1_in,
    // PE20
    input wire                              PE20_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE20_Pixel_0_in,
    input wire                              PE20_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE20_Pixel_1_in,
    // PE21
    input wire                              PE21_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE21_Pixel_0_in,
    input wire                              PE21_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE21_Pixel_1_in,
    // PE22
    input wire                              PE22_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE22_Pixel_0_in,
    input wire                              PE22_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE22_Pixel_1_in,
    // PE23
    input wire                              PE23_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE23_Pixel_0_in,
    input wire                              PE23_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE23_Pixel_1_in,
    // PE24
    input wire                              PE24_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE24_Pixel_0_in,
    input wire                              PE24_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE24_Pixel_1_in,
    // PE25
    input wire                              PE25_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE25_Pixel_0_in,
    input wire                              PE25_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE25_Pixel_1_in,
    // PE26
    input wire                              PE26_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE26_Pixel_0_in,
    input wire                              PE26_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE26_Pixel_1_in,
    // PE27
    input wire                              PE27_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE27_Pixel_0_in,
    input wire                              PE27_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE27_Pixel_1_in,
    // PE28
    input wire                              PE28_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE28_Pixel_0_in,
    input wire                              PE28_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE28_Pixel_1_in,
    // PE29
    input wire                              PE29_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE29_Pixel_0_in,
    input wire                              PE29_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE29_Pixel_1_in,
    // PE30
    input wire                              PE30_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE30_Pixel_0_in,
    input wire                              PE30_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE30_Pixel_1_in,
    // PE31
    input wire                              PE31_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE31_Pixel_0_in,
    input wire                              PE31_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE31_Pixel_1_in,
    // PE32
    input wire                              PE32_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE32_Pixel_0_in,
    input wire                              PE32_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE32_Pixel_1_in,
    // PE33
    input wire                              PE33_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE33_Pixel_0_in,
    input wire                              PE33_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE33_Pixel_1_in,
    // PE34
    input wire                              PE34_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE34_Pixel_0_in,
    input wire                              PE34_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE34_Pixel_1_in,
    // PE35
    input wire                              PE35_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE35_Pixel_0_in,
    input wire                              PE35_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE35_Pixel_1_in,
    // PE36
    input wire                              PE36_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE36_Pixel_0_in,
    input wire                              PE36_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE36_Pixel_1_in,
    // PE37
    input wire                              PE37_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE37_Pixel_0_in,
    input wire                              PE37_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE37_Pixel_1_in,
    // PE38
    input wire                              PE38_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE38_Pixel_0_in,
    input wire                              PE38_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE38_Pixel_1_in,
    // PE39
    input wire                              PE39_Pixel_0_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE39_Pixel_0_in,
    input wire                              PE39_Pixel_1_valid_in,
    input wire signed   [`DATA_WIDTH-1:0]   PE39_Pixel_1_in,
    // From Controller
    input wire                              En_in,
    input wire          [`ALU_OPCODE-2:0]   Opcode_in,      
    input wire          [`PE_NUM_BITS-1:0]  MUX_Selection_in,
	// ---- Output ---- 
	    // PE0
    output reg                               PE0_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE0_Pixel_0_out,
    output reg                               PE0_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE0_Pixel_1_out,
    output reg                               PE0_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE0_Pixel_2_out,
    // PE1
    output reg                               PE1_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE1_Pixel_0_out,
    output reg                               PE1_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE1_Pixel_1_out,
    output reg                               PE1_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE1_Pixel_2_out,
    // PE2
    output reg                               PE2_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE2_Pixel_0_out,
    output reg                               PE2_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE2_Pixel_1_out,
    output reg                               PE2_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE2_Pixel_2_out,
    // PE3
    output reg                               PE3_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE3_Pixel_0_out,
    output reg                               PE3_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE3_Pixel_1_out,
    output reg                               PE3_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE3_Pixel_2_out,
    // PE4
    output reg                               PE4_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE4_Pixel_0_out,
    output reg                               PE4_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE4_Pixel_1_out,
    output reg                               PE4_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE4_Pixel_2_out,
    // PE5
    output reg                               PE5_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE5_Pixel_0_out,
    output reg                               PE5_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE5_Pixel_1_out,
    output reg                               PE5_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE5_Pixel_2_out,
    // PE6
    output reg                               PE6_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE6_Pixel_0_out,
    output reg                               PE6_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE6_Pixel_1_out,
    output reg                               PE6_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE6_Pixel_2_out,
    // PE7
    output reg                               PE7_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE7_Pixel_0_out,
    output reg                               PE7_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE7_Pixel_1_out,
    output reg                               PE7_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE7_Pixel_2_out,
    // PE8
    output reg                               PE8_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE8_Pixel_0_out,
    output reg                               PE8_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE8_Pixel_1_out,
    output reg                               PE8_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE8_Pixel_2_out,
    // PE9
    output reg                               PE9_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE9_Pixel_0_out,
    output reg                               PE9_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE9_Pixel_1_out,
    output reg                               PE9_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE9_Pixel_2_out,
    // PE10
    output reg                               PE10_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE10_Pixel_0_out,
    output reg                               PE10_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE10_Pixel_1_out,
    output reg                               PE10_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE10_Pixel_2_out,
    // PE11
    output reg                               PE11_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE11_Pixel_0_out,
    output reg                               PE11_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE11_Pixel_1_out,
    output reg                               PE11_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE11_Pixel_2_out,
    // PE12
    output reg                               PE12_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE12_Pixel_0_out,
    output reg                               PE12_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE12_Pixel_1_out,
    output reg                               PE12_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE12_Pixel_2_out,
    // PE13
    output reg                               PE13_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE13_Pixel_0_out,
    output reg                               PE13_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE13_Pixel_1_out,
    output reg                               PE13_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE13_Pixel_2_out,
    // PE14
    output reg                               PE14_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE14_Pixel_0_out,
    output reg                               PE14_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE14_Pixel_1_out,
    output reg                               PE14_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE14_Pixel_2_out,
    // PE15
    output reg                               PE15_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE15_Pixel_0_out,
    output reg                               PE15_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE15_Pixel_1_out,
    output reg                               PE15_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE15_Pixel_2_out,
    // PE16
    output reg                               PE16_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE16_Pixel_0_out,
    output reg                               PE16_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE16_Pixel_1_out,
    output reg                               PE16_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE16_Pixel_2_out,
    // PE17
    output reg                               PE17_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE17_Pixel_0_out,
    output reg                               PE17_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE17_Pixel_1_out,
    output reg                               PE17_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE17_Pixel_2_out,
    // PE18
    output reg                               PE18_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE18_Pixel_0_out,
    output reg                               PE18_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE18_Pixel_1_out,
    output reg                               PE18_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE18_Pixel_2_out,
    // PE19
    output reg                               PE19_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE19_Pixel_0_out,
    output reg                               PE19_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE19_Pixel_1_out,
    output reg                               PE19_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE19_Pixel_2_out,
    // PE20
    output reg                               PE20_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE20_Pixel_0_out,
    output reg                               PE20_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE20_Pixel_1_out,
    output reg                               PE20_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE20_Pixel_2_out,
    // PE21
    output reg                               PE21_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE21_Pixel_0_out,
    output reg                               PE21_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE21_Pixel_1_out,
    output reg                               PE21_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE21_Pixel_2_out,
    // PE22
    output reg                               PE22_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE22_Pixel_0_out,
    output reg                               PE22_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE22_Pixel_1_out,
    output reg                               PE22_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE22_Pixel_2_out,
    // PE23
    output reg                               PE23_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE23_Pixel_0_out,
    output reg                               PE23_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE23_Pixel_1_out,
    output reg                               PE23_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE23_Pixel_2_out,
    // PE24
    output reg                               PE24_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE24_Pixel_0_out,
    output reg                               PE24_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE24_Pixel_1_out,
    output reg                               PE24_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE24_Pixel_2_out,
    // PE25
    output reg                               PE25_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE25_Pixel_0_out,
    output reg                               PE25_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE25_Pixel_1_out,
    output reg                               PE25_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE25_Pixel_2_out,
    // PE26
    output reg                               PE26_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE26_Pixel_0_out,
    output reg                               PE26_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE26_Pixel_1_out,
    output reg                               PE26_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE26_Pixel_2_out,
    // PE27
    output reg                               PE27_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE27_Pixel_0_out,
    output reg                               PE27_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE27_Pixel_1_out,
    output reg                               PE27_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE27_Pixel_2_out,
    // PE28
    output reg                               PE28_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE28_Pixel_0_out,
    output reg                               PE28_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE28_Pixel_1_out,
    output reg                               PE28_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE28_Pixel_2_out,
    // PE29
    output reg                               PE29_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE29_Pixel_0_out,
    output reg                               PE29_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE29_Pixel_1_out,
    output reg                               PE29_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE29_Pixel_2_out,
    // PE30
    output reg                               PE30_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE30_Pixel_0_out,
    output reg                               PE30_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE30_Pixel_1_out,
    output reg                               PE30_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE30_Pixel_2_out,
    // PE31
    output reg                               PE31_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE31_Pixel_0_out,
    output reg                               PE31_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE31_Pixel_1_out,
    output reg                               PE31_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE31_Pixel_2_out,
    // PE32
    output reg                               PE32_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE32_Pixel_0_out,
    output reg                               PE32_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE32_Pixel_1_out,
    output reg                               PE32_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE32_Pixel_2_out,
    // PE33
    output reg                               PE33_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE33_Pixel_0_out,
    output reg                               PE33_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE33_Pixel_1_out,
    output reg                               PE33_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE33_Pixel_2_out,
    // PE34
    output reg                               PE34_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE34_Pixel_0_out,
    output reg                               PE34_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE34_Pixel_1_out,
    output reg                               PE34_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE34_Pixel_2_out,
    // PE35
    output reg                               PE35_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE35_Pixel_0_out,
    output reg                               PE35_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE35_Pixel_1_out,
    output reg                               PE35_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE35_Pixel_2_out,
    // PE36
    output reg                               PE36_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE36_Pixel_0_out,
    output reg                               PE36_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE36_Pixel_1_out,
    output reg                               PE36_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE36_Pixel_2_out,
    // PE37
    output reg                               PE37_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE37_Pixel_0_out,
    output reg                               PE37_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE37_Pixel_1_out,
    output reg                               PE37_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE37_Pixel_2_out,
    // PE38
    output reg                               PE38_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE38_Pixel_0_out,
    output reg                               PE38_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE38_Pixel_1_out,
    output reg                               PE38_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE38_Pixel_2_out,
    // PE39
    output reg                               PE39_Pixel_0_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE39_Pixel_0_out,
    output reg                               PE39_Pixel_1_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE39_Pixel_1_out,
    output reg                               PE39_Pixel_2_valid_out,
    output reg  signed   [`DATA_WIDTH-1:0]   PE39_Pixel_2_out
    );
    
    // ----- Wire signals ----
    wire        signed   [`DATA_WIDTH-1:0]   PE0_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE1_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE2_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE3_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE4_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE5_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE6_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE7_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE8_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE9_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE10_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE11_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE12_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE13_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE14_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE15_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE16_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE17_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE18_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE19_Pixel_to_MUX_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE20_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE21_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE22_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE23_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE24_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE25_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE26_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE27_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE28_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE29_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE30_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE31_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE32_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE33_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE34_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE35_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE36_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE37_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE38_Pixel_to_MUX_wr;
	wire        signed   [`DATA_WIDTH-1:0]   PE39_Pixel_to_MUX_wr;
	
    wire                                     PE0_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE0_Pixel_0_out_wr;
    wire                                     PE0_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE0_Pixel_1_out_wr;
    wire                                     PE0_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE0_Pixel_2_out_wr;

    wire                                     PE1_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE1_Pixel_0_out_wr;
    wire                                     PE1_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE1_Pixel_1_out_wr;
    wire                                     PE1_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE1_Pixel_2_out_wr;

    wire                                     PE2_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE2_Pixel_0_out_wr;
    wire                                     PE2_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE2_Pixel_1_out_wr;
    wire                                     PE2_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE2_Pixel_2_out_wr;

    wire                                     PE3_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE3_Pixel_0_out_wr;
    wire                                     PE3_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE3_Pixel_1_out_wr;
    wire                                     PE3_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE3_Pixel_2_out_wr;

    wire                                     PE4_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE4_Pixel_0_out_wr;
    wire                                     PE4_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE4_Pixel_1_out_wr;
    wire                                     PE4_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE4_Pixel_2_out_wr;

    wire                                     PE5_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE5_Pixel_0_out_wr;
    wire                                     PE5_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE5_Pixel_1_out_wr;
    wire                                     PE5_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE5_Pixel_2_out_wr;

    wire                                     PE6_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE6_Pixel_0_out_wr;
    wire                                     PE6_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE6_Pixel_1_out_wr;
    wire                                     PE6_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE6_Pixel_2_out_wr;

    wire                                     PE7_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE7_Pixel_0_out_wr;
    wire                                     PE7_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE7_Pixel_1_out_wr;
    wire                                     PE7_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE7_Pixel_2_out_wr;

    wire                                     PE8_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE8_Pixel_0_out_wr;
    wire                                     PE8_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE8_Pixel_1_out_wr;
    wire                                     PE8_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE8_Pixel_2_out_wr;

    wire                                     PE9_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE9_Pixel_0_out_wr;
    wire                                     PE9_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE9_Pixel_1_out_wr;
    wire                                     PE9_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE9_Pixel_2_out_wr;

    wire                                     PE10_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE10_Pixel_0_out_wr;
    wire                                     PE10_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE10_Pixel_1_out_wr;
    wire                                     PE10_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE10_Pixel_2_out_wr;
    
    wire                                     PE11_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE11_Pixel_0_out_wr;
    wire                                     PE11_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE11_Pixel_1_out_wr;
    wire                                     PE11_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE11_Pixel_2_out_wr;
    
    wire                                     PE12_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE12_Pixel_0_out_wr;
    wire                                     PE12_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE12_Pixel_1_out_wr;
    wire                                     PE12_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE12_Pixel_2_out_wr;
    
    wire                                     PE13_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE13_Pixel_0_out_wr;
    wire                                     PE13_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE13_Pixel_1_out_wr;
    wire                                     PE13_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE13_Pixel_2_out_wr;
    
    wire                                     PE14_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE14_Pixel_0_out_wr;
    wire                                     PE14_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE14_Pixel_1_out_wr;
    wire                                     PE14_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE14_Pixel_2_out_wr;
  
    wire                                     PE15_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE15_Pixel_0_out_wr;
    wire                                     PE15_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE15_Pixel_1_out_wr;
    wire                                     PE15_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE15_Pixel_2_out_wr;
    
    wire                                     PE16_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE16_Pixel_0_out_wr;
    wire                                     PE16_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE16_Pixel_1_out_wr;
    wire                                     PE16_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE16_Pixel_2_out_wr;
  
    wire                                     PE17_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE17_Pixel_0_out_wr;
    wire                                     PE17_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE17_Pixel_1_out_wr;
    wire                                     PE17_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE17_Pixel_2_out_wr;
   
    wire                                     PE18_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE18_Pixel_0_out_wr;
    wire                                     PE18_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE18_Pixel_1_out_wr;
    wire                                     PE18_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE18_Pixel_2_out_wr;
 
    wire                                     PE19_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE19_Pixel_0_out_wr;
    wire                                     PE19_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE19_Pixel_1_out_wr;
    wire                                     PE19_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE19_Pixel_2_out_wr;
 
    wire                                     PE20_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE20_Pixel_0_out_wr;
    wire                                     PE20_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE20_Pixel_1_out_wr;
    wire                                     PE20_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE20_Pixel_2_out_wr;
   
    wire                                     PE21_Pixel_0_valid_out_wr;        
    wire        signed   [`DATA_WIDTH-1:0]   PE21_Pixel_0_out_wr;
    wire                                     PE21_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE21_Pixel_1_out_wr;
    wire                                     PE21_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE21_Pixel_2_out_wr;
    
    wire                                     PE22_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE22_Pixel_0_out_wr;
    wire                                     PE22_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE22_Pixel_1_out_wr;
    wire                                     PE22_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE22_Pixel_2_out_wr;
   
    wire                                     PE23_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE23_Pixel_0_out_wr;
    wire                                     PE23_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE23_Pixel_1_out_wr;
    wire                                     PE23_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE23_Pixel_2_out_wr;
    
    wire                                     PE24_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE24_Pixel_0_out_wr;
    wire                                     PE24_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE24_Pixel_1_out_wr;
    wire                                     PE24_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE24_Pixel_2_out_wr;
   
    wire                                     PE25_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE25_Pixel_0_out_wr;
    wire                                     PE25_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE25_Pixel_1_out_wr;
    wire                                     PE25_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE25_Pixel_2_out_wr;
   
    wire                                     PE26_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE26_Pixel_0_out_wr;
    wire                                     PE26_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE26_Pixel_1_out_wr;
    wire                                     PE26_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE26_Pixel_2_out_wr;
    
    wire                                     PE27_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE27_Pixel_0_out_wr;
    wire                                     PE27_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE27_Pixel_1_out_wr;
    wire                                     PE27_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE27_Pixel_2_out_wr;
   
    wire                                     PE28_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE28_Pixel_0_out_wr;
    wire                                     PE28_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE28_Pixel_1_out_wr;
    wire                                     PE28_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE28_Pixel_2_out_wr;
  
    wire                                     PE29_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE29_Pixel_0_out_wr;
    wire                                     PE29_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE29_Pixel_1_out_wr;
    wire                                     PE29_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE29_Pixel_2_out_wr;
   
    wire                                     PE30_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE30_Pixel_0_out_wr;
    wire                                     PE30_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE30_Pixel_1_out_wr;
    wire                                     PE30_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE30_Pixel_2_out_wr;
   
    wire                                     PE31_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE31_Pixel_0_out_wr;
    wire                                     PE31_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE31_Pixel_1_out_wr;
    wire                                     PE31_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE31_Pixel_2_out_wr;
    
    wire                                     PE32_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE32_Pixel_0_out_wr;
    wire                                     PE32_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE32_Pixel_1_out_wr;
    wire                                     PE32_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE32_Pixel_2_out_wr;
   
    wire                                     PE33_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE33_Pixel_0_out_wr;
    wire                                     PE33_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE33_Pixel_1_out_wr;
    wire                                     PE33_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE33_Pixel_2_out_wr;
   
    wire                                     PE34_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE34_Pixel_0_out_wr;
    wire                                     PE34_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE34_Pixel_1_out_wr;
    wire                                     PE34_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE34_Pixel_2_out_wr;
   
    wire                                     PE35_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE35_Pixel_0_out_wr;
    wire                                     PE35_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE35_Pixel_1_out_wr;
    wire                                     PE35_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE35_Pixel_2_out_wr;
   
    wire                                     PE36_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE36_Pixel_0_out_wr;
    wire                                     PE36_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE36_Pixel_1_out_wr;
    wire                                     PE36_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE36_Pixel_2_out_wr;
    
    wire                                     PE37_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE37_Pixel_0_out_wr;
    wire                                     PE37_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE37_Pixel_1_out_wr;
    wire                                     PE37_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE37_Pixel_2_out_wr;
   
    wire                                     PE38_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE38_Pixel_0_out_wr;
    wire                                     PE38_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE38_Pixel_1_out_wr;
    wire                                     PE38_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE38_Pixel_2_out_wr;
  
    wire                                     PE39_Pixel_0_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE39_Pixel_0_out_wr;
    wire                                     PE39_Pixel_1_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE39_Pixel_1_out_wr;
    wire                                     PE39_Pixel_2_valid_out_wr;
    wire        signed   [`DATA_WIDTH-1:0]   PE39_Pixel_2_out_wr;
	
	// ----Register signals---- //
	reg										 Parity_PE_Selection_rg;






    assign PE0_Pixel_to_MUX_wr =  PE0_Pixel_0_in;
								
	assign PE1_Pixel_to_MUX_wr =  PE1_Pixel_0_in;	
								
	assign PE2_Pixel_to_MUX_wr =  PE2_Pixel_0_in;
								
	assign PE3_Pixel_to_MUX_wr =  PE3_Pixel_0_in;

	assign PE4_Pixel_to_MUX_wr =  PE4_Pixel_0_in;
								
	assign PE5_Pixel_to_MUX_wr =  PE5_Pixel_0_in;

	assign PE6_Pixel_to_MUX_wr =  PE6_Pixel_0_in;
								
	assign PE7_Pixel_to_MUX_wr =  PE7_Pixel_0_in;

	assign PE8_Pixel_to_MUX_wr =  PE8_Pixel_0_in;
								
	assign PE9_Pixel_to_MUX_wr =  PE9_Pixel_0_in;

	assign PE10_Pixel_to_MUX_wr = PE10_Pixel_0_in;
									
	assign PE11_Pixel_to_MUX_wr = PE11_Pixel_0_in;	
									
	assign PE12_Pixel_to_MUX_wr = PE12_Pixel_0_in;
									
	assign PE13_Pixel_to_MUX_wr = PE13_Pixel_0_in;
									
	assign PE14_Pixel_to_MUX_wr = PE14_Pixel_0_in;
								
	assign PE15_Pixel_to_MUX_wr = PE15_Pixel_0_in;
									
	assign PE16_Pixel_to_MUX_wr = PE16_Pixel_0_in;
									
	assign PE17_Pixel_to_MUX_wr = PE17_Pixel_0_in;
									
	assign PE18_Pixel_to_MUX_wr = PE18_Pixel_0_in;
									
	assign PE19_Pixel_to_MUX_wr = PE19_Pixel_0_in;
   
    assign PE20_Pixel_to_MUX_wr = PE20_Pixel_0_in;
								
	assign PE21_Pixel_to_MUX_wr = PE21_Pixel_0_in;	
								
	assign PE22_Pixel_to_MUX_wr = PE22_Pixel_0_in;
								
	assign PE23_Pixel_to_MUX_wr = PE23_Pixel_0_in;

	assign PE24_Pixel_to_MUX_wr = PE24_Pixel_0_in;
								
	assign PE25_Pixel_to_MUX_wr = PE25_Pixel_0_in;

	assign PE26_Pixel_to_MUX_wr = PE26_Pixel_0_in;
								
	assign PE27_Pixel_to_MUX_wr = PE27_Pixel_0_in;

	assign PE28_Pixel_to_MUX_wr = PE28_Pixel_0_in;
								
	assign PE29_Pixel_to_MUX_wr = PE29_Pixel_0_in;

	assign PE30_Pixel_to_MUX_wr = PE30_Pixel_0_in;
									
	assign PE31_Pixel_to_MUX_wr = PE31_Pixel_0_in;	
									
	assign PE32_Pixel_to_MUX_wr = PE32_Pixel_0_in;
									
	assign PE33_Pixel_to_MUX_wr = PE33_Pixel_0_in;
									
	assign PE34_Pixel_to_MUX_wr = PE34_Pixel_0_in;
								
	assign PE35_Pixel_to_MUX_wr = PE35_Pixel_0_in;
									
	assign PE36_Pixel_to_MUX_wr = PE36_Pixel_0_in;
									
	assign PE37_Pixel_to_MUX_wr = PE37_Pixel_0_in;
									
	assign PE38_Pixel_to_MUX_wr = PE38_Pixel_0_in;
									
	assign PE39_Pixel_to_MUX_wr = PE39_Pixel_0_in;
	
	
	


        MUX_40_1 PE0_Pixel_0 (
    .data0_in(PE0_Pixel_to_MUX_wr),
    .data1_in(PE1_Pixel_to_MUX_wr),
    .data2_in(PE2_Pixel_to_MUX_wr),
    .data3_in(PE3_Pixel_to_MUX_wr),
    .data4_in(PE4_Pixel_to_MUX_wr),
    .data5_in(PE5_Pixel_to_MUX_wr),
    .data6_in(PE6_Pixel_to_MUX_wr),
    .data7_in(PE7_Pixel_to_MUX_wr),
    .data8_in(PE8_Pixel_to_MUX_wr),
    .data9_in(PE9_Pixel_to_MUX_wr),
    .data10_in(PE10_Pixel_to_MUX_wr),
    .data11_in(PE11_Pixel_to_MUX_wr),
    .data12_in(PE12_Pixel_to_MUX_wr),
    .data13_in(PE13_Pixel_to_MUX_wr),
    .data14_in(PE14_Pixel_to_MUX_wr),
    .data15_in(PE15_Pixel_to_MUX_wr),
    .data16_in(PE16_Pixel_to_MUX_wr),
    .data17_in(PE17_Pixel_to_MUX_wr),
    .data18_in(PE18_Pixel_to_MUX_wr),
    .data19_in(PE19_Pixel_to_MUX_wr),
    .data20_in(PE20_Pixel_to_MUX_wr),
    .data21_in(PE21_Pixel_to_MUX_wr),
    .data22_in(PE22_Pixel_to_MUX_wr),
    .data23_in(PE23_Pixel_to_MUX_wr),
    .data24_in(PE24_Pixel_to_MUX_wr),
    .data25_in(PE25_Pixel_to_MUX_wr),
    .data26_in(PE26_Pixel_to_MUX_wr),
    .data27_in(PE27_Pixel_to_MUX_wr),
    .data28_in(PE28_Pixel_to_MUX_wr),
    .data29_in(PE29_Pixel_to_MUX_wr),
    .data30_in(PE30_Pixel_to_MUX_wr),
    .data31_in(PE31_Pixel_to_MUX_wr),
    .data32_in(PE32_Pixel_to_MUX_wr),
    .data33_in(PE33_Pixel_to_MUX_wr),
    .data34_in(PE34_Pixel_to_MUX_wr),
    .data35_in(PE35_Pixel_to_MUX_wr),
    .data36_in(PE36_Pixel_to_MUX_wr),
    .data37_in(PE37_Pixel_to_MUX_wr),
    .data38_in(PE38_Pixel_to_MUX_wr),
    .data39_in(PE39_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE0_Pixel_0_out_wr)
    );


        MUX_40_1 PE1_Pixel_0 (
    .data0_in(PE1_Pixel_to_MUX_wr),
    .data1_in(PE2_Pixel_to_MUX_wr),
    .data2_in(PE3_Pixel_to_MUX_wr),
    .data3_in(PE4_Pixel_to_MUX_wr),
    .data4_in(PE5_Pixel_to_MUX_wr),
    .data5_in(PE6_Pixel_to_MUX_wr),
    .data6_in(PE7_Pixel_to_MUX_wr),
    .data7_in(PE8_Pixel_to_MUX_wr),
    .data8_in(PE9_Pixel_to_MUX_wr),
    .data9_in(PE10_Pixel_to_MUX_wr),
    .data10_in(PE11_Pixel_to_MUX_wr),
    .data11_in(PE12_Pixel_to_MUX_wr),
    .data12_in(PE13_Pixel_to_MUX_wr),
    .data13_in(PE14_Pixel_to_MUX_wr),
    .data14_in(PE15_Pixel_to_MUX_wr),
    .data15_in(PE16_Pixel_to_MUX_wr),
    .data16_in(PE17_Pixel_to_MUX_wr),
    .data17_in(PE18_Pixel_to_MUX_wr),
    .data18_in(PE19_Pixel_to_MUX_wr),
    .data19_in(PE20_Pixel_to_MUX_wr),
    .data20_in(PE21_Pixel_to_MUX_wr),
    .data21_in(PE22_Pixel_to_MUX_wr),
    .data22_in(PE23_Pixel_to_MUX_wr),
    .data23_in(PE24_Pixel_to_MUX_wr),
    .data24_in(PE25_Pixel_to_MUX_wr),
    .data25_in(PE26_Pixel_to_MUX_wr),
    .data26_in(PE27_Pixel_to_MUX_wr),
    .data27_in(PE28_Pixel_to_MUX_wr),
    .data28_in(PE29_Pixel_to_MUX_wr),
    .data29_in(PE30_Pixel_to_MUX_wr),
    .data30_in(PE31_Pixel_to_MUX_wr),
    .data31_in(PE32_Pixel_to_MUX_wr),
    .data32_in(PE33_Pixel_to_MUX_wr),
    .data33_in(PE34_Pixel_to_MUX_wr),
    .data34_in(PE35_Pixel_to_MUX_wr),
    .data35_in(PE36_Pixel_to_MUX_wr),
    .data36_in(PE37_Pixel_to_MUX_wr),
    .data37_in(PE38_Pixel_to_MUX_wr),
    .data38_in(PE39_Pixel_to_MUX_wr),
    .data39_in(PE0_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE1_Pixel_0_out_wr)
    );


        MUX_40_1 PE2_Pixel_0 (
    .data0_in(PE2_Pixel_to_MUX_wr),
    .data1_in(PE3_Pixel_to_MUX_wr),
    .data2_in(PE4_Pixel_to_MUX_wr),
    .data3_in(PE5_Pixel_to_MUX_wr),
    .data4_in(PE6_Pixel_to_MUX_wr),
    .data5_in(PE7_Pixel_to_MUX_wr),
    .data6_in(PE8_Pixel_to_MUX_wr),
    .data7_in(PE9_Pixel_to_MUX_wr),
    .data8_in(PE10_Pixel_to_MUX_wr),
    .data9_in(PE11_Pixel_to_MUX_wr),
    .data10_in(PE12_Pixel_to_MUX_wr),
    .data11_in(PE13_Pixel_to_MUX_wr),
    .data12_in(PE14_Pixel_to_MUX_wr),
    .data13_in(PE15_Pixel_to_MUX_wr),
    .data14_in(PE16_Pixel_to_MUX_wr),
    .data15_in(PE17_Pixel_to_MUX_wr),
    .data16_in(PE18_Pixel_to_MUX_wr),
    .data17_in(PE19_Pixel_to_MUX_wr),
    .data18_in(PE20_Pixel_to_MUX_wr),
    .data19_in(PE21_Pixel_to_MUX_wr),
    .data20_in(PE22_Pixel_to_MUX_wr),
    .data21_in(PE23_Pixel_to_MUX_wr),
    .data22_in(PE24_Pixel_to_MUX_wr),
    .data23_in(PE25_Pixel_to_MUX_wr),
    .data24_in(PE26_Pixel_to_MUX_wr),
    .data25_in(PE27_Pixel_to_MUX_wr),
    .data26_in(PE28_Pixel_to_MUX_wr),
    .data27_in(PE29_Pixel_to_MUX_wr),
    .data28_in(PE30_Pixel_to_MUX_wr),
    .data29_in(PE31_Pixel_to_MUX_wr),
    .data30_in(PE32_Pixel_to_MUX_wr),
    .data31_in(PE33_Pixel_to_MUX_wr),
    .data32_in(PE34_Pixel_to_MUX_wr),
    .data33_in(PE35_Pixel_to_MUX_wr),
    .data34_in(PE36_Pixel_to_MUX_wr),
    .data35_in(PE37_Pixel_to_MUX_wr),
    .data36_in(PE38_Pixel_to_MUX_wr),
    .data37_in(PE39_Pixel_to_MUX_wr),
    .data38_in(PE0_Pixel_to_MUX_wr),
    .data39_in(PE1_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE2_Pixel_0_out_wr)
    );


        MUX_40_1 PE3_Pixel_0 (
    .data0_in(PE3_Pixel_to_MUX_wr),
    .data1_in(PE4_Pixel_to_MUX_wr),
    .data2_in(PE5_Pixel_to_MUX_wr),
    .data3_in(PE6_Pixel_to_MUX_wr),
    .data4_in(PE7_Pixel_to_MUX_wr),
    .data5_in(PE8_Pixel_to_MUX_wr),
    .data6_in(PE9_Pixel_to_MUX_wr),
    .data7_in(PE10_Pixel_to_MUX_wr),
    .data8_in(PE11_Pixel_to_MUX_wr),
    .data9_in(PE12_Pixel_to_MUX_wr),
    .data10_in(PE13_Pixel_to_MUX_wr),
    .data11_in(PE14_Pixel_to_MUX_wr),
    .data12_in(PE15_Pixel_to_MUX_wr),
    .data13_in(PE16_Pixel_to_MUX_wr),
    .data14_in(PE17_Pixel_to_MUX_wr),
    .data15_in(PE18_Pixel_to_MUX_wr),
    .data16_in(PE19_Pixel_to_MUX_wr),
    .data17_in(PE20_Pixel_to_MUX_wr),
    .data18_in(PE21_Pixel_to_MUX_wr),
    .data19_in(PE22_Pixel_to_MUX_wr),
    .data20_in(PE23_Pixel_to_MUX_wr),
    .data21_in(PE24_Pixel_to_MUX_wr),
    .data22_in(PE25_Pixel_to_MUX_wr),
    .data23_in(PE26_Pixel_to_MUX_wr),
    .data24_in(PE27_Pixel_to_MUX_wr),
    .data25_in(PE28_Pixel_to_MUX_wr),
    .data26_in(PE29_Pixel_to_MUX_wr),
    .data27_in(PE30_Pixel_to_MUX_wr),
    .data28_in(PE31_Pixel_to_MUX_wr),
    .data29_in(PE32_Pixel_to_MUX_wr),
    .data30_in(PE33_Pixel_to_MUX_wr),
    .data31_in(PE34_Pixel_to_MUX_wr),
    .data32_in(PE35_Pixel_to_MUX_wr),
    .data33_in(PE36_Pixel_to_MUX_wr),
    .data34_in(PE37_Pixel_to_MUX_wr),
    .data35_in(PE38_Pixel_to_MUX_wr),
    .data36_in(PE39_Pixel_to_MUX_wr),
    .data37_in(PE0_Pixel_to_MUX_wr),
    .data38_in(PE1_Pixel_to_MUX_wr),
    .data39_in(PE2_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE3_Pixel_0_out_wr)
    );


        MUX_40_1 PE4_Pixel_0 (
    .data0_in(PE4_Pixel_to_MUX_wr),
    .data1_in(PE5_Pixel_to_MUX_wr),
    .data2_in(PE6_Pixel_to_MUX_wr),
    .data3_in(PE7_Pixel_to_MUX_wr),
    .data4_in(PE8_Pixel_to_MUX_wr),
    .data5_in(PE9_Pixel_to_MUX_wr),
    .data6_in(PE10_Pixel_to_MUX_wr),
    .data7_in(PE11_Pixel_to_MUX_wr),
    .data8_in(PE12_Pixel_to_MUX_wr),
    .data9_in(PE13_Pixel_to_MUX_wr),
    .data10_in(PE14_Pixel_to_MUX_wr),
    .data11_in(PE15_Pixel_to_MUX_wr),
    .data12_in(PE16_Pixel_to_MUX_wr),
    .data13_in(PE17_Pixel_to_MUX_wr),
    .data14_in(PE18_Pixel_to_MUX_wr),
    .data15_in(PE19_Pixel_to_MUX_wr),
    .data16_in(PE20_Pixel_to_MUX_wr),
    .data17_in(PE21_Pixel_to_MUX_wr),
    .data18_in(PE22_Pixel_to_MUX_wr),
    .data19_in(PE23_Pixel_to_MUX_wr),
    .data20_in(PE24_Pixel_to_MUX_wr),
    .data21_in(PE25_Pixel_to_MUX_wr),
    .data22_in(PE26_Pixel_to_MUX_wr),
    .data23_in(PE27_Pixel_to_MUX_wr),
    .data24_in(PE28_Pixel_to_MUX_wr),
    .data25_in(PE29_Pixel_to_MUX_wr),
    .data26_in(PE30_Pixel_to_MUX_wr),
    .data27_in(PE31_Pixel_to_MUX_wr),
    .data28_in(PE32_Pixel_to_MUX_wr),
    .data29_in(PE33_Pixel_to_MUX_wr),
    .data30_in(PE34_Pixel_to_MUX_wr),
    .data31_in(PE35_Pixel_to_MUX_wr),
    .data32_in(PE36_Pixel_to_MUX_wr),
    .data33_in(PE37_Pixel_to_MUX_wr),
    .data34_in(PE38_Pixel_to_MUX_wr),
    .data35_in(PE39_Pixel_to_MUX_wr),
    .data36_in(PE0_Pixel_to_MUX_wr),
    .data37_in(PE1_Pixel_to_MUX_wr),
    .data38_in(PE2_Pixel_to_MUX_wr),
    .data39_in(PE3_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE4_Pixel_0_out_wr)
    );


        MUX_40_1 PE5_Pixel_0 (
    .data0_in(PE5_Pixel_to_MUX_wr),
    .data1_in(PE6_Pixel_to_MUX_wr),
    .data2_in(PE7_Pixel_to_MUX_wr),
    .data3_in(PE8_Pixel_to_MUX_wr),
    .data4_in(PE9_Pixel_to_MUX_wr),
    .data5_in(PE10_Pixel_to_MUX_wr),
    .data6_in(PE11_Pixel_to_MUX_wr),
    .data7_in(PE12_Pixel_to_MUX_wr),
    .data8_in(PE13_Pixel_to_MUX_wr),
    .data9_in(PE14_Pixel_to_MUX_wr),
    .data10_in(PE15_Pixel_to_MUX_wr),
    .data11_in(PE16_Pixel_to_MUX_wr),
    .data12_in(PE17_Pixel_to_MUX_wr),
    .data13_in(PE18_Pixel_to_MUX_wr),
    .data14_in(PE19_Pixel_to_MUX_wr),
    .data15_in(PE20_Pixel_to_MUX_wr),
    .data16_in(PE21_Pixel_to_MUX_wr),
    .data17_in(PE22_Pixel_to_MUX_wr),
    .data18_in(PE23_Pixel_to_MUX_wr),
    .data19_in(PE24_Pixel_to_MUX_wr),
    .data20_in(PE25_Pixel_to_MUX_wr),
    .data21_in(PE26_Pixel_to_MUX_wr),
    .data22_in(PE27_Pixel_to_MUX_wr),
    .data23_in(PE28_Pixel_to_MUX_wr),
    .data24_in(PE29_Pixel_to_MUX_wr),
    .data25_in(PE30_Pixel_to_MUX_wr),
    .data26_in(PE31_Pixel_to_MUX_wr),
    .data27_in(PE32_Pixel_to_MUX_wr),
    .data28_in(PE33_Pixel_to_MUX_wr),
    .data29_in(PE34_Pixel_to_MUX_wr),
    .data30_in(PE35_Pixel_to_MUX_wr),
    .data31_in(PE36_Pixel_to_MUX_wr),
    .data32_in(PE37_Pixel_to_MUX_wr),
    .data33_in(PE38_Pixel_to_MUX_wr),
    .data34_in(PE39_Pixel_to_MUX_wr),
    .data35_in(PE0_Pixel_to_MUX_wr),
    .data36_in(PE1_Pixel_to_MUX_wr),
    .data37_in(PE2_Pixel_to_MUX_wr),
    .data38_in(PE3_Pixel_to_MUX_wr),
    .data39_in(PE4_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE5_Pixel_0_out_wr)
    );


        MUX_40_1 PE6_Pixel_0 (
    .data0_in(PE6_Pixel_to_MUX_wr),
    .data1_in(PE7_Pixel_to_MUX_wr),
    .data2_in(PE8_Pixel_to_MUX_wr),
    .data3_in(PE9_Pixel_to_MUX_wr),
    .data4_in(PE10_Pixel_to_MUX_wr),
    .data5_in(PE11_Pixel_to_MUX_wr),
    .data6_in(PE12_Pixel_to_MUX_wr),
    .data7_in(PE13_Pixel_to_MUX_wr),
    .data8_in(PE14_Pixel_to_MUX_wr),
    .data9_in(PE15_Pixel_to_MUX_wr),
    .data10_in(PE16_Pixel_to_MUX_wr),
    .data11_in(PE17_Pixel_to_MUX_wr),
    .data12_in(PE18_Pixel_to_MUX_wr),
    .data13_in(PE19_Pixel_to_MUX_wr),
    .data14_in(PE20_Pixel_to_MUX_wr),
    .data15_in(PE21_Pixel_to_MUX_wr),
    .data16_in(PE22_Pixel_to_MUX_wr),
    .data17_in(PE23_Pixel_to_MUX_wr),
    .data18_in(PE24_Pixel_to_MUX_wr),
    .data19_in(PE25_Pixel_to_MUX_wr),
    .data20_in(PE26_Pixel_to_MUX_wr),
    .data21_in(PE27_Pixel_to_MUX_wr),
    .data22_in(PE28_Pixel_to_MUX_wr),
    .data23_in(PE29_Pixel_to_MUX_wr),
    .data24_in(PE30_Pixel_to_MUX_wr),
    .data25_in(PE31_Pixel_to_MUX_wr),
    .data26_in(PE32_Pixel_to_MUX_wr),
    .data27_in(PE33_Pixel_to_MUX_wr),
    .data28_in(PE34_Pixel_to_MUX_wr),
    .data29_in(PE35_Pixel_to_MUX_wr),
    .data30_in(PE36_Pixel_to_MUX_wr),
    .data31_in(PE37_Pixel_to_MUX_wr),
    .data32_in(PE38_Pixel_to_MUX_wr),
    .data33_in(PE39_Pixel_to_MUX_wr),
    .data34_in(PE0_Pixel_to_MUX_wr),
    .data35_in(PE1_Pixel_to_MUX_wr),
    .data36_in(PE2_Pixel_to_MUX_wr),
    .data37_in(PE3_Pixel_to_MUX_wr),
    .data38_in(PE4_Pixel_to_MUX_wr),
    .data39_in(PE5_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE6_Pixel_0_out_wr)
    );


        MUX_40_1 PE7_Pixel_0 (
    .data0_in(PE7_Pixel_to_MUX_wr),
    .data1_in(PE8_Pixel_to_MUX_wr),
    .data2_in(PE9_Pixel_to_MUX_wr),
    .data3_in(PE10_Pixel_to_MUX_wr),
    .data4_in(PE11_Pixel_to_MUX_wr),
    .data5_in(PE12_Pixel_to_MUX_wr),
    .data6_in(PE13_Pixel_to_MUX_wr),
    .data7_in(PE14_Pixel_to_MUX_wr),
    .data8_in(PE15_Pixel_to_MUX_wr),
    .data9_in(PE16_Pixel_to_MUX_wr),
    .data10_in(PE17_Pixel_to_MUX_wr),
    .data11_in(PE18_Pixel_to_MUX_wr),
    .data12_in(PE19_Pixel_to_MUX_wr),
    .data13_in(PE20_Pixel_to_MUX_wr),
    .data14_in(PE21_Pixel_to_MUX_wr),
    .data15_in(PE22_Pixel_to_MUX_wr),
    .data16_in(PE23_Pixel_to_MUX_wr),
    .data17_in(PE24_Pixel_to_MUX_wr),
    .data18_in(PE25_Pixel_to_MUX_wr),
    .data19_in(PE26_Pixel_to_MUX_wr),
    .data20_in(PE27_Pixel_to_MUX_wr),
    .data21_in(PE28_Pixel_to_MUX_wr),
    .data22_in(PE29_Pixel_to_MUX_wr),
    .data23_in(PE30_Pixel_to_MUX_wr),
    .data24_in(PE31_Pixel_to_MUX_wr),
    .data25_in(PE32_Pixel_to_MUX_wr),
    .data26_in(PE33_Pixel_to_MUX_wr),
    .data27_in(PE34_Pixel_to_MUX_wr),
    .data28_in(PE35_Pixel_to_MUX_wr),
    .data29_in(PE36_Pixel_to_MUX_wr),
    .data30_in(PE37_Pixel_to_MUX_wr),
    .data31_in(PE38_Pixel_to_MUX_wr),
    .data32_in(PE39_Pixel_to_MUX_wr),
    .data33_in(PE0_Pixel_to_MUX_wr),
    .data34_in(PE1_Pixel_to_MUX_wr),
    .data35_in(PE2_Pixel_to_MUX_wr),
    .data36_in(PE3_Pixel_to_MUX_wr),
    .data37_in(PE4_Pixel_to_MUX_wr),
    .data38_in(PE5_Pixel_to_MUX_wr),
    .data39_in(PE6_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE7_Pixel_0_out_wr)
    );


        MUX_40_1 PE8_Pixel_0 (
    .data0_in(PE8_Pixel_to_MUX_wr),
    .data1_in(PE9_Pixel_to_MUX_wr),
    .data2_in(PE10_Pixel_to_MUX_wr),
    .data3_in(PE11_Pixel_to_MUX_wr),
    .data4_in(PE12_Pixel_to_MUX_wr),
    .data5_in(PE13_Pixel_to_MUX_wr),
    .data6_in(PE14_Pixel_to_MUX_wr),
    .data7_in(PE15_Pixel_to_MUX_wr),
    .data8_in(PE16_Pixel_to_MUX_wr),
    .data9_in(PE17_Pixel_to_MUX_wr),
    .data10_in(PE18_Pixel_to_MUX_wr),
    .data11_in(PE19_Pixel_to_MUX_wr),
    .data12_in(PE20_Pixel_to_MUX_wr),
    .data13_in(PE21_Pixel_to_MUX_wr),
    .data14_in(PE22_Pixel_to_MUX_wr),
    .data15_in(PE23_Pixel_to_MUX_wr),
    .data16_in(PE24_Pixel_to_MUX_wr),
    .data17_in(PE25_Pixel_to_MUX_wr),
    .data18_in(PE26_Pixel_to_MUX_wr),
    .data19_in(PE27_Pixel_to_MUX_wr),
    .data20_in(PE28_Pixel_to_MUX_wr),
    .data21_in(PE29_Pixel_to_MUX_wr),
    .data22_in(PE30_Pixel_to_MUX_wr),
    .data23_in(PE31_Pixel_to_MUX_wr),
    .data24_in(PE32_Pixel_to_MUX_wr),
    .data25_in(PE33_Pixel_to_MUX_wr),
    .data26_in(PE34_Pixel_to_MUX_wr),
    .data27_in(PE35_Pixel_to_MUX_wr),
    .data28_in(PE36_Pixel_to_MUX_wr),
    .data29_in(PE37_Pixel_to_MUX_wr),
    .data30_in(PE38_Pixel_to_MUX_wr),
    .data31_in(PE39_Pixel_to_MUX_wr),
    .data32_in(PE0_Pixel_to_MUX_wr),
    .data33_in(PE1_Pixel_to_MUX_wr),
    .data34_in(PE2_Pixel_to_MUX_wr),
    .data35_in(PE3_Pixel_to_MUX_wr),
    .data36_in(PE4_Pixel_to_MUX_wr),
    .data37_in(PE5_Pixel_to_MUX_wr),
    .data38_in(PE6_Pixel_to_MUX_wr),
    .data39_in(PE7_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE8_Pixel_0_out_wr)
    );


        MUX_40_1 PE9_Pixel_0 (
    .data0_in(PE9_Pixel_to_MUX_wr),
    .data1_in(PE10_Pixel_to_MUX_wr),
    .data2_in(PE11_Pixel_to_MUX_wr),
    .data3_in(PE12_Pixel_to_MUX_wr),
    .data4_in(PE13_Pixel_to_MUX_wr),
    .data5_in(PE14_Pixel_to_MUX_wr),
    .data6_in(PE15_Pixel_to_MUX_wr),
    .data7_in(PE16_Pixel_to_MUX_wr),
    .data8_in(PE17_Pixel_to_MUX_wr),
    .data9_in(PE18_Pixel_to_MUX_wr),
    .data10_in(PE19_Pixel_to_MUX_wr),
    .data11_in(PE20_Pixel_to_MUX_wr),
    .data12_in(PE21_Pixel_to_MUX_wr),
    .data13_in(PE22_Pixel_to_MUX_wr),
    .data14_in(PE23_Pixel_to_MUX_wr),
    .data15_in(PE24_Pixel_to_MUX_wr),
    .data16_in(PE25_Pixel_to_MUX_wr),
    .data17_in(PE26_Pixel_to_MUX_wr),
    .data18_in(PE27_Pixel_to_MUX_wr),
    .data19_in(PE28_Pixel_to_MUX_wr),
    .data20_in(PE29_Pixel_to_MUX_wr),
    .data21_in(PE30_Pixel_to_MUX_wr),
    .data22_in(PE31_Pixel_to_MUX_wr),
    .data23_in(PE32_Pixel_to_MUX_wr),
    .data24_in(PE33_Pixel_to_MUX_wr),
    .data25_in(PE34_Pixel_to_MUX_wr),
    .data26_in(PE35_Pixel_to_MUX_wr),
    .data27_in(PE36_Pixel_to_MUX_wr),
    .data28_in(PE37_Pixel_to_MUX_wr),
    .data29_in(PE38_Pixel_to_MUX_wr),
    .data30_in(PE39_Pixel_to_MUX_wr),
    .data31_in(PE0_Pixel_to_MUX_wr),
    .data32_in(PE1_Pixel_to_MUX_wr),
    .data33_in(PE2_Pixel_to_MUX_wr),
    .data34_in(PE3_Pixel_to_MUX_wr),
    .data35_in(PE4_Pixel_to_MUX_wr),
    .data36_in(PE5_Pixel_to_MUX_wr),
    .data37_in(PE6_Pixel_to_MUX_wr),
    .data38_in(PE7_Pixel_to_MUX_wr),
    .data39_in(PE8_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE9_Pixel_0_out_wr)
    );


        MUX_40_1 PE10_Pixel_0 (
    .data0_in(PE10_Pixel_to_MUX_wr),
    .data1_in(PE11_Pixel_to_MUX_wr),
    .data2_in(PE12_Pixel_to_MUX_wr),
    .data3_in(PE13_Pixel_to_MUX_wr),
    .data4_in(PE14_Pixel_to_MUX_wr),
    .data5_in(PE15_Pixel_to_MUX_wr),
    .data6_in(PE16_Pixel_to_MUX_wr),
    .data7_in(PE17_Pixel_to_MUX_wr),
    .data8_in(PE18_Pixel_to_MUX_wr),
    .data9_in(PE19_Pixel_to_MUX_wr),
    .data10_in(PE20_Pixel_to_MUX_wr),
    .data11_in(PE21_Pixel_to_MUX_wr),
    .data12_in(PE22_Pixel_to_MUX_wr),
    .data13_in(PE23_Pixel_to_MUX_wr),
    .data14_in(PE24_Pixel_to_MUX_wr),
    .data15_in(PE25_Pixel_to_MUX_wr),
    .data16_in(PE26_Pixel_to_MUX_wr),
    .data17_in(PE27_Pixel_to_MUX_wr),
    .data18_in(PE28_Pixel_to_MUX_wr),
    .data19_in(PE29_Pixel_to_MUX_wr),
    .data20_in(PE30_Pixel_to_MUX_wr),
    .data21_in(PE31_Pixel_to_MUX_wr),
    .data22_in(PE32_Pixel_to_MUX_wr),
    .data23_in(PE33_Pixel_to_MUX_wr),
    .data24_in(PE34_Pixel_to_MUX_wr),
    .data25_in(PE35_Pixel_to_MUX_wr),
    .data26_in(PE36_Pixel_to_MUX_wr),
    .data27_in(PE37_Pixel_to_MUX_wr),
    .data28_in(PE38_Pixel_to_MUX_wr),
    .data29_in(PE39_Pixel_to_MUX_wr),
    .data30_in(PE0_Pixel_to_MUX_wr),
    .data31_in(PE1_Pixel_to_MUX_wr),
    .data32_in(PE2_Pixel_to_MUX_wr),
    .data33_in(PE3_Pixel_to_MUX_wr),
    .data34_in(PE4_Pixel_to_MUX_wr),
    .data35_in(PE5_Pixel_to_MUX_wr),
    .data36_in(PE6_Pixel_to_MUX_wr),
    .data37_in(PE7_Pixel_to_MUX_wr),
    .data38_in(PE8_Pixel_to_MUX_wr),
    .data39_in(PE9_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE10_Pixel_0_out_wr)
    );


        MUX_40_1 PE11_Pixel_0 (
    .data0_in(PE11_Pixel_to_MUX_wr),
    .data1_in(PE12_Pixel_to_MUX_wr),
    .data2_in(PE13_Pixel_to_MUX_wr),
    .data3_in(PE14_Pixel_to_MUX_wr),
    .data4_in(PE15_Pixel_to_MUX_wr),
    .data5_in(PE16_Pixel_to_MUX_wr),
    .data6_in(PE17_Pixel_to_MUX_wr),
    .data7_in(PE18_Pixel_to_MUX_wr),
    .data8_in(PE19_Pixel_to_MUX_wr),
    .data9_in(PE20_Pixel_to_MUX_wr),
    .data10_in(PE21_Pixel_to_MUX_wr),
    .data11_in(PE22_Pixel_to_MUX_wr),
    .data12_in(PE23_Pixel_to_MUX_wr),
    .data13_in(PE24_Pixel_to_MUX_wr),
    .data14_in(PE25_Pixel_to_MUX_wr),
    .data15_in(PE26_Pixel_to_MUX_wr),
    .data16_in(PE27_Pixel_to_MUX_wr),
    .data17_in(PE28_Pixel_to_MUX_wr),
    .data18_in(PE29_Pixel_to_MUX_wr),
    .data19_in(PE30_Pixel_to_MUX_wr),
    .data20_in(PE31_Pixel_to_MUX_wr),
    .data21_in(PE32_Pixel_to_MUX_wr),
    .data22_in(PE33_Pixel_to_MUX_wr),
    .data23_in(PE34_Pixel_to_MUX_wr),
    .data24_in(PE35_Pixel_to_MUX_wr),
    .data25_in(PE36_Pixel_to_MUX_wr),
    .data26_in(PE37_Pixel_to_MUX_wr),
    .data27_in(PE38_Pixel_to_MUX_wr),
    .data28_in(PE39_Pixel_to_MUX_wr),
    .data29_in(PE0_Pixel_to_MUX_wr),
    .data30_in(PE1_Pixel_to_MUX_wr),
    .data31_in(PE2_Pixel_to_MUX_wr),
    .data32_in(PE3_Pixel_to_MUX_wr),
    .data33_in(PE4_Pixel_to_MUX_wr),
    .data34_in(PE5_Pixel_to_MUX_wr),
    .data35_in(PE6_Pixel_to_MUX_wr),
    .data36_in(PE7_Pixel_to_MUX_wr),
    .data37_in(PE8_Pixel_to_MUX_wr),
    .data38_in(PE9_Pixel_to_MUX_wr),
    .data39_in(PE10_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE11_Pixel_0_out_wr)
    );


        MUX_40_1 PE12_Pixel_0 (
    .data0_in(PE12_Pixel_to_MUX_wr),
    .data1_in(PE13_Pixel_to_MUX_wr),
    .data2_in(PE14_Pixel_to_MUX_wr),
    .data3_in(PE15_Pixel_to_MUX_wr),
    .data4_in(PE16_Pixel_to_MUX_wr),
    .data5_in(PE17_Pixel_to_MUX_wr),
    .data6_in(PE18_Pixel_to_MUX_wr),
    .data7_in(PE19_Pixel_to_MUX_wr),
    .data8_in(PE20_Pixel_to_MUX_wr),
    .data9_in(PE21_Pixel_to_MUX_wr),
    .data10_in(PE22_Pixel_to_MUX_wr),
    .data11_in(PE23_Pixel_to_MUX_wr),
    .data12_in(PE24_Pixel_to_MUX_wr),
    .data13_in(PE25_Pixel_to_MUX_wr),
    .data14_in(PE26_Pixel_to_MUX_wr),
    .data15_in(PE27_Pixel_to_MUX_wr),
    .data16_in(PE28_Pixel_to_MUX_wr),
    .data17_in(PE29_Pixel_to_MUX_wr),
    .data18_in(PE30_Pixel_to_MUX_wr),
    .data19_in(PE31_Pixel_to_MUX_wr),
    .data20_in(PE32_Pixel_to_MUX_wr),
    .data21_in(PE33_Pixel_to_MUX_wr),
    .data22_in(PE34_Pixel_to_MUX_wr),
    .data23_in(PE35_Pixel_to_MUX_wr),
    .data24_in(PE36_Pixel_to_MUX_wr),
    .data25_in(PE37_Pixel_to_MUX_wr),
    .data26_in(PE38_Pixel_to_MUX_wr),
    .data27_in(PE39_Pixel_to_MUX_wr),
    .data28_in(PE0_Pixel_to_MUX_wr),
    .data29_in(PE1_Pixel_to_MUX_wr),
    .data30_in(PE2_Pixel_to_MUX_wr),
    .data31_in(PE3_Pixel_to_MUX_wr),
    .data32_in(PE4_Pixel_to_MUX_wr),
    .data33_in(PE5_Pixel_to_MUX_wr),
    .data34_in(PE6_Pixel_to_MUX_wr),
    .data35_in(PE7_Pixel_to_MUX_wr),
    .data36_in(PE8_Pixel_to_MUX_wr),
    .data37_in(PE9_Pixel_to_MUX_wr),
    .data38_in(PE10_Pixel_to_MUX_wr),
    .data39_in(PE11_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE12_Pixel_0_out_wr)
    );


        MUX_40_1 PE13_Pixel_0 (
    .data0_in(PE13_Pixel_to_MUX_wr),
    .data1_in(PE14_Pixel_to_MUX_wr),
    .data2_in(PE15_Pixel_to_MUX_wr),
    .data3_in(PE16_Pixel_to_MUX_wr),
    .data4_in(PE17_Pixel_to_MUX_wr),
    .data5_in(PE18_Pixel_to_MUX_wr),
    .data6_in(PE19_Pixel_to_MUX_wr),
    .data7_in(PE20_Pixel_to_MUX_wr),
    .data8_in(PE21_Pixel_to_MUX_wr),
    .data9_in(PE22_Pixel_to_MUX_wr),
    .data10_in(PE23_Pixel_to_MUX_wr),
    .data11_in(PE24_Pixel_to_MUX_wr),
    .data12_in(PE25_Pixel_to_MUX_wr),
    .data13_in(PE26_Pixel_to_MUX_wr),
    .data14_in(PE27_Pixel_to_MUX_wr),
    .data15_in(PE28_Pixel_to_MUX_wr),
    .data16_in(PE29_Pixel_to_MUX_wr),
    .data17_in(PE30_Pixel_to_MUX_wr),
    .data18_in(PE31_Pixel_to_MUX_wr),
    .data19_in(PE32_Pixel_to_MUX_wr),
    .data20_in(PE33_Pixel_to_MUX_wr),
    .data21_in(PE34_Pixel_to_MUX_wr),
    .data22_in(PE35_Pixel_to_MUX_wr),
    .data23_in(PE36_Pixel_to_MUX_wr),
    .data24_in(PE37_Pixel_to_MUX_wr),
    .data25_in(PE38_Pixel_to_MUX_wr),
    .data26_in(PE39_Pixel_to_MUX_wr),
    .data27_in(PE0_Pixel_to_MUX_wr),
    .data28_in(PE1_Pixel_to_MUX_wr),
    .data29_in(PE2_Pixel_to_MUX_wr),
    .data30_in(PE3_Pixel_to_MUX_wr),
    .data31_in(PE4_Pixel_to_MUX_wr),
    .data32_in(PE5_Pixel_to_MUX_wr),
    .data33_in(PE6_Pixel_to_MUX_wr),
    .data34_in(PE7_Pixel_to_MUX_wr),
    .data35_in(PE8_Pixel_to_MUX_wr),
    .data36_in(PE9_Pixel_to_MUX_wr),
    .data37_in(PE10_Pixel_to_MUX_wr),
    .data38_in(PE11_Pixel_to_MUX_wr),
    .data39_in(PE12_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE13_Pixel_0_out_wr)
    );


        MUX_40_1 PE14_Pixel_0 (
    .data0_in(PE14_Pixel_to_MUX_wr),
    .data1_in(PE15_Pixel_to_MUX_wr),
    .data2_in(PE16_Pixel_to_MUX_wr),
    .data3_in(PE17_Pixel_to_MUX_wr),
    .data4_in(PE18_Pixel_to_MUX_wr),
    .data5_in(PE19_Pixel_to_MUX_wr),
    .data6_in(PE20_Pixel_to_MUX_wr),
    .data7_in(PE21_Pixel_to_MUX_wr),
    .data8_in(PE22_Pixel_to_MUX_wr),
    .data9_in(PE23_Pixel_to_MUX_wr),
    .data10_in(PE24_Pixel_to_MUX_wr),
    .data11_in(PE25_Pixel_to_MUX_wr),
    .data12_in(PE26_Pixel_to_MUX_wr),
    .data13_in(PE27_Pixel_to_MUX_wr),
    .data14_in(PE28_Pixel_to_MUX_wr),
    .data15_in(PE29_Pixel_to_MUX_wr),
    .data16_in(PE30_Pixel_to_MUX_wr),
    .data17_in(PE31_Pixel_to_MUX_wr),
    .data18_in(PE32_Pixel_to_MUX_wr),
    .data19_in(PE33_Pixel_to_MUX_wr),
    .data20_in(PE34_Pixel_to_MUX_wr),
    .data21_in(PE35_Pixel_to_MUX_wr),
    .data22_in(PE36_Pixel_to_MUX_wr),
    .data23_in(PE37_Pixel_to_MUX_wr),
    .data24_in(PE38_Pixel_to_MUX_wr),
    .data25_in(PE39_Pixel_to_MUX_wr),
    .data26_in(PE0_Pixel_to_MUX_wr),
    .data27_in(PE1_Pixel_to_MUX_wr),
    .data28_in(PE2_Pixel_to_MUX_wr),
    .data29_in(PE3_Pixel_to_MUX_wr),
    .data30_in(PE4_Pixel_to_MUX_wr),
    .data31_in(PE5_Pixel_to_MUX_wr),
    .data32_in(PE6_Pixel_to_MUX_wr),
    .data33_in(PE7_Pixel_to_MUX_wr),
    .data34_in(PE8_Pixel_to_MUX_wr),
    .data35_in(PE9_Pixel_to_MUX_wr),
    .data36_in(PE10_Pixel_to_MUX_wr),
    .data37_in(PE11_Pixel_to_MUX_wr),
    .data38_in(PE12_Pixel_to_MUX_wr),
    .data39_in(PE13_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE14_Pixel_0_out_wr)
    );


        MUX_40_1 PE15_Pixel_0 (
    .data0_in(PE15_Pixel_to_MUX_wr),
    .data1_in(PE16_Pixel_to_MUX_wr),
    .data2_in(PE17_Pixel_to_MUX_wr),
    .data3_in(PE18_Pixel_to_MUX_wr),
    .data4_in(PE19_Pixel_to_MUX_wr),
    .data5_in(PE20_Pixel_to_MUX_wr),
    .data6_in(PE21_Pixel_to_MUX_wr),
    .data7_in(PE22_Pixel_to_MUX_wr),
    .data8_in(PE23_Pixel_to_MUX_wr),
    .data9_in(PE24_Pixel_to_MUX_wr),
    .data10_in(PE25_Pixel_to_MUX_wr),
    .data11_in(PE26_Pixel_to_MUX_wr),
    .data12_in(PE27_Pixel_to_MUX_wr),
    .data13_in(PE28_Pixel_to_MUX_wr),
    .data14_in(PE29_Pixel_to_MUX_wr),
    .data15_in(PE30_Pixel_to_MUX_wr),
    .data16_in(PE31_Pixel_to_MUX_wr),
    .data17_in(PE32_Pixel_to_MUX_wr),
    .data18_in(PE33_Pixel_to_MUX_wr),
    .data19_in(PE34_Pixel_to_MUX_wr),
    .data20_in(PE35_Pixel_to_MUX_wr),
    .data21_in(PE36_Pixel_to_MUX_wr),
    .data22_in(PE37_Pixel_to_MUX_wr),
    .data23_in(PE38_Pixel_to_MUX_wr),
    .data24_in(PE39_Pixel_to_MUX_wr),
    .data25_in(PE0_Pixel_to_MUX_wr),
    .data26_in(PE1_Pixel_to_MUX_wr),
    .data27_in(PE2_Pixel_to_MUX_wr),
    .data28_in(PE3_Pixel_to_MUX_wr),
    .data29_in(PE4_Pixel_to_MUX_wr),
    .data30_in(PE5_Pixel_to_MUX_wr),
    .data31_in(PE6_Pixel_to_MUX_wr),
    .data32_in(PE7_Pixel_to_MUX_wr),
    .data33_in(PE8_Pixel_to_MUX_wr),
    .data34_in(PE9_Pixel_to_MUX_wr),
    .data35_in(PE10_Pixel_to_MUX_wr),
    .data36_in(PE11_Pixel_to_MUX_wr),
    .data37_in(PE12_Pixel_to_MUX_wr),
    .data38_in(PE13_Pixel_to_MUX_wr),
    .data39_in(PE14_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE15_Pixel_0_out_wr)
    );


        MUX_40_1 PE16_Pixel_0 (
    .data0_in(PE16_Pixel_to_MUX_wr),
    .data1_in(PE17_Pixel_to_MUX_wr),
    .data2_in(PE18_Pixel_to_MUX_wr),
    .data3_in(PE19_Pixel_to_MUX_wr),
    .data4_in(PE20_Pixel_to_MUX_wr),
    .data5_in(PE21_Pixel_to_MUX_wr),
    .data6_in(PE22_Pixel_to_MUX_wr),
    .data7_in(PE23_Pixel_to_MUX_wr),
    .data8_in(PE24_Pixel_to_MUX_wr),
    .data9_in(PE25_Pixel_to_MUX_wr),
    .data10_in(PE26_Pixel_to_MUX_wr),
    .data11_in(PE27_Pixel_to_MUX_wr),
    .data12_in(PE28_Pixel_to_MUX_wr),
    .data13_in(PE29_Pixel_to_MUX_wr),
    .data14_in(PE30_Pixel_to_MUX_wr),
    .data15_in(PE31_Pixel_to_MUX_wr),
    .data16_in(PE32_Pixel_to_MUX_wr),
    .data17_in(PE33_Pixel_to_MUX_wr),
    .data18_in(PE34_Pixel_to_MUX_wr),
    .data19_in(PE35_Pixel_to_MUX_wr),
    .data20_in(PE36_Pixel_to_MUX_wr),
    .data21_in(PE37_Pixel_to_MUX_wr),
    .data22_in(PE38_Pixel_to_MUX_wr),
    .data23_in(PE39_Pixel_to_MUX_wr),
    .data24_in(PE0_Pixel_to_MUX_wr),
    .data25_in(PE1_Pixel_to_MUX_wr),
    .data26_in(PE2_Pixel_to_MUX_wr),
    .data27_in(PE3_Pixel_to_MUX_wr),
    .data28_in(PE4_Pixel_to_MUX_wr),
    .data29_in(PE5_Pixel_to_MUX_wr),
    .data30_in(PE6_Pixel_to_MUX_wr),
    .data31_in(PE7_Pixel_to_MUX_wr),
    .data32_in(PE8_Pixel_to_MUX_wr),
    .data33_in(PE9_Pixel_to_MUX_wr),
    .data34_in(PE10_Pixel_to_MUX_wr),
    .data35_in(PE11_Pixel_to_MUX_wr),
    .data36_in(PE12_Pixel_to_MUX_wr),
    .data37_in(PE13_Pixel_to_MUX_wr),
    .data38_in(PE14_Pixel_to_MUX_wr),
    .data39_in(PE15_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE16_Pixel_0_out_wr)
    );


        MUX_40_1 PE17_Pixel_0 (
    .data0_in(PE17_Pixel_to_MUX_wr),
    .data1_in(PE18_Pixel_to_MUX_wr),
    .data2_in(PE19_Pixel_to_MUX_wr),
    .data3_in(PE20_Pixel_to_MUX_wr),
    .data4_in(PE21_Pixel_to_MUX_wr),
    .data5_in(PE22_Pixel_to_MUX_wr),
    .data6_in(PE23_Pixel_to_MUX_wr),
    .data7_in(PE24_Pixel_to_MUX_wr),
    .data8_in(PE25_Pixel_to_MUX_wr),
    .data9_in(PE26_Pixel_to_MUX_wr),
    .data10_in(PE27_Pixel_to_MUX_wr),
    .data11_in(PE28_Pixel_to_MUX_wr),
    .data12_in(PE29_Pixel_to_MUX_wr),
    .data13_in(PE30_Pixel_to_MUX_wr),
    .data14_in(PE31_Pixel_to_MUX_wr),
    .data15_in(PE32_Pixel_to_MUX_wr),
    .data16_in(PE33_Pixel_to_MUX_wr),
    .data17_in(PE34_Pixel_to_MUX_wr),
    .data18_in(PE35_Pixel_to_MUX_wr),
    .data19_in(PE36_Pixel_to_MUX_wr),
    .data20_in(PE37_Pixel_to_MUX_wr),
    .data21_in(PE38_Pixel_to_MUX_wr),
    .data22_in(PE39_Pixel_to_MUX_wr),
    .data23_in(PE0_Pixel_to_MUX_wr),
    .data24_in(PE1_Pixel_to_MUX_wr),
    .data25_in(PE2_Pixel_to_MUX_wr),
    .data26_in(PE3_Pixel_to_MUX_wr),
    .data27_in(PE4_Pixel_to_MUX_wr),
    .data28_in(PE5_Pixel_to_MUX_wr),
    .data29_in(PE6_Pixel_to_MUX_wr),
    .data30_in(PE7_Pixel_to_MUX_wr),
    .data31_in(PE8_Pixel_to_MUX_wr),
    .data32_in(PE9_Pixel_to_MUX_wr),
    .data33_in(PE10_Pixel_to_MUX_wr),
    .data34_in(PE11_Pixel_to_MUX_wr),
    .data35_in(PE12_Pixel_to_MUX_wr),
    .data36_in(PE13_Pixel_to_MUX_wr),
    .data37_in(PE14_Pixel_to_MUX_wr),
    .data38_in(PE15_Pixel_to_MUX_wr),
    .data39_in(PE16_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE17_Pixel_0_out_wr)
    );


        MUX_40_1 PE18_Pixel_0 (
    .data0_in(PE18_Pixel_to_MUX_wr),
    .data1_in(PE19_Pixel_to_MUX_wr),
    .data2_in(PE20_Pixel_to_MUX_wr),
    .data3_in(PE21_Pixel_to_MUX_wr),
    .data4_in(PE22_Pixel_to_MUX_wr),
    .data5_in(PE23_Pixel_to_MUX_wr),
    .data6_in(PE24_Pixel_to_MUX_wr),
    .data7_in(PE25_Pixel_to_MUX_wr),
    .data8_in(PE26_Pixel_to_MUX_wr),
    .data9_in(PE27_Pixel_to_MUX_wr),
    .data10_in(PE28_Pixel_to_MUX_wr),
    .data11_in(PE29_Pixel_to_MUX_wr),
    .data12_in(PE30_Pixel_to_MUX_wr),
    .data13_in(PE31_Pixel_to_MUX_wr),
    .data14_in(PE32_Pixel_to_MUX_wr),
    .data15_in(PE33_Pixel_to_MUX_wr),
    .data16_in(PE34_Pixel_to_MUX_wr),
    .data17_in(PE35_Pixel_to_MUX_wr),
    .data18_in(PE36_Pixel_to_MUX_wr),
    .data19_in(PE37_Pixel_to_MUX_wr),
    .data20_in(PE38_Pixel_to_MUX_wr),
    .data21_in(PE39_Pixel_to_MUX_wr),
    .data22_in(PE0_Pixel_to_MUX_wr),
    .data23_in(PE1_Pixel_to_MUX_wr),
    .data24_in(PE2_Pixel_to_MUX_wr),
    .data25_in(PE3_Pixel_to_MUX_wr),
    .data26_in(PE4_Pixel_to_MUX_wr),
    .data27_in(PE5_Pixel_to_MUX_wr),
    .data28_in(PE6_Pixel_to_MUX_wr),
    .data29_in(PE7_Pixel_to_MUX_wr),
    .data30_in(PE8_Pixel_to_MUX_wr),
    .data31_in(PE9_Pixel_to_MUX_wr),
    .data32_in(PE10_Pixel_to_MUX_wr),
    .data33_in(PE11_Pixel_to_MUX_wr),
    .data34_in(PE12_Pixel_to_MUX_wr),
    .data35_in(PE13_Pixel_to_MUX_wr),
    .data36_in(PE14_Pixel_to_MUX_wr),
    .data37_in(PE15_Pixel_to_MUX_wr),
    .data38_in(PE16_Pixel_to_MUX_wr),
    .data39_in(PE17_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE18_Pixel_0_out_wr)
    );


        MUX_40_1 PE19_Pixel_0 (
    .data0_in(PE19_Pixel_to_MUX_wr),
    .data1_in(PE20_Pixel_to_MUX_wr),
    .data2_in(PE21_Pixel_to_MUX_wr),
    .data3_in(PE22_Pixel_to_MUX_wr),
    .data4_in(PE23_Pixel_to_MUX_wr),
    .data5_in(PE24_Pixel_to_MUX_wr),
    .data6_in(PE25_Pixel_to_MUX_wr),
    .data7_in(PE26_Pixel_to_MUX_wr),
    .data8_in(PE27_Pixel_to_MUX_wr),
    .data9_in(PE28_Pixel_to_MUX_wr),
    .data10_in(PE29_Pixel_to_MUX_wr),
    .data11_in(PE30_Pixel_to_MUX_wr),
    .data12_in(PE31_Pixel_to_MUX_wr),
    .data13_in(PE32_Pixel_to_MUX_wr),
    .data14_in(PE33_Pixel_to_MUX_wr),
    .data15_in(PE34_Pixel_to_MUX_wr),
    .data16_in(PE35_Pixel_to_MUX_wr),
    .data17_in(PE36_Pixel_to_MUX_wr),
    .data18_in(PE37_Pixel_to_MUX_wr),
    .data19_in(PE38_Pixel_to_MUX_wr),
    .data20_in(PE39_Pixel_to_MUX_wr),
    .data21_in(PE0_Pixel_to_MUX_wr),
    .data22_in(PE1_Pixel_to_MUX_wr),
    .data23_in(PE2_Pixel_to_MUX_wr),
    .data24_in(PE3_Pixel_to_MUX_wr),
    .data25_in(PE4_Pixel_to_MUX_wr),
    .data26_in(PE5_Pixel_to_MUX_wr),
    .data27_in(PE6_Pixel_to_MUX_wr),
    .data28_in(PE7_Pixel_to_MUX_wr),
    .data29_in(PE8_Pixel_to_MUX_wr),
    .data30_in(PE9_Pixel_to_MUX_wr),
    .data31_in(PE10_Pixel_to_MUX_wr),
    .data32_in(PE11_Pixel_to_MUX_wr),
    .data33_in(PE12_Pixel_to_MUX_wr),
    .data34_in(PE13_Pixel_to_MUX_wr),
    .data35_in(PE14_Pixel_to_MUX_wr),
    .data36_in(PE15_Pixel_to_MUX_wr),
    .data37_in(PE16_Pixel_to_MUX_wr),
    .data38_in(PE17_Pixel_to_MUX_wr),
    .data39_in(PE18_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE19_Pixel_0_out_wr)
    );


        MUX_40_1 PE20_Pixel_0 (
    .data0_in(PE20_Pixel_to_MUX_wr),
    .data1_in(PE21_Pixel_to_MUX_wr),
    .data2_in(PE22_Pixel_to_MUX_wr),
    .data3_in(PE23_Pixel_to_MUX_wr),
    .data4_in(PE24_Pixel_to_MUX_wr),
    .data5_in(PE25_Pixel_to_MUX_wr),
    .data6_in(PE26_Pixel_to_MUX_wr),
    .data7_in(PE27_Pixel_to_MUX_wr),
    .data8_in(PE28_Pixel_to_MUX_wr),
    .data9_in(PE29_Pixel_to_MUX_wr),
    .data10_in(PE30_Pixel_to_MUX_wr),
    .data11_in(PE31_Pixel_to_MUX_wr),
    .data12_in(PE32_Pixel_to_MUX_wr),
    .data13_in(PE33_Pixel_to_MUX_wr),
    .data14_in(PE34_Pixel_to_MUX_wr),
    .data15_in(PE35_Pixel_to_MUX_wr),
    .data16_in(PE36_Pixel_to_MUX_wr),
    .data17_in(PE37_Pixel_to_MUX_wr),
    .data18_in(PE38_Pixel_to_MUX_wr),
    .data19_in(PE39_Pixel_to_MUX_wr),
    .data20_in(PE0_Pixel_to_MUX_wr),
    .data21_in(PE1_Pixel_to_MUX_wr),
    .data22_in(PE2_Pixel_to_MUX_wr),
    .data23_in(PE3_Pixel_to_MUX_wr),
    .data24_in(PE4_Pixel_to_MUX_wr),
    .data25_in(PE5_Pixel_to_MUX_wr),
    .data26_in(PE6_Pixel_to_MUX_wr),
    .data27_in(PE7_Pixel_to_MUX_wr),
    .data28_in(PE8_Pixel_to_MUX_wr),
    .data29_in(PE9_Pixel_to_MUX_wr),
    .data30_in(PE10_Pixel_to_MUX_wr),
    .data31_in(PE11_Pixel_to_MUX_wr),
    .data32_in(PE12_Pixel_to_MUX_wr),
    .data33_in(PE13_Pixel_to_MUX_wr),
    .data34_in(PE14_Pixel_to_MUX_wr),
    .data35_in(PE15_Pixel_to_MUX_wr),
    .data36_in(PE16_Pixel_to_MUX_wr),
    .data37_in(PE17_Pixel_to_MUX_wr),
    .data38_in(PE18_Pixel_to_MUX_wr),
    .data39_in(PE19_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE20_Pixel_0_out_wr)
    );


        MUX_40_1 PE21_Pixel_0 (
    .data0_in(PE21_Pixel_to_MUX_wr),
    .data1_in(PE22_Pixel_to_MUX_wr),
    .data2_in(PE23_Pixel_to_MUX_wr),
    .data3_in(PE24_Pixel_to_MUX_wr),
    .data4_in(PE25_Pixel_to_MUX_wr),
    .data5_in(PE26_Pixel_to_MUX_wr),
    .data6_in(PE27_Pixel_to_MUX_wr),
    .data7_in(PE28_Pixel_to_MUX_wr),
    .data8_in(PE29_Pixel_to_MUX_wr),
    .data9_in(PE30_Pixel_to_MUX_wr),
    .data10_in(PE31_Pixel_to_MUX_wr),
    .data11_in(PE32_Pixel_to_MUX_wr),
    .data12_in(PE33_Pixel_to_MUX_wr),
    .data13_in(PE34_Pixel_to_MUX_wr),
    .data14_in(PE35_Pixel_to_MUX_wr),
    .data15_in(PE36_Pixel_to_MUX_wr),
    .data16_in(PE37_Pixel_to_MUX_wr),
    .data17_in(PE38_Pixel_to_MUX_wr),
    .data18_in(PE39_Pixel_to_MUX_wr),
    .data19_in(PE0_Pixel_to_MUX_wr),
    .data20_in(PE1_Pixel_to_MUX_wr),
    .data21_in(PE2_Pixel_to_MUX_wr),
    .data22_in(PE3_Pixel_to_MUX_wr),
    .data23_in(PE4_Pixel_to_MUX_wr),
    .data24_in(PE5_Pixel_to_MUX_wr),
    .data25_in(PE6_Pixel_to_MUX_wr),
    .data26_in(PE7_Pixel_to_MUX_wr),
    .data27_in(PE8_Pixel_to_MUX_wr),
    .data28_in(PE9_Pixel_to_MUX_wr),
    .data29_in(PE10_Pixel_to_MUX_wr),
    .data30_in(PE11_Pixel_to_MUX_wr),
    .data31_in(PE12_Pixel_to_MUX_wr),
    .data32_in(PE13_Pixel_to_MUX_wr),
    .data33_in(PE14_Pixel_to_MUX_wr),
    .data34_in(PE15_Pixel_to_MUX_wr),
    .data35_in(PE16_Pixel_to_MUX_wr),
    .data36_in(PE17_Pixel_to_MUX_wr),
    .data37_in(PE18_Pixel_to_MUX_wr),
    .data38_in(PE19_Pixel_to_MUX_wr),
    .data39_in(PE20_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE21_Pixel_0_out_wr)
    );


        MUX_40_1 PE22_Pixel_0 (
    .data0_in(PE22_Pixel_to_MUX_wr),
    .data1_in(PE23_Pixel_to_MUX_wr),
    .data2_in(PE24_Pixel_to_MUX_wr),
    .data3_in(PE25_Pixel_to_MUX_wr),
    .data4_in(PE26_Pixel_to_MUX_wr),
    .data5_in(PE27_Pixel_to_MUX_wr),
    .data6_in(PE28_Pixel_to_MUX_wr),
    .data7_in(PE29_Pixel_to_MUX_wr),
    .data8_in(PE30_Pixel_to_MUX_wr),
    .data9_in(PE31_Pixel_to_MUX_wr),
    .data10_in(PE32_Pixel_to_MUX_wr),
    .data11_in(PE33_Pixel_to_MUX_wr),
    .data12_in(PE34_Pixel_to_MUX_wr),
    .data13_in(PE35_Pixel_to_MUX_wr),
    .data14_in(PE36_Pixel_to_MUX_wr),
    .data15_in(PE37_Pixel_to_MUX_wr),
    .data16_in(PE38_Pixel_to_MUX_wr),
    .data17_in(PE39_Pixel_to_MUX_wr),
    .data18_in(PE0_Pixel_to_MUX_wr),
    .data19_in(PE1_Pixel_to_MUX_wr),
    .data20_in(PE2_Pixel_to_MUX_wr),
    .data21_in(PE3_Pixel_to_MUX_wr),
    .data22_in(PE4_Pixel_to_MUX_wr),
    .data23_in(PE5_Pixel_to_MUX_wr),
    .data24_in(PE6_Pixel_to_MUX_wr),
    .data25_in(PE7_Pixel_to_MUX_wr),
    .data26_in(PE8_Pixel_to_MUX_wr),
    .data27_in(PE9_Pixel_to_MUX_wr),
    .data28_in(PE10_Pixel_to_MUX_wr),
    .data29_in(PE11_Pixel_to_MUX_wr),
    .data30_in(PE12_Pixel_to_MUX_wr),
    .data31_in(PE13_Pixel_to_MUX_wr),
    .data32_in(PE14_Pixel_to_MUX_wr),
    .data33_in(PE15_Pixel_to_MUX_wr),
    .data34_in(PE16_Pixel_to_MUX_wr),
    .data35_in(PE17_Pixel_to_MUX_wr),
    .data36_in(PE18_Pixel_to_MUX_wr),
    .data37_in(PE19_Pixel_to_MUX_wr),
    .data38_in(PE20_Pixel_to_MUX_wr),
    .data39_in(PE21_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE22_Pixel_0_out_wr)
    );


        MUX_40_1 PE23_Pixel_0 (
    .data0_in(PE23_Pixel_to_MUX_wr),
    .data1_in(PE24_Pixel_to_MUX_wr),
    .data2_in(PE25_Pixel_to_MUX_wr),
    .data3_in(PE26_Pixel_to_MUX_wr),
    .data4_in(PE27_Pixel_to_MUX_wr),
    .data5_in(PE28_Pixel_to_MUX_wr),
    .data6_in(PE29_Pixel_to_MUX_wr),
    .data7_in(PE30_Pixel_to_MUX_wr),
    .data8_in(PE31_Pixel_to_MUX_wr),
    .data9_in(PE32_Pixel_to_MUX_wr),
    .data10_in(PE33_Pixel_to_MUX_wr),
    .data11_in(PE34_Pixel_to_MUX_wr),
    .data12_in(PE35_Pixel_to_MUX_wr),
    .data13_in(PE36_Pixel_to_MUX_wr),
    .data14_in(PE37_Pixel_to_MUX_wr),
    .data15_in(PE38_Pixel_to_MUX_wr),
    .data16_in(PE39_Pixel_to_MUX_wr),
    .data17_in(PE0_Pixel_to_MUX_wr),
    .data18_in(PE1_Pixel_to_MUX_wr),
    .data19_in(PE2_Pixel_to_MUX_wr),
    .data20_in(PE3_Pixel_to_MUX_wr),
    .data21_in(PE4_Pixel_to_MUX_wr),
    .data22_in(PE5_Pixel_to_MUX_wr),
    .data23_in(PE6_Pixel_to_MUX_wr),
    .data24_in(PE7_Pixel_to_MUX_wr),
    .data25_in(PE8_Pixel_to_MUX_wr),
    .data26_in(PE9_Pixel_to_MUX_wr),
    .data27_in(PE10_Pixel_to_MUX_wr),
    .data28_in(PE11_Pixel_to_MUX_wr),
    .data29_in(PE12_Pixel_to_MUX_wr),
    .data30_in(PE13_Pixel_to_MUX_wr),
    .data31_in(PE14_Pixel_to_MUX_wr),
    .data32_in(PE15_Pixel_to_MUX_wr),
    .data33_in(PE16_Pixel_to_MUX_wr),
    .data34_in(PE17_Pixel_to_MUX_wr),
    .data35_in(PE18_Pixel_to_MUX_wr),
    .data36_in(PE19_Pixel_to_MUX_wr),
    .data37_in(PE20_Pixel_to_MUX_wr),
    .data38_in(PE21_Pixel_to_MUX_wr),
    .data39_in(PE22_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE23_Pixel_0_out_wr)
    );


        MUX_40_1 PE24_Pixel_0 (
    .data0_in(PE24_Pixel_to_MUX_wr),
    .data1_in(PE25_Pixel_to_MUX_wr),
    .data2_in(PE26_Pixel_to_MUX_wr),
    .data3_in(PE27_Pixel_to_MUX_wr),
    .data4_in(PE28_Pixel_to_MUX_wr),
    .data5_in(PE29_Pixel_to_MUX_wr),
    .data6_in(PE30_Pixel_to_MUX_wr),
    .data7_in(PE31_Pixel_to_MUX_wr),
    .data8_in(PE32_Pixel_to_MUX_wr),
    .data9_in(PE33_Pixel_to_MUX_wr),
    .data10_in(PE34_Pixel_to_MUX_wr),
    .data11_in(PE35_Pixel_to_MUX_wr),
    .data12_in(PE36_Pixel_to_MUX_wr),
    .data13_in(PE37_Pixel_to_MUX_wr),
    .data14_in(PE38_Pixel_to_MUX_wr),
    .data15_in(PE39_Pixel_to_MUX_wr),
    .data16_in(PE0_Pixel_to_MUX_wr),
    .data17_in(PE1_Pixel_to_MUX_wr),
    .data18_in(PE2_Pixel_to_MUX_wr),
    .data19_in(PE3_Pixel_to_MUX_wr),
    .data20_in(PE4_Pixel_to_MUX_wr),
    .data21_in(PE5_Pixel_to_MUX_wr),
    .data22_in(PE6_Pixel_to_MUX_wr),
    .data23_in(PE7_Pixel_to_MUX_wr),
    .data24_in(PE8_Pixel_to_MUX_wr),
    .data25_in(PE9_Pixel_to_MUX_wr),
    .data26_in(PE10_Pixel_to_MUX_wr),
    .data27_in(PE11_Pixel_to_MUX_wr),
    .data28_in(PE12_Pixel_to_MUX_wr),
    .data29_in(PE13_Pixel_to_MUX_wr),
    .data30_in(PE14_Pixel_to_MUX_wr),
    .data31_in(PE15_Pixel_to_MUX_wr),
    .data32_in(PE16_Pixel_to_MUX_wr),
    .data33_in(PE17_Pixel_to_MUX_wr),
    .data34_in(PE18_Pixel_to_MUX_wr),
    .data35_in(PE19_Pixel_to_MUX_wr),
    .data36_in(PE20_Pixel_to_MUX_wr),
    .data37_in(PE21_Pixel_to_MUX_wr),
    .data38_in(PE22_Pixel_to_MUX_wr),
    .data39_in(PE23_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE24_Pixel_0_out_wr)
    );


        MUX_40_1 PE25_Pixel_0 (
    .data0_in(PE25_Pixel_to_MUX_wr),
    .data1_in(PE26_Pixel_to_MUX_wr),
    .data2_in(PE27_Pixel_to_MUX_wr),
    .data3_in(PE28_Pixel_to_MUX_wr),
    .data4_in(PE29_Pixel_to_MUX_wr),
    .data5_in(PE30_Pixel_to_MUX_wr),
    .data6_in(PE31_Pixel_to_MUX_wr),
    .data7_in(PE32_Pixel_to_MUX_wr),
    .data8_in(PE33_Pixel_to_MUX_wr),
    .data9_in(PE34_Pixel_to_MUX_wr),
    .data10_in(PE35_Pixel_to_MUX_wr),
    .data11_in(PE36_Pixel_to_MUX_wr),
    .data12_in(PE37_Pixel_to_MUX_wr),
    .data13_in(PE38_Pixel_to_MUX_wr),
    .data14_in(PE39_Pixel_to_MUX_wr),
    .data15_in(PE0_Pixel_to_MUX_wr),
    .data16_in(PE1_Pixel_to_MUX_wr),
    .data17_in(PE2_Pixel_to_MUX_wr),
    .data18_in(PE3_Pixel_to_MUX_wr),
    .data19_in(PE4_Pixel_to_MUX_wr),
    .data20_in(PE5_Pixel_to_MUX_wr),
    .data21_in(PE6_Pixel_to_MUX_wr),
    .data22_in(PE7_Pixel_to_MUX_wr),
    .data23_in(PE8_Pixel_to_MUX_wr),
    .data24_in(PE9_Pixel_to_MUX_wr),
    .data25_in(PE10_Pixel_to_MUX_wr),
    .data26_in(PE11_Pixel_to_MUX_wr),
    .data27_in(PE12_Pixel_to_MUX_wr),
    .data28_in(PE13_Pixel_to_MUX_wr),
    .data29_in(PE14_Pixel_to_MUX_wr),
    .data30_in(PE15_Pixel_to_MUX_wr),
    .data31_in(PE16_Pixel_to_MUX_wr),
    .data32_in(PE17_Pixel_to_MUX_wr),
    .data33_in(PE18_Pixel_to_MUX_wr),
    .data34_in(PE19_Pixel_to_MUX_wr),
    .data35_in(PE20_Pixel_to_MUX_wr),
    .data36_in(PE21_Pixel_to_MUX_wr),
    .data37_in(PE22_Pixel_to_MUX_wr),
    .data38_in(PE23_Pixel_to_MUX_wr),
    .data39_in(PE24_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE25_Pixel_0_out_wr)
    );


        MUX_40_1 PE26_Pixel_0 (
    .data0_in(PE26_Pixel_to_MUX_wr),
    .data1_in(PE27_Pixel_to_MUX_wr),
    .data2_in(PE28_Pixel_to_MUX_wr),
    .data3_in(PE29_Pixel_to_MUX_wr),
    .data4_in(PE30_Pixel_to_MUX_wr),
    .data5_in(PE31_Pixel_to_MUX_wr),
    .data6_in(PE32_Pixel_to_MUX_wr),
    .data7_in(PE33_Pixel_to_MUX_wr),
    .data8_in(PE34_Pixel_to_MUX_wr),
    .data9_in(PE35_Pixel_to_MUX_wr),
    .data10_in(PE36_Pixel_to_MUX_wr),
    .data11_in(PE37_Pixel_to_MUX_wr),
    .data12_in(PE38_Pixel_to_MUX_wr),
    .data13_in(PE39_Pixel_to_MUX_wr),
    .data14_in(PE0_Pixel_to_MUX_wr),
    .data15_in(PE1_Pixel_to_MUX_wr),
    .data16_in(PE2_Pixel_to_MUX_wr),
    .data17_in(PE3_Pixel_to_MUX_wr),
    .data18_in(PE4_Pixel_to_MUX_wr),
    .data19_in(PE5_Pixel_to_MUX_wr),
    .data20_in(PE6_Pixel_to_MUX_wr),
    .data21_in(PE7_Pixel_to_MUX_wr),
    .data22_in(PE8_Pixel_to_MUX_wr),
    .data23_in(PE9_Pixel_to_MUX_wr),
    .data24_in(PE10_Pixel_to_MUX_wr),
    .data25_in(PE11_Pixel_to_MUX_wr),
    .data26_in(PE12_Pixel_to_MUX_wr),
    .data27_in(PE13_Pixel_to_MUX_wr),
    .data28_in(PE14_Pixel_to_MUX_wr),
    .data29_in(PE15_Pixel_to_MUX_wr),
    .data30_in(PE16_Pixel_to_MUX_wr),
    .data31_in(PE17_Pixel_to_MUX_wr),
    .data32_in(PE18_Pixel_to_MUX_wr),
    .data33_in(PE19_Pixel_to_MUX_wr),
    .data34_in(PE20_Pixel_to_MUX_wr),
    .data35_in(PE21_Pixel_to_MUX_wr),
    .data36_in(PE22_Pixel_to_MUX_wr),
    .data37_in(PE23_Pixel_to_MUX_wr),
    .data38_in(PE24_Pixel_to_MUX_wr),
    .data39_in(PE25_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE26_Pixel_0_out_wr)
    );


        MUX_40_1 PE27_Pixel_0 (
    .data0_in(PE27_Pixel_to_MUX_wr),
    .data1_in(PE28_Pixel_to_MUX_wr),
    .data2_in(PE29_Pixel_to_MUX_wr),
    .data3_in(PE30_Pixel_to_MUX_wr),
    .data4_in(PE31_Pixel_to_MUX_wr),
    .data5_in(PE32_Pixel_to_MUX_wr),
    .data6_in(PE33_Pixel_to_MUX_wr),
    .data7_in(PE34_Pixel_to_MUX_wr),
    .data8_in(PE35_Pixel_to_MUX_wr),
    .data9_in(PE36_Pixel_to_MUX_wr),
    .data10_in(PE37_Pixel_to_MUX_wr),
    .data11_in(PE38_Pixel_to_MUX_wr),
    .data12_in(PE39_Pixel_to_MUX_wr),
    .data13_in(PE0_Pixel_to_MUX_wr),
    .data14_in(PE1_Pixel_to_MUX_wr),
    .data15_in(PE2_Pixel_to_MUX_wr),
    .data16_in(PE3_Pixel_to_MUX_wr),
    .data17_in(PE4_Pixel_to_MUX_wr),
    .data18_in(PE5_Pixel_to_MUX_wr),
    .data19_in(PE6_Pixel_to_MUX_wr),
    .data20_in(PE7_Pixel_to_MUX_wr),
    .data21_in(PE8_Pixel_to_MUX_wr),
    .data22_in(PE9_Pixel_to_MUX_wr),
    .data23_in(PE10_Pixel_to_MUX_wr),
    .data24_in(PE11_Pixel_to_MUX_wr),
    .data25_in(PE12_Pixel_to_MUX_wr),
    .data26_in(PE13_Pixel_to_MUX_wr),
    .data27_in(PE14_Pixel_to_MUX_wr),
    .data28_in(PE15_Pixel_to_MUX_wr),
    .data29_in(PE16_Pixel_to_MUX_wr),
    .data30_in(PE17_Pixel_to_MUX_wr),
    .data31_in(PE18_Pixel_to_MUX_wr),
    .data32_in(PE19_Pixel_to_MUX_wr),
    .data33_in(PE20_Pixel_to_MUX_wr),
    .data34_in(PE21_Pixel_to_MUX_wr),
    .data35_in(PE22_Pixel_to_MUX_wr),
    .data36_in(PE23_Pixel_to_MUX_wr),
    .data37_in(PE24_Pixel_to_MUX_wr),
    .data38_in(PE25_Pixel_to_MUX_wr),
    .data39_in(PE26_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE27_Pixel_0_out_wr)
    );


        MUX_40_1 PE28_Pixel_0 (
    .data0_in(PE28_Pixel_to_MUX_wr),
    .data1_in(PE29_Pixel_to_MUX_wr),
    .data2_in(PE30_Pixel_to_MUX_wr),
    .data3_in(PE31_Pixel_to_MUX_wr),
    .data4_in(PE32_Pixel_to_MUX_wr),
    .data5_in(PE33_Pixel_to_MUX_wr),
    .data6_in(PE34_Pixel_to_MUX_wr),
    .data7_in(PE35_Pixel_to_MUX_wr),
    .data8_in(PE36_Pixel_to_MUX_wr),
    .data9_in(PE37_Pixel_to_MUX_wr),
    .data10_in(PE38_Pixel_to_MUX_wr),
    .data11_in(PE39_Pixel_to_MUX_wr),
    .data12_in(PE0_Pixel_to_MUX_wr),
    .data13_in(PE1_Pixel_to_MUX_wr),
    .data14_in(PE2_Pixel_to_MUX_wr),
    .data15_in(PE3_Pixel_to_MUX_wr),
    .data16_in(PE4_Pixel_to_MUX_wr),
    .data17_in(PE5_Pixel_to_MUX_wr),
    .data18_in(PE6_Pixel_to_MUX_wr),
    .data19_in(PE7_Pixel_to_MUX_wr),
    .data20_in(PE8_Pixel_to_MUX_wr),
    .data21_in(PE9_Pixel_to_MUX_wr),
    .data22_in(PE10_Pixel_to_MUX_wr),
    .data23_in(PE11_Pixel_to_MUX_wr),
    .data24_in(PE12_Pixel_to_MUX_wr),
    .data25_in(PE13_Pixel_to_MUX_wr),
    .data26_in(PE14_Pixel_to_MUX_wr),
    .data27_in(PE15_Pixel_to_MUX_wr),
    .data28_in(PE16_Pixel_to_MUX_wr),
    .data29_in(PE17_Pixel_to_MUX_wr),
    .data30_in(PE18_Pixel_to_MUX_wr),
    .data31_in(PE19_Pixel_to_MUX_wr),
    .data32_in(PE20_Pixel_to_MUX_wr),
    .data33_in(PE21_Pixel_to_MUX_wr),
    .data34_in(PE22_Pixel_to_MUX_wr),
    .data35_in(PE23_Pixel_to_MUX_wr),
    .data36_in(PE24_Pixel_to_MUX_wr),
    .data37_in(PE25_Pixel_to_MUX_wr),
    .data38_in(PE26_Pixel_to_MUX_wr),
    .data39_in(PE27_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE28_Pixel_0_out_wr)
    );


        MUX_40_1 PE29_Pixel_0 (
    .data0_in(PE29_Pixel_to_MUX_wr),
    .data1_in(PE30_Pixel_to_MUX_wr),
    .data2_in(PE31_Pixel_to_MUX_wr),
    .data3_in(PE32_Pixel_to_MUX_wr),
    .data4_in(PE33_Pixel_to_MUX_wr),
    .data5_in(PE34_Pixel_to_MUX_wr),
    .data6_in(PE35_Pixel_to_MUX_wr),
    .data7_in(PE36_Pixel_to_MUX_wr),
    .data8_in(PE37_Pixel_to_MUX_wr),
    .data9_in(PE38_Pixel_to_MUX_wr),
    .data10_in(PE39_Pixel_to_MUX_wr),
    .data11_in(PE0_Pixel_to_MUX_wr),
    .data12_in(PE1_Pixel_to_MUX_wr),
    .data13_in(PE2_Pixel_to_MUX_wr),
    .data14_in(PE3_Pixel_to_MUX_wr),
    .data15_in(PE4_Pixel_to_MUX_wr),
    .data16_in(PE5_Pixel_to_MUX_wr),
    .data17_in(PE6_Pixel_to_MUX_wr),
    .data18_in(PE7_Pixel_to_MUX_wr),
    .data19_in(PE8_Pixel_to_MUX_wr),
    .data20_in(PE9_Pixel_to_MUX_wr),
    .data21_in(PE10_Pixel_to_MUX_wr),
    .data22_in(PE11_Pixel_to_MUX_wr),
    .data23_in(PE12_Pixel_to_MUX_wr),
    .data24_in(PE13_Pixel_to_MUX_wr),
    .data25_in(PE14_Pixel_to_MUX_wr),
    .data26_in(PE15_Pixel_to_MUX_wr),
    .data27_in(PE16_Pixel_to_MUX_wr),
    .data28_in(PE17_Pixel_to_MUX_wr),
    .data29_in(PE18_Pixel_to_MUX_wr),
    .data30_in(PE19_Pixel_to_MUX_wr),
    .data31_in(PE20_Pixel_to_MUX_wr),
    .data32_in(PE21_Pixel_to_MUX_wr),
    .data33_in(PE22_Pixel_to_MUX_wr),
    .data34_in(PE23_Pixel_to_MUX_wr),
    .data35_in(PE24_Pixel_to_MUX_wr),
    .data36_in(PE25_Pixel_to_MUX_wr),
    .data37_in(PE26_Pixel_to_MUX_wr),
    .data38_in(PE27_Pixel_to_MUX_wr),
    .data39_in(PE28_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE29_Pixel_0_out_wr)
    );


        MUX_40_1 PE30_Pixel_0 (
    .data0_in(PE30_Pixel_to_MUX_wr),
    .data1_in(PE31_Pixel_to_MUX_wr),
    .data2_in(PE32_Pixel_to_MUX_wr),
    .data3_in(PE33_Pixel_to_MUX_wr),
    .data4_in(PE34_Pixel_to_MUX_wr),
    .data5_in(PE35_Pixel_to_MUX_wr),
    .data6_in(PE36_Pixel_to_MUX_wr),
    .data7_in(PE37_Pixel_to_MUX_wr),
    .data8_in(PE38_Pixel_to_MUX_wr),
    .data9_in(PE39_Pixel_to_MUX_wr),
    .data10_in(PE0_Pixel_to_MUX_wr),
    .data11_in(PE1_Pixel_to_MUX_wr),
    .data12_in(PE2_Pixel_to_MUX_wr),
    .data13_in(PE3_Pixel_to_MUX_wr),
    .data14_in(PE4_Pixel_to_MUX_wr),
    .data15_in(PE5_Pixel_to_MUX_wr),
    .data16_in(PE6_Pixel_to_MUX_wr),
    .data17_in(PE7_Pixel_to_MUX_wr),
    .data18_in(PE8_Pixel_to_MUX_wr),
    .data19_in(PE9_Pixel_to_MUX_wr),
    .data20_in(PE10_Pixel_to_MUX_wr),
    .data21_in(PE11_Pixel_to_MUX_wr),
    .data22_in(PE12_Pixel_to_MUX_wr),
    .data23_in(PE13_Pixel_to_MUX_wr),
    .data24_in(PE14_Pixel_to_MUX_wr),
    .data25_in(PE15_Pixel_to_MUX_wr),
    .data26_in(PE16_Pixel_to_MUX_wr),
    .data27_in(PE17_Pixel_to_MUX_wr),
    .data28_in(PE18_Pixel_to_MUX_wr),
    .data29_in(PE19_Pixel_to_MUX_wr),
    .data30_in(PE20_Pixel_to_MUX_wr),
    .data31_in(PE21_Pixel_to_MUX_wr),
    .data32_in(PE22_Pixel_to_MUX_wr),
    .data33_in(PE23_Pixel_to_MUX_wr),
    .data34_in(PE24_Pixel_to_MUX_wr),
    .data35_in(PE25_Pixel_to_MUX_wr),
    .data36_in(PE26_Pixel_to_MUX_wr),
    .data37_in(PE27_Pixel_to_MUX_wr),
    .data38_in(PE28_Pixel_to_MUX_wr),
    .data39_in(PE29_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE30_Pixel_0_out_wr)
    );


        MUX_40_1 PE31_Pixel_0 (
    .data0_in(PE31_Pixel_to_MUX_wr),
    .data1_in(PE32_Pixel_to_MUX_wr),
    .data2_in(PE33_Pixel_to_MUX_wr),
    .data3_in(PE34_Pixel_to_MUX_wr),
    .data4_in(PE35_Pixel_to_MUX_wr),
    .data5_in(PE36_Pixel_to_MUX_wr),
    .data6_in(PE37_Pixel_to_MUX_wr),
    .data7_in(PE38_Pixel_to_MUX_wr),
    .data8_in(PE39_Pixel_to_MUX_wr),
    .data9_in(PE0_Pixel_to_MUX_wr),
    .data10_in(PE1_Pixel_to_MUX_wr),
    .data11_in(PE2_Pixel_to_MUX_wr),
    .data12_in(PE3_Pixel_to_MUX_wr),
    .data13_in(PE4_Pixel_to_MUX_wr),
    .data14_in(PE5_Pixel_to_MUX_wr),
    .data15_in(PE6_Pixel_to_MUX_wr),
    .data16_in(PE7_Pixel_to_MUX_wr),
    .data17_in(PE8_Pixel_to_MUX_wr),
    .data18_in(PE9_Pixel_to_MUX_wr),
    .data19_in(PE10_Pixel_to_MUX_wr),
    .data20_in(PE11_Pixel_to_MUX_wr),
    .data21_in(PE12_Pixel_to_MUX_wr),
    .data22_in(PE13_Pixel_to_MUX_wr),
    .data23_in(PE14_Pixel_to_MUX_wr),
    .data24_in(PE15_Pixel_to_MUX_wr),
    .data25_in(PE16_Pixel_to_MUX_wr),
    .data26_in(PE17_Pixel_to_MUX_wr),
    .data27_in(PE18_Pixel_to_MUX_wr),
    .data28_in(PE19_Pixel_to_MUX_wr),
    .data29_in(PE20_Pixel_to_MUX_wr),
    .data30_in(PE21_Pixel_to_MUX_wr),
    .data31_in(PE22_Pixel_to_MUX_wr),
    .data32_in(PE23_Pixel_to_MUX_wr),
    .data33_in(PE24_Pixel_to_MUX_wr),
    .data34_in(PE25_Pixel_to_MUX_wr),
    .data35_in(PE26_Pixel_to_MUX_wr),
    .data36_in(PE27_Pixel_to_MUX_wr),
    .data37_in(PE28_Pixel_to_MUX_wr),
    .data38_in(PE29_Pixel_to_MUX_wr),
    .data39_in(PE30_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE31_Pixel_0_out_wr)
    );


        MUX_40_1 PE32_Pixel_0 (
    .data0_in(PE32_Pixel_to_MUX_wr),
    .data1_in(PE33_Pixel_to_MUX_wr),
    .data2_in(PE34_Pixel_to_MUX_wr),
    .data3_in(PE35_Pixel_to_MUX_wr),
    .data4_in(PE36_Pixel_to_MUX_wr),
    .data5_in(PE37_Pixel_to_MUX_wr),
    .data6_in(PE38_Pixel_to_MUX_wr),
    .data7_in(PE39_Pixel_to_MUX_wr),
    .data8_in(PE0_Pixel_to_MUX_wr),
    .data9_in(PE1_Pixel_to_MUX_wr),
    .data10_in(PE2_Pixel_to_MUX_wr),
    .data11_in(PE3_Pixel_to_MUX_wr),
    .data12_in(PE4_Pixel_to_MUX_wr),
    .data13_in(PE5_Pixel_to_MUX_wr),
    .data14_in(PE6_Pixel_to_MUX_wr),
    .data15_in(PE7_Pixel_to_MUX_wr),
    .data16_in(PE8_Pixel_to_MUX_wr),
    .data17_in(PE9_Pixel_to_MUX_wr),
    .data18_in(PE10_Pixel_to_MUX_wr),
    .data19_in(PE11_Pixel_to_MUX_wr),
    .data20_in(PE12_Pixel_to_MUX_wr),
    .data21_in(PE13_Pixel_to_MUX_wr),
    .data22_in(PE14_Pixel_to_MUX_wr),
    .data23_in(PE15_Pixel_to_MUX_wr),
    .data24_in(PE16_Pixel_to_MUX_wr),
    .data25_in(PE17_Pixel_to_MUX_wr),
    .data26_in(PE18_Pixel_to_MUX_wr),
    .data27_in(PE19_Pixel_to_MUX_wr),
    .data28_in(PE20_Pixel_to_MUX_wr),
    .data29_in(PE21_Pixel_to_MUX_wr),
    .data30_in(PE22_Pixel_to_MUX_wr),
    .data31_in(PE23_Pixel_to_MUX_wr),
    .data32_in(PE24_Pixel_to_MUX_wr),
    .data33_in(PE25_Pixel_to_MUX_wr),
    .data34_in(PE26_Pixel_to_MUX_wr),
    .data35_in(PE27_Pixel_to_MUX_wr),
    .data36_in(PE28_Pixel_to_MUX_wr),
    .data37_in(PE29_Pixel_to_MUX_wr),
    .data38_in(PE30_Pixel_to_MUX_wr),
    .data39_in(PE31_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE32_Pixel_0_out_wr)
    );


        MUX_40_1 PE33_Pixel_0 (
    .data0_in(PE33_Pixel_to_MUX_wr),
    .data1_in(PE34_Pixel_to_MUX_wr),
    .data2_in(PE35_Pixel_to_MUX_wr),
    .data3_in(PE36_Pixel_to_MUX_wr),
    .data4_in(PE37_Pixel_to_MUX_wr),
    .data5_in(PE38_Pixel_to_MUX_wr),
    .data6_in(PE39_Pixel_to_MUX_wr),
    .data7_in(PE0_Pixel_to_MUX_wr),
    .data8_in(PE1_Pixel_to_MUX_wr),
    .data9_in(PE2_Pixel_to_MUX_wr),
    .data10_in(PE3_Pixel_to_MUX_wr),
    .data11_in(PE4_Pixel_to_MUX_wr),
    .data12_in(PE5_Pixel_to_MUX_wr),
    .data13_in(PE6_Pixel_to_MUX_wr),
    .data14_in(PE7_Pixel_to_MUX_wr),
    .data15_in(PE8_Pixel_to_MUX_wr),
    .data16_in(PE9_Pixel_to_MUX_wr),
    .data17_in(PE10_Pixel_to_MUX_wr),
    .data18_in(PE11_Pixel_to_MUX_wr),
    .data19_in(PE12_Pixel_to_MUX_wr),
    .data20_in(PE13_Pixel_to_MUX_wr),
    .data21_in(PE14_Pixel_to_MUX_wr),
    .data22_in(PE15_Pixel_to_MUX_wr),
    .data23_in(PE16_Pixel_to_MUX_wr),
    .data24_in(PE17_Pixel_to_MUX_wr),
    .data25_in(PE18_Pixel_to_MUX_wr),
    .data26_in(PE19_Pixel_to_MUX_wr),
    .data27_in(PE20_Pixel_to_MUX_wr),
    .data28_in(PE21_Pixel_to_MUX_wr),
    .data29_in(PE22_Pixel_to_MUX_wr),
    .data30_in(PE23_Pixel_to_MUX_wr),
    .data31_in(PE24_Pixel_to_MUX_wr),
    .data32_in(PE25_Pixel_to_MUX_wr),
    .data33_in(PE26_Pixel_to_MUX_wr),
    .data34_in(PE27_Pixel_to_MUX_wr),
    .data35_in(PE28_Pixel_to_MUX_wr),
    .data36_in(PE29_Pixel_to_MUX_wr),
    .data37_in(PE30_Pixel_to_MUX_wr),
    .data38_in(PE31_Pixel_to_MUX_wr),
    .data39_in(PE32_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE33_Pixel_0_out_wr)
    );


        MUX_40_1 PE34_Pixel_0 (
    .data0_in(PE34_Pixel_to_MUX_wr),
    .data1_in(PE35_Pixel_to_MUX_wr),
    .data2_in(PE36_Pixel_to_MUX_wr),
    .data3_in(PE37_Pixel_to_MUX_wr),
    .data4_in(PE38_Pixel_to_MUX_wr),
    .data5_in(PE39_Pixel_to_MUX_wr),
    .data6_in(PE0_Pixel_to_MUX_wr),
    .data7_in(PE1_Pixel_to_MUX_wr),
    .data8_in(PE2_Pixel_to_MUX_wr),
    .data9_in(PE3_Pixel_to_MUX_wr),
    .data10_in(PE4_Pixel_to_MUX_wr),
    .data11_in(PE5_Pixel_to_MUX_wr),
    .data12_in(PE6_Pixel_to_MUX_wr),
    .data13_in(PE7_Pixel_to_MUX_wr),
    .data14_in(PE8_Pixel_to_MUX_wr),
    .data15_in(PE9_Pixel_to_MUX_wr),
    .data16_in(PE10_Pixel_to_MUX_wr),
    .data17_in(PE11_Pixel_to_MUX_wr),
    .data18_in(PE12_Pixel_to_MUX_wr),
    .data19_in(PE13_Pixel_to_MUX_wr),
    .data20_in(PE14_Pixel_to_MUX_wr),
    .data21_in(PE15_Pixel_to_MUX_wr),
    .data22_in(PE16_Pixel_to_MUX_wr),
    .data23_in(PE17_Pixel_to_MUX_wr),
    .data24_in(PE18_Pixel_to_MUX_wr),
    .data25_in(PE19_Pixel_to_MUX_wr),
    .data26_in(PE20_Pixel_to_MUX_wr),
    .data27_in(PE21_Pixel_to_MUX_wr),
    .data28_in(PE22_Pixel_to_MUX_wr),
    .data29_in(PE23_Pixel_to_MUX_wr),
    .data30_in(PE24_Pixel_to_MUX_wr),
    .data31_in(PE25_Pixel_to_MUX_wr),
    .data32_in(PE26_Pixel_to_MUX_wr),
    .data33_in(PE27_Pixel_to_MUX_wr),
    .data34_in(PE28_Pixel_to_MUX_wr),
    .data35_in(PE29_Pixel_to_MUX_wr),
    .data36_in(PE30_Pixel_to_MUX_wr),
    .data37_in(PE31_Pixel_to_MUX_wr),
    .data38_in(PE32_Pixel_to_MUX_wr),
    .data39_in(PE33_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE34_Pixel_0_out_wr)
    );


        MUX_40_1 PE35_Pixel_0 (
    .data0_in(PE35_Pixel_to_MUX_wr),
    .data1_in(PE36_Pixel_to_MUX_wr),
    .data2_in(PE37_Pixel_to_MUX_wr),
    .data3_in(PE38_Pixel_to_MUX_wr),
    .data4_in(PE39_Pixel_to_MUX_wr),
    .data5_in(PE0_Pixel_to_MUX_wr),
    .data6_in(PE1_Pixel_to_MUX_wr),
    .data7_in(PE2_Pixel_to_MUX_wr),
    .data8_in(PE3_Pixel_to_MUX_wr),
    .data9_in(PE4_Pixel_to_MUX_wr),
    .data10_in(PE5_Pixel_to_MUX_wr),
    .data11_in(PE6_Pixel_to_MUX_wr),
    .data12_in(PE7_Pixel_to_MUX_wr),
    .data13_in(PE8_Pixel_to_MUX_wr),
    .data14_in(PE9_Pixel_to_MUX_wr),
    .data15_in(PE10_Pixel_to_MUX_wr),
    .data16_in(PE11_Pixel_to_MUX_wr),
    .data17_in(PE12_Pixel_to_MUX_wr),
    .data18_in(PE13_Pixel_to_MUX_wr),
    .data19_in(PE14_Pixel_to_MUX_wr),
    .data20_in(PE15_Pixel_to_MUX_wr),
    .data21_in(PE16_Pixel_to_MUX_wr),
    .data22_in(PE17_Pixel_to_MUX_wr),
    .data23_in(PE18_Pixel_to_MUX_wr),
    .data24_in(PE19_Pixel_to_MUX_wr),
    .data25_in(PE20_Pixel_to_MUX_wr),
    .data26_in(PE21_Pixel_to_MUX_wr),
    .data27_in(PE22_Pixel_to_MUX_wr),
    .data28_in(PE23_Pixel_to_MUX_wr),
    .data29_in(PE24_Pixel_to_MUX_wr),
    .data30_in(PE25_Pixel_to_MUX_wr),
    .data31_in(PE26_Pixel_to_MUX_wr),
    .data32_in(PE27_Pixel_to_MUX_wr),
    .data33_in(PE28_Pixel_to_MUX_wr),
    .data34_in(PE29_Pixel_to_MUX_wr),
    .data35_in(PE30_Pixel_to_MUX_wr),
    .data36_in(PE31_Pixel_to_MUX_wr),
    .data37_in(PE32_Pixel_to_MUX_wr),
    .data38_in(PE33_Pixel_to_MUX_wr),
    .data39_in(PE34_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE35_Pixel_0_out_wr)
    );


        MUX_40_1 PE36_Pixel_0 (
    .data0_in(PE36_Pixel_to_MUX_wr),
    .data1_in(PE37_Pixel_to_MUX_wr),
    .data2_in(PE38_Pixel_to_MUX_wr),
    .data3_in(PE39_Pixel_to_MUX_wr),
    .data4_in(PE0_Pixel_to_MUX_wr),
    .data5_in(PE1_Pixel_to_MUX_wr),
    .data6_in(PE2_Pixel_to_MUX_wr),
    .data7_in(PE3_Pixel_to_MUX_wr),
    .data8_in(PE4_Pixel_to_MUX_wr),
    .data9_in(PE5_Pixel_to_MUX_wr),
    .data10_in(PE6_Pixel_to_MUX_wr),
    .data11_in(PE7_Pixel_to_MUX_wr),
    .data12_in(PE8_Pixel_to_MUX_wr),
    .data13_in(PE9_Pixel_to_MUX_wr),
    .data14_in(PE10_Pixel_to_MUX_wr),
    .data15_in(PE11_Pixel_to_MUX_wr),
    .data16_in(PE12_Pixel_to_MUX_wr),
    .data17_in(PE13_Pixel_to_MUX_wr),
    .data18_in(PE14_Pixel_to_MUX_wr),
    .data19_in(PE15_Pixel_to_MUX_wr),
    .data20_in(PE16_Pixel_to_MUX_wr),
    .data21_in(PE17_Pixel_to_MUX_wr),
    .data22_in(PE18_Pixel_to_MUX_wr),
    .data23_in(PE19_Pixel_to_MUX_wr),
    .data24_in(PE20_Pixel_to_MUX_wr),
    .data25_in(PE21_Pixel_to_MUX_wr),
    .data26_in(PE22_Pixel_to_MUX_wr),
    .data27_in(PE23_Pixel_to_MUX_wr),
    .data28_in(PE24_Pixel_to_MUX_wr),
    .data29_in(PE25_Pixel_to_MUX_wr),
    .data30_in(PE26_Pixel_to_MUX_wr),
    .data31_in(PE27_Pixel_to_MUX_wr),
    .data32_in(PE28_Pixel_to_MUX_wr),
    .data33_in(PE29_Pixel_to_MUX_wr),
    .data34_in(PE30_Pixel_to_MUX_wr),
    .data35_in(PE31_Pixel_to_MUX_wr),
    .data36_in(PE32_Pixel_to_MUX_wr),
    .data37_in(PE33_Pixel_to_MUX_wr),
    .data38_in(PE34_Pixel_to_MUX_wr),
    .data39_in(PE35_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE36_Pixel_0_out_wr)
    );


        MUX_40_1 PE37_Pixel_0 (
    .data0_in(PE37_Pixel_to_MUX_wr),
    .data1_in(PE38_Pixel_to_MUX_wr),
    .data2_in(PE39_Pixel_to_MUX_wr),
    .data3_in(PE0_Pixel_to_MUX_wr),
    .data4_in(PE1_Pixel_to_MUX_wr),
    .data5_in(PE2_Pixel_to_MUX_wr),
    .data6_in(PE3_Pixel_to_MUX_wr),
    .data7_in(PE4_Pixel_to_MUX_wr),
    .data8_in(PE5_Pixel_to_MUX_wr),
    .data9_in(PE6_Pixel_to_MUX_wr),
    .data10_in(PE7_Pixel_to_MUX_wr),
    .data11_in(PE8_Pixel_to_MUX_wr),
    .data12_in(PE9_Pixel_to_MUX_wr),
    .data13_in(PE10_Pixel_to_MUX_wr),
    .data14_in(PE11_Pixel_to_MUX_wr),
    .data15_in(PE12_Pixel_to_MUX_wr),
    .data16_in(PE13_Pixel_to_MUX_wr),
    .data17_in(PE14_Pixel_to_MUX_wr),
    .data18_in(PE15_Pixel_to_MUX_wr),
    .data19_in(PE16_Pixel_to_MUX_wr),
    .data20_in(PE17_Pixel_to_MUX_wr),
    .data21_in(PE18_Pixel_to_MUX_wr),
    .data22_in(PE19_Pixel_to_MUX_wr),
    .data23_in(PE20_Pixel_to_MUX_wr),
    .data24_in(PE21_Pixel_to_MUX_wr),
    .data25_in(PE22_Pixel_to_MUX_wr),
    .data26_in(PE23_Pixel_to_MUX_wr),
    .data27_in(PE24_Pixel_to_MUX_wr),
    .data28_in(PE25_Pixel_to_MUX_wr),
    .data29_in(PE26_Pixel_to_MUX_wr),
    .data30_in(PE27_Pixel_to_MUX_wr),
    .data31_in(PE28_Pixel_to_MUX_wr),
    .data32_in(PE29_Pixel_to_MUX_wr),
    .data33_in(PE30_Pixel_to_MUX_wr),
    .data34_in(PE31_Pixel_to_MUX_wr),
    .data35_in(PE32_Pixel_to_MUX_wr),
    .data36_in(PE33_Pixel_to_MUX_wr),
    .data37_in(PE34_Pixel_to_MUX_wr),
    .data38_in(PE35_Pixel_to_MUX_wr),
    .data39_in(PE36_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE37_Pixel_0_out_wr)
    );


        MUX_40_1 PE38_Pixel_0 (
    .data0_in(PE38_Pixel_to_MUX_wr),
    .data1_in(PE39_Pixel_to_MUX_wr),
    .data2_in(PE0_Pixel_to_MUX_wr),
    .data3_in(PE1_Pixel_to_MUX_wr),
    .data4_in(PE2_Pixel_to_MUX_wr),
    .data5_in(PE3_Pixel_to_MUX_wr),
    .data6_in(PE4_Pixel_to_MUX_wr),
    .data7_in(PE5_Pixel_to_MUX_wr),
    .data8_in(PE6_Pixel_to_MUX_wr),
    .data9_in(PE7_Pixel_to_MUX_wr),
    .data10_in(PE8_Pixel_to_MUX_wr),
    .data11_in(PE9_Pixel_to_MUX_wr),
    .data12_in(PE10_Pixel_to_MUX_wr),
    .data13_in(PE11_Pixel_to_MUX_wr),
    .data14_in(PE12_Pixel_to_MUX_wr),
    .data15_in(PE13_Pixel_to_MUX_wr),
    .data16_in(PE14_Pixel_to_MUX_wr),
    .data17_in(PE15_Pixel_to_MUX_wr),
    .data18_in(PE16_Pixel_to_MUX_wr),
    .data19_in(PE17_Pixel_to_MUX_wr),
    .data20_in(PE18_Pixel_to_MUX_wr),
    .data21_in(PE19_Pixel_to_MUX_wr),
    .data22_in(PE20_Pixel_to_MUX_wr),
    .data23_in(PE21_Pixel_to_MUX_wr),
    .data24_in(PE22_Pixel_to_MUX_wr),
    .data25_in(PE23_Pixel_to_MUX_wr),
    .data26_in(PE24_Pixel_to_MUX_wr),
    .data27_in(PE25_Pixel_to_MUX_wr),
    .data28_in(PE26_Pixel_to_MUX_wr),
    .data29_in(PE27_Pixel_to_MUX_wr),
    .data30_in(PE28_Pixel_to_MUX_wr),
    .data31_in(PE29_Pixel_to_MUX_wr),
    .data32_in(PE30_Pixel_to_MUX_wr),
    .data33_in(PE31_Pixel_to_MUX_wr),
    .data34_in(PE32_Pixel_to_MUX_wr),
    .data35_in(PE33_Pixel_to_MUX_wr),
    .data36_in(PE34_Pixel_to_MUX_wr),
    .data37_in(PE35_Pixel_to_MUX_wr),
    .data38_in(PE36_Pixel_to_MUX_wr),
    .data39_in(PE37_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE38_Pixel_0_out_wr)
    );


        MUX_40_1 PE39_Pixel_0 (
    .data0_in(PE39_Pixel_to_MUX_wr),
    .data1_in(PE0_Pixel_to_MUX_wr),
    .data2_in(PE1_Pixel_to_MUX_wr),
    .data3_in(PE2_Pixel_to_MUX_wr),
    .data4_in(PE3_Pixel_to_MUX_wr),
    .data5_in(PE4_Pixel_to_MUX_wr),
    .data6_in(PE5_Pixel_to_MUX_wr),
    .data7_in(PE6_Pixel_to_MUX_wr),
    .data8_in(PE7_Pixel_to_MUX_wr),
    .data9_in(PE8_Pixel_to_MUX_wr),
    .data10_in(PE9_Pixel_to_MUX_wr),
    .data11_in(PE10_Pixel_to_MUX_wr),
    .data12_in(PE11_Pixel_to_MUX_wr),
    .data13_in(PE12_Pixel_to_MUX_wr),
    .data14_in(PE13_Pixel_to_MUX_wr),
    .data15_in(PE14_Pixel_to_MUX_wr),
    .data16_in(PE15_Pixel_to_MUX_wr),
    .data17_in(PE16_Pixel_to_MUX_wr),
    .data18_in(PE17_Pixel_to_MUX_wr),
    .data19_in(PE18_Pixel_to_MUX_wr),
    .data20_in(PE19_Pixel_to_MUX_wr),
    .data21_in(PE20_Pixel_to_MUX_wr),
    .data22_in(PE21_Pixel_to_MUX_wr),
    .data23_in(PE22_Pixel_to_MUX_wr),
    .data24_in(PE23_Pixel_to_MUX_wr),
    .data25_in(PE24_Pixel_to_MUX_wr),
    .data26_in(PE25_Pixel_to_MUX_wr),
    .data27_in(PE26_Pixel_to_MUX_wr),
    .data28_in(PE27_Pixel_to_MUX_wr),
    .data29_in(PE28_Pixel_to_MUX_wr),
    .data30_in(PE29_Pixel_to_MUX_wr),
    .data31_in(PE30_Pixel_to_MUX_wr),
    .data32_in(PE31_Pixel_to_MUX_wr),
    .data33_in(PE32_Pixel_to_MUX_wr),
    .data34_in(PE33_Pixel_to_MUX_wr),
    .data35_in(PE34_Pixel_to_MUX_wr),
    .data36_in(PE35_Pixel_to_MUX_wr),
    .data37_in(PE36_Pixel_to_MUX_wr),
    .data38_in(PE37_Pixel_to_MUX_wr),
    .data39_in(PE38_Pixel_to_MUX_wr),
    .sel_in(MUX_Selection_in),
    .mux_40_1_out(PE39_Pixel_0_out_wr)
    );





    assign PE0_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE1_Pixel_0_in : PE0_Pixel_0_in;	
	assign PE0_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE2_Pixel_0_in : PE1_Pixel_0_in;

    assign PE1_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE2_Pixel_0_in : PE2_Pixel_0_in;	
	assign PE1_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE3_Pixel_0_in : PE3_Pixel_0_in;

    assign PE2_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE3_Pixel_0_in : PE4_Pixel_0_in;	
	assign PE2_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE4_Pixel_0_in : PE5_Pixel_0_in;

    assign PE3_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE4_Pixel_0_in : PE6_Pixel_0_in;	
	assign PE3_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE5_Pixel_0_in : PE7_Pixel_0_in;

    assign PE4_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE5_Pixel_0_in : PE8_Pixel_0_in;	
	assign PE4_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE6_Pixel_0_in : PE9_Pixel_0_in;

    assign PE5_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE6_Pixel_0_in : PE10_Pixel_0_in;	
	assign PE5_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE7_Pixel_0_in : PE11_Pixel_0_in;

    assign PE6_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE7_Pixel_0_in : PE12_Pixel_0_in;	
	assign PE6_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE8_Pixel_0_in : PE13_Pixel_0_in;

    assign PE7_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE8_Pixel_0_in : PE14_Pixel_0_in;	
	assign PE7_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE9_Pixel_0_in : PE15_Pixel_0_in;

    assign PE8_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE9_Pixel_0_in : PE16_Pixel_0_in;	
	assign PE8_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE10_Pixel_0_in : PE17_Pixel_0_in;

    assign PE9_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE10_Pixel_0_in : PE18_Pixel_0_in;	
	assign PE9_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE11_Pixel_0_in : PE19_Pixel_0_in;

    assign PE10_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE11_Pixel_0_in : PE20_Pixel_0_in;	
	assign PE10_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE12_Pixel_0_in : PE21_Pixel_0_in;

    assign PE11_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE12_Pixel_0_in : PE22_Pixel_0_in;	
	assign PE11_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE13_Pixel_0_in : PE23_Pixel_0_in;

    assign PE12_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE13_Pixel_0_in : PE24_Pixel_0_in;	
	assign PE12_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE14_Pixel_0_in : PE25_Pixel_0_in;

    assign PE13_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE14_Pixel_0_in : PE26_Pixel_0_in;	
	assign PE13_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE15_Pixel_0_in : PE27_Pixel_0_in;

    assign PE14_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE15_Pixel_0_in : PE28_Pixel_0_in;	
	assign PE14_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE16_Pixel_0_in : PE29_Pixel_0_in;

    assign PE15_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE16_Pixel_0_in : PE30_Pixel_0_in;	
	assign PE15_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE17_Pixel_0_in : PE31_Pixel_0_in;

    assign PE16_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE17_Pixel_0_in : PE32_Pixel_0_in;	
	assign PE16_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE18_Pixel_0_in : PE33_Pixel_0_in;

    assign PE17_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE18_Pixel_0_in : PE34_Pixel_0_in;	
	assign PE17_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE19_Pixel_0_in : PE35_Pixel_0_in;

    assign PE18_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE19_Pixel_0_in : PE36_Pixel_0_in;	
	assign PE18_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE20_Pixel_0_in : PE37_Pixel_0_in;

    assign PE19_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE20_Pixel_0_in : PE38_Pixel_0_in;	
	assign PE19_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE21_Pixel_0_in : PE39_Pixel_0_in;

    assign PE20_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE21_Pixel_0_in : PE0_Pixel_1_in;	
	assign PE20_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE22_Pixel_0_in : PE1_Pixel_1_in;

    assign PE21_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE22_Pixel_0_in : PE2_Pixel_1_in;	
	assign PE21_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE23_Pixel_0_in : PE3_Pixel_1_in;

    assign PE22_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE23_Pixel_0_in : PE4_Pixel_1_in;	
	assign PE22_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE24_Pixel_0_in : PE5_Pixel_1_in;

    assign PE23_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE24_Pixel_0_in : PE6_Pixel_1_in;	
	assign PE23_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE25_Pixel_0_in : PE7_Pixel_1_in;

    assign PE24_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE25_Pixel_0_in : PE8_Pixel_1_in;	
	assign PE24_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE26_Pixel_0_in : PE9_Pixel_1_in;

    assign PE25_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE26_Pixel_0_in : PE10_Pixel_1_in;	
	assign PE25_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE27_Pixel_0_in : PE11_Pixel_1_in;

    assign PE26_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE27_Pixel_0_in : PE12_Pixel_1_in;	
	assign PE26_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE28_Pixel_0_in : PE13_Pixel_1_in;

    assign PE27_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE28_Pixel_0_in : PE14_Pixel_1_in;	
	assign PE27_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE29_Pixel_0_in : PE15_Pixel_1_in;

    assign PE28_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE29_Pixel_0_in : PE16_Pixel_1_in;	
	assign PE28_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE30_Pixel_0_in : PE17_Pixel_1_in;

    assign PE29_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE30_Pixel_0_in : PE18_Pixel_1_in;	
	assign PE29_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE31_Pixel_0_in : PE19_Pixel_1_in;

    assign PE30_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE31_Pixel_0_in : PE20_Pixel_1_in;	
	assign PE30_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE32_Pixel_0_in : PE21_Pixel_1_in;

    assign PE31_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE32_Pixel_0_in : PE22_Pixel_1_in;	
	assign PE31_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE33_Pixel_0_in : PE23_Pixel_1_in;

    assign PE32_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE33_Pixel_0_in : PE24_Pixel_1_in;	
	assign PE32_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE34_Pixel_0_in : PE25_Pixel_1_in;

    assign PE33_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE34_Pixel_0_in : PE26_Pixel_1_in;	
	assign PE33_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE35_Pixel_0_in : PE27_Pixel_1_in;

    assign PE34_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE35_Pixel_0_in : PE28_Pixel_1_in;	
	assign PE34_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE36_Pixel_0_in : PE29_Pixel_1_in;

    assign PE35_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE36_Pixel_0_in : PE30_Pixel_1_in;	
	assign PE35_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE37_Pixel_0_in : PE31_Pixel_1_in;

    assign PE36_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE37_Pixel_0_in : PE32_Pixel_1_in;	
	assign PE36_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE38_Pixel_0_in : PE33_Pixel_1_in;

    assign PE37_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE38_Pixel_0_in : PE34_Pixel_1_in;	
	assign PE37_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE39_Pixel_0_in : PE35_Pixel_1_in;

    assign PE38_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE39_Pixel_0_in : PE36_Pixel_1_in;	
	assign PE38_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE0_Pixel_1_in : PE37_Pixel_1_in;

    assign PE39_Pixel_1_out_wr			=  (Opcode_in == 2'b01) ? PE0_Pixel_1_in : PE38_Pixel_1_in;	
	assign PE39_Pixel_2_out_wr			=  (Opcode_in == 2'b01) ? PE1_Pixel_1_in : PE39_Pixel_1_in;


	
	assign PE0_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE0_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE1_Pixel_0_valid_in : PE0_Pixel_0_valid_in;
	assign PE0_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE2_Pixel_0_valid_in : PE1_Pixel_0_valid_in;

	assign PE1_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE1_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE2_Pixel_0_valid_in : PE2_Pixel_0_valid_in;
	assign PE1_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE3_Pixel_0_valid_in : PE3_Pixel_0_valid_in;

	assign PE2_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE2_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE3_Pixel_0_valid_in : PE4_Pixel_0_valid_in;
	assign PE2_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE4_Pixel_0_valid_in : PE5_Pixel_0_valid_in;

	assign PE3_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE3_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE4_Pixel_0_valid_in : PE6_Pixel_0_valid_in;
	assign PE3_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE5_Pixel_0_valid_in : PE7_Pixel_0_valid_in;

	assign PE4_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE4_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE5_Pixel_0_valid_in : PE8_Pixel_0_valid_in;
	assign PE4_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE6_Pixel_0_valid_in : PE9_Pixel_0_valid_in;

	assign PE5_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE5_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE6_Pixel_0_valid_in : PE10_Pixel_0_valid_in;
	assign PE5_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE7_Pixel_0_valid_in : PE11_Pixel_0_valid_in;

	assign PE6_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE6_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE7_Pixel_0_valid_in : PE12_Pixel_0_valid_in;
	assign PE6_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE8_Pixel_0_valid_in : PE13_Pixel_0_valid_in;

	assign PE7_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE7_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE8_Pixel_0_valid_in : PE14_Pixel_0_valid_in;
	assign PE7_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE9_Pixel_0_valid_in : PE15_Pixel_0_valid_in;

	assign PE8_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE8_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE9_Pixel_0_valid_in : PE16_Pixel_0_valid_in;
	assign PE8_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE10_Pixel_0_valid_in : PE17_Pixel_0_valid_in;

	assign PE9_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE9_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE10_Pixel_0_valid_in : PE18_Pixel_0_valid_in;
	assign PE9_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE11_Pixel_0_valid_in : PE19_Pixel_0_valid_in;

	assign PE10_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE10_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE11_Pixel_0_valid_in : PE20_Pixel_0_valid_in;
	assign PE10_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE12_Pixel_0_valid_in : PE21_Pixel_0_valid_in;

	assign PE11_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE11_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE12_Pixel_0_valid_in : PE22_Pixel_0_valid_in;
	assign PE11_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE13_Pixel_0_valid_in : PE23_Pixel_0_valid_in;

	assign PE12_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE12_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE13_Pixel_0_valid_in : PE24_Pixel_0_valid_in;
	assign PE12_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE14_Pixel_0_valid_in : PE25_Pixel_0_valid_in;

	assign PE13_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE13_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE14_Pixel_0_valid_in : PE26_Pixel_0_valid_in;
	assign PE13_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE15_Pixel_0_valid_in : PE27_Pixel_0_valid_in;

	assign PE14_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE14_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE15_Pixel_0_valid_in : PE28_Pixel_0_valid_in;
	assign PE14_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE16_Pixel_0_valid_in : PE29_Pixel_0_valid_in;

	assign PE15_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE15_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE16_Pixel_0_valid_in : PE30_Pixel_0_valid_in;
	assign PE15_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE17_Pixel_0_valid_in : PE31_Pixel_0_valid_in;

	assign PE16_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE16_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE17_Pixel_0_valid_in : PE32_Pixel_0_valid_in;
	assign PE16_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE18_Pixel_0_valid_in : PE33_Pixel_0_valid_in;

	assign PE17_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE17_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE18_Pixel_0_valid_in : PE34_Pixel_0_valid_in;
	assign PE17_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE19_Pixel_0_valid_in : PE35_Pixel_0_valid_in;

	assign PE18_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE18_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE19_Pixel_0_valid_in : PE36_Pixel_0_valid_in;
	assign PE18_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE20_Pixel_0_valid_in : PE37_Pixel_0_valid_in;

	assign PE19_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE19_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE20_Pixel_0_valid_in : PE38_Pixel_0_valid_in;
	assign PE19_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE21_Pixel_0_valid_in : PE39_Pixel_0_valid_in;

	assign PE20_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE20_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE21_Pixel_0_valid_in : PE0_Pixel_1_valid_in;
	assign PE20_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE22_Pixel_0_valid_in : PE1_Pixel_1_valid_in;

	assign PE21_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE21_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE22_Pixel_0_valid_in : PE2_Pixel_1_valid_in;
	assign PE21_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE23_Pixel_0_valid_in : PE3_Pixel_1_valid_in;

	assign PE22_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE22_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE23_Pixel_0_valid_in : PE4_Pixel_1_valid_in;
	assign PE22_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE24_Pixel_0_valid_in : PE5_Pixel_1_valid_in;

	assign PE23_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE23_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE24_Pixel_0_valid_in : PE6_Pixel_1_valid_in;
	assign PE23_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE25_Pixel_0_valid_in : PE7_Pixel_1_valid_in;

	assign PE24_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE24_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE25_Pixel_0_valid_in : PE8_Pixel_1_valid_in;
	assign PE24_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE26_Pixel_0_valid_in : PE9_Pixel_1_valid_in;

	assign PE25_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE25_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE26_Pixel_0_valid_in : PE10_Pixel_1_valid_in;
	assign PE25_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE27_Pixel_0_valid_in : PE11_Pixel_1_valid_in;

	assign PE26_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE26_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE27_Pixel_0_valid_in : PE12_Pixel_1_valid_in;
	assign PE26_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE28_Pixel_0_valid_in : PE13_Pixel_1_valid_in;

	assign PE27_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE27_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE28_Pixel_0_valid_in : PE14_Pixel_1_valid_in;
	assign PE27_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE29_Pixel_0_valid_in : PE15_Pixel_1_valid_in;

	assign PE28_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE28_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE29_Pixel_0_valid_in : PE16_Pixel_1_valid_in;
	assign PE28_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE30_Pixel_0_valid_in : PE17_Pixel_1_valid_in;

	assign PE29_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE29_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE30_Pixel_0_valid_in : PE18_Pixel_1_valid_in;
	assign PE29_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE31_Pixel_0_valid_in : PE19_Pixel_1_valid_in;

	assign PE30_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE30_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE31_Pixel_0_valid_in : PE20_Pixel_1_valid_in;
	assign PE30_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE32_Pixel_0_valid_in : PE21_Pixel_1_valid_in;

	assign PE31_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE31_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE32_Pixel_0_valid_in : PE22_Pixel_1_valid_in;
	assign PE31_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE33_Pixel_0_valid_in : PE23_Pixel_1_valid_in;

	assign PE32_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE32_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE33_Pixel_0_valid_in : PE24_Pixel_1_valid_in;
	assign PE32_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE34_Pixel_0_valid_in : PE25_Pixel_1_valid_in;

	assign PE33_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE33_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE34_Pixel_0_valid_in : PE26_Pixel_1_valid_in;
	assign PE33_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE35_Pixel_0_valid_in : PE27_Pixel_1_valid_in;

	assign PE34_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE34_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE35_Pixel_0_valid_in : PE28_Pixel_1_valid_in;
	assign PE34_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE36_Pixel_0_valid_in : PE29_Pixel_1_valid_in;

	assign PE35_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE35_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE36_Pixel_0_valid_in : PE30_Pixel_1_valid_in;
	assign PE35_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE37_Pixel_0_valid_in : PE31_Pixel_1_valid_in;

	assign PE36_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE36_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE37_Pixel_0_valid_in : PE32_Pixel_1_valid_in;
	assign PE36_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE38_Pixel_0_valid_in : PE33_Pixel_1_valid_in;

	assign PE37_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE37_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE38_Pixel_0_valid_in : PE34_Pixel_1_valid_in;
	assign PE37_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE39_Pixel_0_valid_in : PE35_Pixel_1_valid_in;

	assign PE38_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE38_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE39_Pixel_0_valid_in : PE36_Pixel_1_valid_in;
	assign PE38_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE0_Pixel_1_valid_in : PE37_Pixel_1_valid_in;

	assign PE39_Pixel_0_valid_out_wr		=  PE0_Pixel_0_valid_in;
	assign PE39_Pixel_1_valid_out_wr		=  (Opcode_in == 2'b01) ? PE0_Pixel_1_valid_in : PE38_Pixel_1_valid_in;
	assign PE39_Pixel_2_valid_out_wr		=  (Opcode_in == 2'b01) ? PE1_Pixel_1_valid_in : PE39_Pixel_1_valid_in;


	always @(posedge CLK) begin
		if (RST) begin
			PE0_Pixel_0_out				<= 0;
			PE0_Pixel_0_valid_out		<= 0;
			PE0_Pixel_1_out				<= 0;
			PE0_Pixel_1_valid_out		<= 0;
			PE0_Pixel_2_out				<= 0;
			PE0_Pixel_2_valid_out		<= 0;
              
			PE1_Pixel_0_out				<= 0;
			PE1_Pixel_0_valid_out		<= 0;
			PE1_Pixel_1_out				<= 0;
			PE1_Pixel_1_valid_out		<= 0;
			PE1_Pixel_2_out				<= 0;
			PE1_Pixel_2_valid_out		<= 0;
              
			PE2_Pixel_0_out				<= 0;
			PE2_Pixel_0_valid_out		<= 0;
			PE2_Pixel_1_out				<= 0;
			PE2_Pixel_1_valid_out		<= 0;
			PE2_Pixel_2_out				<= 0;
			PE2_Pixel_2_valid_out		<= 0;
			  
			PE3_Pixel_0_out				<= 0;
			PE3_Pixel_0_valid_out		<= 0;
			PE3_Pixel_1_out				<= 0;
			PE3_Pixel_1_valid_out		<= 0;
			PE3_Pixel_2_out				<= 0;
			PE3_Pixel_2_valid_out		<= 0;
			  
			PE4_Pixel_0_out				<= 0;
			PE4_Pixel_0_valid_out		<= 0;
			PE4_Pixel_1_out				<= 0;
			PE4_Pixel_1_valid_out		<= 0;
			PE4_Pixel_2_out				<= 0;
			PE4_Pixel_2_valid_out		<= 0;
			  
			PE5_Pixel_0_out				<= 0;
			PE5_Pixel_0_valid_out		<= 0;
			PE5_Pixel_1_out				<= 0;
			PE5_Pixel_1_valid_out		<= 0;
			PE5_Pixel_2_out				<= 0;
			PE5_Pixel_2_valid_out		<= 0;
			  
			PE6_Pixel_0_out				<= 0;
			PE6_Pixel_0_valid_out		<= 0;
			PE6_Pixel_1_out				<= 0;
			PE6_Pixel_1_valid_out		<= 0;
			PE6_Pixel_2_out				<= 0;
			PE6_Pixel_2_valid_out		<= 0;
			  
			PE7_Pixel_0_out				<= 0;
			PE7_Pixel_0_valid_out		<= 0;
			PE7_Pixel_1_out				<= 0;
			PE7_Pixel_1_valid_out		<= 0;
			PE7_Pixel_2_out				<= 0;
			PE7_Pixel_2_valid_out		<= 0;
			  
			PE8_Pixel_0_out				<= 0;
			PE8_Pixel_0_valid_out		<= 0;
			PE8_Pixel_1_out				<= 0;
			PE8_Pixel_1_valid_out		<= 0;
			PE8_Pixel_2_out				<= 0;
			PE8_Pixel_2_valid_out		<= 0;
			  
			PE9_Pixel_0_out				<= 0;
			PE9_Pixel_0_valid_out		<= 0;
			PE9_Pixel_1_out				<= 0;
			PE9_Pixel_1_valid_out		<= 0;
			PE9_Pixel_2_out				<= 0;
			PE9_Pixel_2_valid_out		<= 0;
			
			PE10_Pixel_0_out			<= 0;
			PE10_Pixel_0_valid_out		<= 0;
			PE10_Pixel_1_out			<= 0;
			PE10_Pixel_1_valid_out		<= 0;
			PE10_Pixel_2_out			<= 0;
			PE10_Pixel_2_valid_out		<= 0;
              
			PE11_Pixel_0_out			<= 0;
			PE11_Pixel_0_valid_out		<= 0;
			PE11_Pixel_1_out			<= 0;
			PE11_Pixel_1_valid_out		<= 0;
			PE11_Pixel_2_out			<= 0;
			PE11_Pixel_2_valid_out		<= 0;
              
			PE12_Pixel_0_out			<= 0;
			PE12_Pixel_0_valid_out		<= 0;
			PE12_Pixel_1_out			<= 0;
			PE12_Pixel_1_valid_out		<= 0;
			PE12_Pixel_2_out			<= 0;
			PE12_Pixel_2_valid_out		<= 0;
			  
			PE13_Pixel_0_out			<= 0;
			PE13_Pixel_0_valid_out		<= 0;
			PE13_Pixel_1_out			<= 0;
			PE13_Pixel_1_valid_out		<= 0;
			PE13_Pixel_2_out			<= 0;
			PE13_Pixel_2_valid_out		<= 0;
			  
			PE14_Pixel_0_out			<= 0;
			PE14_Pixel_0_valid_out		<= 0;
			PE14_Pixel_1_out			<= 0;
			PE14_Pixel_1_valid_out		<= 0;
			PE14_Pixel_2_out			<= 0;
			PE14_Pixel_2_valid_out		<= 0;
			  
			PE15_Pixel_0_out			<= 0;
			PE15_Pixel_0_valid_out		<= 0;
			PE15_Pixel_1_out			<= 0;
			PE15_Pixel_1_valid_out		<= 0;
			PE15_Pixel_2_out			<= 0;
			PE15_Pixel_2_valid_out		<= 0;
			  
			PE16_Pixel_0_out			<= 0;
			PE16_Pixel_0_valid_out		<= 0;
			PE16_Pixel_1_out			<= 0;
			PE16_Pixel_1_valid_out		<= 0;
			PE16_Pixel_2_out			<= 0;
			PE16_Pixel_2_valid_out		<= 0;
			  
			PE17_Pixel_0_out			<= 0;
			PE17_Pixel_0_valid_out		<= 0;
			PE17_Pixel_1_out			<= 0;
			PE17_Pixel_1_valid_out		<= 0;
			PE17_Pixel_2_out			<= 0;
			PE17_Pixel_2_valid_out		<= 0;
			  
			PE18_Pixel_0_out			<= 0;
			PE18_Pixel_0_valid_out		<= 0;
			PE18_Pixel_1_out			<= 0;
			PE18_Pixel_1_valid_out		<= 0;
			PE18_Pixel_2_out			<= 0;
			PE18_Pixel_2_valid_out		<= 0;
			  
			PE19_Pixel_0_out			<= 0;
			PE19_Pixel_0_valid_out		<= 0;
			PE19_Pixel_1_out			<= 0;
			PE19_Pixel_1_valid_out		<= 0;
			PE19_Pixel_2_out			<= 0;
			PE19_Pixel_2_valid_out		<= 0;
			
        	PE20_Pixel_0_out			<= 0;
			PE20_Pixel_0_valid_out		<= 0;
			PE20_Pixel_1_out			<= 0;
			PE20_Pixel_1_valid_out		<= 0;
			PE20_Pixel_2_out			<= 0;
			PE20_Pixel_2_valid_out		<= 0;
              
			PE21_Pixel_0_out			<= 0;
			PE21_Pixel_0_valid_out		<= 0;
			PE21_Pixel_1_out			<= 0;
			PE21_Pixel_1_valid_out		<= 0;
			PE21_Pixel_2_out			<= 0;
			PE21_Pixel_2_valid_out		<= 0;
              
			PE22_Pixel_0_out			<= 0;
			PE22_Pixel_0_valid_out		<= 0;
			PE22_Pixel_1_out			<= 0;
			PE22_Pixel_1_valid_out		<= 0;
			PE22_Pixel_2_out			<= 0;
			PE22_Pixel_2_valid_out		<= 0;
			  
			PE23_Pixel_0_out			<= 0;
			PE23_Pixel_0_valid_out		<= 0;
			PE23_Pixel_1_out			<= 0;
			PE23_Pixel_1_valid_out		<= 0;
			PE23_Pixel_2_out			<= 0;
			PE23_Pixel_2_valid_out		<= 0;
			  
			PE24_Pixel_0_out			<= 0;
			PE24_Pixel_0_valid_out		<= 0;
			PE24_Pixel_1_out			<= 0;
			PE24_Pixel_1_valid_out		<= 0;
			PE24_Pixel_2_out			<= 0;
			PE24_Pixel_2_valid_out		<= 0;
			  
			PE25_Pixel_0_out			<= 0;
			PE25_Pixel_0_valid_out		<= 0;
			PE25_Pixel_1_out			<= 0;
			PE25_Pixel_1_valid_out		<= 0;
			PE25_Pixel_2_out			<= 0;
			PE25_Pixel_2_valid_out		<= 0;
			  
			PE26_Pixel_0_out			<= 0;
			PE26_Pixel_0_valid_out		<= 0;
			PE26_Pixel_1_out			<= 0;
			PE26_Pixel_1_valid_out		<= 0;
			PE26_Pixel_2_out			<= 0;
			PE26_Pixel_2_valid_out		<= 0;
			  
			PE27_Pixel_0_out			<= 0;
			PE27_Pixel_0_valid_out		<= 0;
			PE27_Pixel_1_out			<= 0;
			PE27_Pixel_1_valid_out		<= 0;
			PE27_Pixel_2_out			<= 0;
			PE27_Pixel_2_valid_out		<= 0;
			  
			PE28_Pixel_0_out			<= 0;
			PE28_Pixel_0_valid_out		<= 0;
			PE28_Pixel_1_out			<= 0;
			PE28_Pixel_1_valid_out		<= 0;
			PE28_Pixel_2_out			<= 0;
			PE28_Pixel_2_valid_out		<= 0;
			  
			PE29_Pixel_0_out			<= 0;
			PE29_Pixel_0_valid_out		<= 0;
			PE29_Pixel_1_out			<= 0;
			PE29_Pixel_1_valid_out		<= 0;
			PE29_Pixel_2_out			<= 0;
			PE29_Pixel_2_valid_out		<= 0;
			
			PE30_Pixel_0_out			<= 0;
			PE30_Pixel_0_valid_out		<= 0;
			PE30_Pixel_1_out			<= 0;
			PE30_Pixel_1_valid_out		<= 0;
			PE30_Pixel_2_out			<= 0;
			PE30_Pixel_2_valid_out		<= 0;
              
			PE31_Pixel_0_out			<= 0;
			PE31_Pixel_0_valid_out		<= 0;
			PE31_Pixel_1_out			<= 0;
			PE31_Pixel_1_valid_out		<= 0;
			PE31_Pixel_2_out			<= 0;
			PE31_Pixel_2_valid_out		<= 0;
              
			PE32_Pixel_0_out			<= 0;
			PE32_Pixel_0_valid_out		<= 0;
			PE32_Pixel_1_out			<= 0;
			PE32_Pixel_1_valid_out		<= 0;
			PE32_Pixel_2_out			<= 0;
			PE32_Pixel_2_valid_out		<= 0;
			  
			PE33_Pixel_0_out			<= 0;
			PE33_Pixel_0_valid_out		<= 0;
			PE33_Pixel_1_out			<= 0;
			PE33_Pixel_1_valid_out		<= 0;
			PE33_Pixel_2_out			<= 0;
			PE33_Pixel_2_valid_out		<= 0;
			  
			PE34_Pixel_0_out			<= 0;
			PE34_Pixel_0_valid_out		<= 0;
			PE34_Pixel_1_out			<= 0;
			PE34_Pixel_1_valid_out		<= 0;
			PE34_Pixel_2_out			<= 0;
			PE34_Pixel_2_valid_out		<= 0;
			  
			PE35_Pixel_0_out			<= 0;
			PE35_Pixel_0_valid_out		<= 0;
			PE35_Pixel_1_out			<= 0;
			PE35_Pixel_1_valid_out		<= 0;
			PE35_Pixel_2_out			<= 0;
			PE35_Pixel_2_valid_out		<= 0;
			  
			PE36_Pixel_0_out			<= 0;
			PE36_Pixel_0_valid_out		<= 0;
			PE36_Pixel_1_out			<= 0;
			PE36_Pixel_1_valid_out		<= 0;
			PE36_Pixel_2_out			<= 0;
			PE36_Pixel_2_valid_out		<= 0;
			  
			PE37_Pixel_0_out			<= 0;
			PE37_Pixel_0_valid_out		<= 0;
			PE37_Pixel_1_out			<= 0;
			PE37_Pixel_1_valid_out		<= 0;
			PE37_Pixel_2_out			<= 0;
			PE37_Pixel_2_valid_out		<= 0;
			  
			PE38_Pixel_0_out			<= 0;
			PE38_Pixel_0_valid_out		<= 0;
			PE38_Pixel_1_out			<= 0;
			PE38_Pixel_1_valid_out		<= 0;
			PE38_Pixel_2_out			<= 0;
			PE38_Pixel_2_valid_out		<= 0;
			  
			PE39_Pixel_0_out			<= 0;
			PE39_Pixel_0_valid_out		<= 0;
			PE39_Pixel_1_out			<= 0;
			PE39_Pixel_1_valid_out		<= 0;
			PE39_Pixel_2_out			<= 0;
			PE39_Pixel_2_valid_out		<= 0;

			Parity_PE_Selection_rg		<= 0;
		end	
		else begin	
			if(En_in) begin
				PE0_Pixel_0_out				<= PE0_Pixel_0_out_wr;
				PE0_Pixel_0_valid_out		<= PE0_Pixel_0_valid_out_wr;
				PE0_Pixel_1_out				<= PE0_Pixel_1_out_wr;
				PE0_Pixel_1_valid_out		<= PE0_Pixel_1_valid_out_wr;
				PE0_Pixel_2_out				<= PE0_Pixel_2_out_wr;
				PE0_Pixel_2_valid_out		<= PE0_Pixel_2_valid_out_wr;
											
				PE1_Pixel_0_out				<= PE1_Pixel_0_out_wr;
				PE1_Pixel_0_valid_out		<= PE1_Pixel_0_valid_out_wr;
				PE1_Pixel_1_out				<= PE1_Pixel_1_out_wr;
				PE1_Pixel_1_valid_out		<= PE1_Pixel_1_valid_out_wr;
				PE1_Pixel_2_out				<= PE1_Pixel_2_out_wr;
				PE1_Pixel_2_valid_out		<= PE1_Pixel_2_valid_out_wr;
											
				PE2_Pixel_0_out				<= PE2_Pixel_0_out_wr;
				PE2_Pixel_0_valid_out		<= PE2_Pixel_0_valid_out_wr;
				PE2_Pixel_1_out				<= PE2_Pixel_1_out_wr;
				PE2_Pixel_1_valid_out		<= PE2_Pixel_1_valid_out_wr;
				PE2_Pixel_2_out				<= PE2_Pixel_2_out_wr;
				PE2_Pixel_2_valid_out		<= PE2_Pixel_2_valid_out_wr;
											
				PE3_Pixel_0_out				<= PE3_Pixel_0_out_wr;
				PE3_Pixel_0_valid_out		<= PE3_Pixel_0_valid_out_wr;
				PE3_Pixel_1_out				<= PE3_Pixel_1_out_wr;
				PE3_Pixel_1_valid_out		<= PE3_Pixel_1_valid_out_wr;
				PE3_Pixel_2_out				<= PE3_Pixel_2_out_wr;
				PE3_Pixel_2_valid_out		<= PE3_Pixel_2_valid_out_wr;
											
				PE4_Pixel_0_out				<= PE4_Pixel_0_out_wr;
				PE4_Pixel_0_valid_out		<= PE4_Pixel_0_valid_out_wr;
				PE4_Pixel_1_out				<= PE4_Pixel_1_out_wr;
				PE4_Pixel_1_valid_out		<= PE4_Pixel_1_valid_out_wr;
				PE4_Pixel_2_out				<= PE4_Pixel_2_out_wr;
				PE4_Pixel_2_valid_out		<= PE4_Pixel_2_valid_out_wr;
											
				PE5_Pixel_0_out				<= PE5_Pixel_0_out_wr;
				PE5_Pixel_0_valid_out		<= PE5_Pixel_0_valid_out_wr;
				PE5_Pixel_1_out				<= PE5_Pixel_1_out_wr;
				PE5_Pixel_1_valid_out		<= PE5_Pixel_1_valid_out_wr;
				PE5_Pixel_2_out				<= PE5_Pixel_2_out_wr;
				PE5_Pixel_2_valid_out		<= PE5_Pixel_2_valid_out_wr;
											
				PE6_Pixel_0_out				<= PE6_Pixel_0_out_wr;
				PE6_Pixel_0_valid_out		<= PE6_Pixel_0_valid_out_wr;
				PE6_Pixel_1_out				<= PE6_Pixel_1_out_wr;
				PE6_Pixel_1_valid_out		<= PE6_Pixel_1_valid_out_wr;
				PE6_Pixel_2_out				<= PE6_Pixel_2_out_wr;
				PE6_Pixel_2_valid_out		<= PE6_Pixel_2_valid_out_wr;
											
				PE7_Pixel_0_out				<= PE7_Pixel_0_out_wr;
				PE7_Pixel_0_valid_out		<= PE7_Pixel_0_valid_out_wr;
				PE7_Pixel_1_out				<= PE7_Pixel_1_out_wr;
				PE7_Pixel_1_valid_out		<= PE7_Pixel_1_valid_out_wr;
				PE7_Pixel_2_out				<= PE7_Pixel_2_out_wr;
				PE7_Pixel_2_valid_out		<= PE7_Pixel_2_valid_out_wr;
											
				PE8_Pixel_0_out				<= PE8_Pixel_0_out_wr;
				PE8_Pixel_0_valid_out		<= PE8_Pixel_0_valid_out_wr;
				PE8_Pixel_1_out				<= PE8_Pixel_1_out_wr;
				PE8_Pixel_1_valid_out		<= PE8_Pixel_1_valid_out_wr;
				PE8_Pixel_2_out				<= PE8_Pixel_2_out_wr;
				PE8_Pixel_2_valid_out		<= PE8_Pixel_2_valid_out_wr;
											
				PE9_Pixel_0_out				<= PE9_Pixel_0_out_wr;
				PE9_Pixel_0_valid_out		<= PE9_Pixel_0_valid_out_wr;
				PE9_Pixel_1_out				<= PE9_Pixel_1_out_wr;
				PE9_Pixel_1_valid_out		<= PE9_Pixel_1_valid_out_wr;
				PE9_Pixel_2_out				<= PE9_Pixel_2_out_wr;
				PE9_Pixel_2_valid_out		<= PE9_Pixel_2_valid_out_wr;
											
				PE10_Pixel_0_out			<= PE10_Pixel_0_out_wr;
				PE10_Pixel_0_valid_out		<= PE10_Pixel_0_valid_out_wr;
				PE10_Pixel_1_out			<= PE10_Pixel_1_out_wr;
				PE10_Pixel_1_valid_out		<= PE10_Pixel_1_valid_out_wr;
				PE10_Pixel_2_out			<= PE10_Pixel_2_out_wr;
				PE10_Pixel_2_valid_out		<= PE10_Pixel_2_valid_out_wr;
											
				PE11_Pixel_0_out			<= PE11_Pixel_0_out_wr;
				PE11_Pixel_0_valid_out		<= PE11_Pixel_0_valid_out_wr;
				PE11_Pixel_1_out			<= PE11_Pixel_1_out_wr;
				PE11_Pixel_1_valid_out		<= PE11_Pixel_1_valid_out_wr;
				PE11_Pixel_2_out			<= PE11_Pixel_2_out_wr;
				PE11_Pixel_2_valid_out		<= PE11_Pixel_2_valid_out_wr;
											
				PE12_Pixel_0_out			<= PE12_Pixel_0_out_wr;
				PE12_Pixel_0_valid_out		<= PE12_Pixel_0_valid_out_wr;
				PE12_Pixel_1_out			<= PE12_Pixel_1_out_wr;
				PE12_Pixel_1_valid_out		<= PE12_Pixel_1_valid_out_wr;
				PE12_Pixel_2_out			<= PE12_Pixel_2_out_wr;
				PE12_Pixel_2_valid_out		<= PE12_Pixel_2_valid_out_wr;
											
				PE13_Pixel_0_out			<= PE13_Pixel_0_out_wr;
				PE13_Pixel_0_valid_out		<= PE13_Pixel_0_valid_out_wr;
				PE13_Pixel_1_out			<= PE13_Pixel_1_out_wr;
				PE13_Pixel_1_valid_out		<= PE13_Pixel_1_valid_out_wr;
				PE13_Pixel_2_out			<= PE13_Pixel_2_out_wr;
				PE13_Pixel_2_valid_out		<= PE13_Pixel_2_valid_out_wr;
											
				PE14_Pixel_0_out			<= PE14_Pixel_0_out_wr;
				PE14_Pixel_0_valid_out		<= PE14_Pixel_0_valid_out_wr;
				PE14_Pixel_1_out			<= PE14_Pixel_1_out_wr;
				PE14_Pixel_1_valid_out		<= PE14_Pixel_1_valid_out_wr;
				PE14_Pixel_2_out			<= PE14_Pixel_2_out_wr;
				PE14_Pixel_2_valid_out		<= PE14_Pixel_2_valid_out_wr;
											
				PE15_Pixel_0_out			<= PE15_Pixel_0_out_wr;
				PE15_Pixel_0_valid_out		<= PE15_Pixel_0_valid_out_wr;
				PE15_Pixel_1_out			<= PE15_Pixel_1_out_wr;
				PE15_Pixel_1_valid_out		<= PE15_Pixel_1_valid_out_wr;
				PE15_Pixel_2_out			<= PE15_Pixel_2_out_wr;
				PE15_Pixel_2_valid_out		<= PE15_Pixel_2_valid_out_wr;
											
				PE16_Pixel_0_out			<= PE16_Pixel_0_out_wr;
				PE16_Pixel_0_valid_out		<= PE16_Pixel_0_valid_out_wr;
				PE16_Pixel_1_out			<= PE16_Pixel_1_out_wr;
				PE16_Pixel_1_valid_out		<= PE16_Pixel_1_valid_out_wr;
				PE16_Pixel_2_out			<= PE16_Pixel_2_out_wr;
				PE16_Pixel_2_valid_out		<= PE16_Pixel_2_valid_out_wr;
											
				PE17_Pixel_0_out			<= PE17_Pixel_0_out_wr;
				PE17_Pixel_0_valid_out		<= PE17_Pixel_0_valid_out_wr;
				PE17_Pixel_1_out			<= PE17_Pixel_1_out_wr;
				PE17_Pixel_1_valid_out		<= PE17_Pixel_1_valid_out_wr;
				PE17_Pixel_2_out			<= PE17_Pixel_2_out_wr;
				PE17_Pixel_2_valid_out		<= PE17_Pixel_2_valid_out_wr;
											
				PE18_Pixel_0_out			<= PE18_Pixel_0_out_wr;
				PE18_Pixel_0_valid_out		<= PE18_Pixel_0_valid_out_wr;
				PE18_Pixel_1_out			<= PE18_Pixel_1_out_wr;
				PE18_Pixel_1_valid_out		<= PE18_Pixel_1_valid_out_wr;
				PE18_Pixel_2_out			<= PE18_Pixel_2_out_wr;
				PE18_Pixel_2_valid_out		<= PE18_Pixel_2_valid_out_wr;
											
				PE19_Pixel_0_out			<= PE19_Pixel_0_out_wr;
				PE19_Pixel_0_valid_out		<= PE19_Pixel_0_valid_out_wr;
				PE19_Pixel_1_out			<= PE19_Pixel_1_out_wr;
				PE19_Pixel_1_valid_out		<= PE19_Pixel_1_valid_out_wr;
				PE19_Pixel_2_out			<= PE19_Pixel_2_out_wr;
				PE19_Pixel_2_valid_out		<= PE19_Pixel_2_valid_out_wr;

                PE20_Pixel_0_out			<= PE20_Pixel_0_out_wr;
				PE20_Pixel_0_valid_out		<= PE20_Pixel_0_valid_out_wr;
				PE20_Pixel_1_out			<= PE20_Pixel_1_out_wr;
				PE20_Pixel_1_valid_out		<= PE20_Pixel_1_valid_out_wr;
				PE20_Pixel_2_out			<= PE20_Pixel_2_out_wr;
				PE20_Pixel_2_valid_out		<= PE20_Pixel_2_valid_out_wr;
											
				PE21_Pixel_0_out			<= PE21_Pixel_0_out_wr;
				PE21_Pixel_0_valid_out		<= PE21_Pixel_0_valid_out_wr;
				PE21_Pixel_1_out			<= PE21_Pixel_1_out_wr;
				PE21_Pixel_1_valid_out		<= PE21_Pixel_1_valid_out_wr;
				PE21_Pixel_2_out			<= PE21_Pixel_2_out_wr;
				PE21_Pixel_2_valid_out		<= PE21_Pixel_2_valid_out_wr;
											
				PE22_Pixel_0_out			<= PE22_Pixel_0_out_wr;
				PE22_Pixel_0_valid_out		<= PE22_Pixel_0_valid_out_wr;
				PE22_Pixel_1_out			<= PE22_Pixel_1_out_wr;
				PE22_Pixel_1_valid_out		<= PE22_Pixel_1_valid_out_wr;
				PE22_Pixel_2_out			<= PE22_Pixel_2_out_wr;
				PE22_Pixel_2_valid_out		<= PE22_Pixel_2_valid_out_wr;
											
				PE23_Pixel_0_out			<= PE23_Pixel_0_out_wr;
				PE23_Pixel_0_valid_out		<= PE23_Pixel_0_valid_out_wr;
				PE23_Pixel_1_out			<= PE23_Pixel_1_out_wr;
				PE23_Pixel_1_valid_out		<= PE23_Pixel_1_valid_out_wr;
				PE23_Pixel_2_out			<= PE23_Pixel_2_out_wr;
				PE23_Pixel_2_valid_out		<= PE23_Pixel_2_valid_out_wr;
											
				PE24_Pixel_0_out			<= PE24_Pixel_0_out_wr;
				PE24_Pixel_0_valid_out		<= PE24_Pixel_0_valid_out_wr;
				PE24_Pixel_1_out			<= PE24_Pixel_1_out_wr;
				PE24_Pixel_1_valid_out		<= PE24_Pixel_1_valid_out_wr;
				PE24_Pixel_2_out			<= PE24_Pixel_2_out_wr;
				PE24_Pixel_2_valid_out		<= PE24_Pixel_2_valid_out_wr;
											
				PE25_Pixel_0_out			<= PE25_Pixel_0_out_wr;
				PE25_Pixel_0_valid_out		<= PE25_Pixel_0_valid_out_wr;
				PE25_Pixel_1_out			<= PE25_Pixel_1_out_wr;
				PE25_Pixel_1_valid_out		<= PE25_Pixel_1_valid_out_wr;
				PE25_Pixel_2_out			<= PE25_Pixel_2_out_wr;
				PE25_Pixel_2_valid_out		<= PE25_Pixel_2_valid_out_wr;
											
				PE26_Pixel_0_out			<= PE26_Pixel_0_out_wr;
				PE26_Pixel_0_valid_out		<= PE26_Pixel_0_valid_out_wr;
				PE26_Pixel_1_out			<= PE26_Pixel_1_out_wr;
				PE26_Pixel_1_valid_out		<= PE26_Pixel_1_valid_out_wr;
				PE26_Pixel_2_out			<= PE26_Pixel_2_out_wr;
				PE26_Pixel_2_valid_out		<= PE26_Pixel_2_valid_out_wr;
											
				PE27_Pixel_0_out			<= PE27_Pixel_0_out_wr;
				PE27_Pixel_0_valid_out		<= PE27_Pixel_0_valid_out_wr;
				PE27_Pixel_1_out			<= PE27_Pixel_1_out_wr;
				PE27_Pixel_1_valid_out		<= PE27_Pixel_1_valid_out_wr;
				PE27_Pixel_2_out			<= PE27_Pixel_2_out_wr;
				PE27_Pixel_2_valid_out		<= PE27_Pixel_2_valid_out_wr;
											
				PE28_Pixel_0_out			<= PE28_Pixel_0_out_wr;
				PE28_Pixel_0_valid_out		<= PE28_Pixel_0_valid_out_wr;
				PE28_Pixel_1_out			<= PE28_Pixel_1_out_wr;
				PE28_Pixel_1_valid_out		<= PE28_Pixel_1_valid_out_wr;
				PE28_Pixel_2_out			<= PE28_Pixel_2_out_wr;
				PE28_Pixel_2_valid_out		<= PE28_Pixel_2_valid_out_wr;
											
				PE29_Pixel_0_out			<= PE29_Pixel_0_out_wr;
				PE29_Pixel_0_valid_out		<= PE29_Pixel_0_valid_out_wr;
				PE29_Pixel_1_out			<= PE29_Pixel_1_out_wr;
				PE29_Pixel_1_valid_out		<= PE29_Pixel_1_valid_out_wr;
				PE29_Pixel_2_out			<= PE29_Pixel_2_out_wr;
				PE29_Pixel_2_valid_out		<= PE29_Pixel_2_valid_out_wr;

				PE30_Pixel_0_out			<= PE30_Pixel_0_out_wr;
				PE30_Pixel_0_valid_out		<= PE30_Pixel_0_valid_out_wr;
				PE30_Pixel_1_out			<= PE30_Pixel_1_out_wr;
				PE30_Pixel_1_valid_out		<= PE30_Pixel_1_valid_out_wr;
				PE30_Pixel_2_out			<= PE30_Pixel_2_out_wr;
				PE30_Pixel_2_valid_out		<= PE30_Pixel_2_valid_out_wr;
											
				PE31_Pixel_0_out			<= PE31_Pixel_0_out_wr;
				PE31_Pixel_0_valid_out		<= PE31_Pixel_0_valid_out_wr;
				PE31_Pixel_1_out			<= PE31_Pixel_1_out_wr;
				PE31_Pixel_1_valid_out		<= PE31_Pixel_1_valid_out_wr;
				PE31_Pixel_2_out			<= PE31_Pixel_2_out_wr;
				PE31_Pixel_2_valid_out		<= PE31_Pixel_2_valid_out_wr;
											
				PE32_Pixel_0_out			<= PE32_Pixel_0_out_wr;
				PE32_Pixel_0_valid_out		<= PE32_Pixel_0_valid_out_wr;
				PE32_Pixel_1_out			<= PE32_Pixel_1_out_wr;
				PE32_Pixel_1_valid_out		<= PE32_Pixel_1_valid_out_wr;
				PE32_Pixel_2_out			<= PE32_Pixel_2_out_wr;
				PE32_Pixel_2_valid_out		<= PE32_Pixel_2_valid_out_wr;
											
				PE33_Pixel_0_out			<= PE33_Pixel_0_out_wr;
				PE33_Pixel_0_valid_out		<= PE33_Pixel_0_valid_out_wr;
				PE33_Pixel_1_out			<= PE33_Pixel_1_out_wr;
				PE33_Pixel_1_valid_out		<= PE33_Pixel_1_valid_out_wr;
				PE33_Pixel_2_out			<= PE33_Pixel_2_out_wr;
				PE33_Pixel_2_valid_out		<= PE33_Pixel_2_valid_out_wr;
											
				PE34_Pixel_0_out			<= PE34_Pixel_0_out_wr;
				PE34_Pixel_0_valid_out		<= PE34_Pixel_0_valid_out_wr;
				PE34_Pixel_1_out			<= PE34_Pixel_1_out_wr;
				PE34_Pixel_1_valid_out		<= PE34_Pixel_1_valid_out_wr;
				PE34_Pixel_2_out			<= PE34_Pixel_2_out_wr;
				PE34_Pixel_2_valid_out		<= PE34_Pixel_2_valid_out_wr;
											
				PE35_Pixel_0_out			<= PE35_Pixel_0_out_wr;
				PE35_Pixel_0_valid_out		<= PE35_Pixel_0_valid_out_wr;
				PE35_Pixel_1_out			<= PE35_Pixel_1_out_wr;
				PE35_Pixel_1_valid_out		<= PE35_Pixel_1_valid_out_wr;
				PE35_Pixel_2_out			<= PE35_Pixel_2_out_wr;
				PE35_Pixel_2_valid_out		<= PE35_Pixel_2_valid_out_wr;
											
				PE36_Pixel_0_out			<= PE36_Pixel_0_out_wr;
				PE36_Pixel_0_valid_out		<= PE36_Pixel_0_valid_out_wr;
				PE36_Pixel_1_out			<= PE36_Pixel_1_out_wr;
				PE36_Pixel_1_valid_out		<= PE36_Pixel_1_valid_out_wr;
				PE36_Pixel_2_out			<= PE36_Pixel_2_out_wr;
				PE36_Pixel_2_valid_out		<= PE36_Pixel_2_valid_out_wr;
											
				PE37_Pixel_0_out			<= PE37_Pixel_0_out_wr;
				PE37_Pixel_0_valid_out		<= PE37_Pixel_0_valid_out_wr;
				PE37_Pixel_1_out			<= PE37_Pixel_1_out_wr;
				PE37_Pixel_1_valid_out		<= PE37_Pixel_1_valid_out_wr;
				PE37_Pixel_2_out			<= PE37_Pixel_2_out_wr;
				PE37_Pixel_2_valid_out		<= PE37_Pixel_2_valid_out_wr;
											
				PE38_Pixel_0_out			<= PE38_Pixel_0_out_wr;
				PE38_Pixel_0_valid_out		<= PE38_Pixel_0_valid_out_wr;
				PE38_Pixel_1_out			<= PE38_Pixel_1_out_wr;
				PE38_Pixel_1_valid_out		<= PE38_Pixel_1_valid_out_wr;
				PE38_Pixel_2_out			<= PE38_Pixel_2_out_wr;
				PE38_Pixel_2_valid_out		<= PE38_Pixel_2_valid_out_wr;
											
				PE39_Pixel_0_out			<= PE39_Pixel_0_out_wr;
				PE39_Pixel_0_valid_out		<= PE39_Pixel_0_valid_out_wr;
				PE39_Pixel_1_out			<= PE39_Pixel_1_out_wr;
				PE39_Pixel_1_valid_out		<= PE39_Pixel_1_valid_out_wr;
				PE39_Pixel_2_out			<= PE39_Pixel_2_out_wr;
				PE39_Pixel_2_valid_out		<= PE39_Pixel_2_valid_out_wr;

			end
			else begin
				PE0_Pixel_0_out				<= 0;
				PE0_Pixel_0_valid_out		<= 0;
				PE0_Pixel_1_out				<= 0;
				PE0_Pixel_1_valid_out		<= 0;
				PE0_Pixel_2_out				<= 0;
				PE0_Pixel_2_valid_out		<= 0;
				  
				PE1_Pixel_0_out				<= 0;
				PE1_Pixel_0_valid_out		<= 0;
				PE1_Pixel_1_out				<= 0;
				PE1_Pixel_1_valid_out		<= 0;
				PE1_Pixel_2_out				<= 0;
				PE1_Pixel_2_valid_out		<= 0;
				  
				PE2_Pixel_0_out				<= 0;
				PE2_Pixel_0_valid_out		<= 0;
				PE2_Pixel_1_out				<= 0;
				PE2_Pixel_1_valid_out		<= 0;
				PE2_Pixel_2_out				<= 0;
				PE2_Pixel_2_valid_out		<= 0;
				  
				PE3_Pixel_0_out				<= 0;
				PE3_Pixel_0_valid_out		<= 0;
				PE3_Pixel_1_out				<= 0;
				PE3_Pixel_1_valid_out		<= 0;
				PE3_Pixel_2_out				<= 0;
				PE3_Pixel_2_valid_out		<= 0;
				  
				PE4_Pixel_0_out				<= 0;
				PE4_Pixel_0_valid_out		<= 0;
				PE4_Pixel_1_out				<= 0;
				PE4_Pixel_1_valid_out		<= 0;
				PE4_Pixel_2_out				<= 0;
				PE4_Pixel_2_valid_out		<= 0;
				  
				PE5_Pixel_0_out				<= 0;
				PE5_Pixel_0_valid_out		<= 0;
				PE5_Pixel_1_out				<= 0;
				PE5_Pixel_1_valid_out		<= 0;
				PE5_Pixel_2_out				<= 0;
				PE5_Pixel_2_valid_out		<= 0;
				  
				PE6_Pixel_0_out				<= 0;
				PE6_Pixel_0_valid_out		<= 0;
				PE6_Pixel_1_out				<= 0;
				PE6_Pixel_1_valid_out		<= 0;
				PE6_Pixel_2_out				<= 0;
				PE6_Pixel_2_valid_out		<= 0;
				  
				PE7_Pixel_0_out				<= 0;
				PE7_Pixel_0_valid_out		<= 0;
				PE7_Pixel_1_out				<= 0;
				PE7_Pixel_1_valid_out		<= 0;
				PE7_Pixel_2_out				<= 0;
				PE7_Pixel_2_valid_out		<= 0;
				  
				PE8_Pixel_0_out				<= 0;
				PE8_Pixel_0_valid_out		<= 0;
				PE8_Pixel_1_out				<= 0;
				PE8_Pixel_1_valid_out		<= 0;
				PE8_Pixel_2_out				<= 0;
				PE8_Pixel_2_valid_out		<= 0;
				  
				PE9_Pixel_0_out				<= 0;
				PE9_Pixel_0_valid_out		<= 0;
				PE9_Pixel_1_out				<= 0;
				PE9_Pixel_1_valid_out		<= 0;
				PE9_Pixel_2_out				<= 0;
				PE9_Pixel_2_valid_out		<= 0;
				
				PE10_Pixel_0_out			<= 0;
				PE10_Pixel_0_valid_out		<= 0;
				PE10_Pixel_1_out			<= 0;
				PE10_Pixel_1_valid_out		<= 0;
				PE10_Pixel_2_out			<= 0;
				PE10_Pixel_2_valid_out		<= 0;
				  
				PE11_Pixel_0_out			<= 0;
				PE11_Pixel_0_valid_out		<= 0;
				PE11_Pixel_1_out			<= 0;
				PE11_Pixel_1_valid_out		<= 0;
				PE11_Pixel_2_out			<= 0;
				PE11_Pixel_2_valid_out		<= 0;
				  
				PE12_Pixel_0_out			<= 0;
				PE12_Pixel_0_valid_out		<= 0;
				PE12_Pixel_1_out			<= 0;
				PE12_Pixel_1_valid_out		<= 0;
				PE12_Pixel_2_out			<= 0;
				PE12_Pixel_2_valid_out		<= 0;
				  
				PE13_Pixel_0_out			<= 0;
				PE13_Pixel_0_valid_out		<= 0;
				PE13_Pixel_1_out			<= 0;
				PE13_Pixel_1_valid_out		<= 0;
				PE13_Pixel_2_out			<= 0;
				PE13_Pixel_2_valid_out		<= 0;
				  
				PE14_Pixel_0_out			<= 0;
				PE14_Pixel_0_valid_out		<= 0;
				PE14_Pixel_1_out			<= 0;
				PE14_Pixel_1_valid_out		<= 0;
				PE14_Pixel_2_out			<= 0;
				PE14_Pixel_2_valid_out		<= 0;
				  
				PE15_Pixel_0_out			<= 0;
				PE15_Pixel_0_valid_out		<= 0;
				PE15_Pixel_1_out			<= 0;
				PE15_Pixel_1_valid_out		<= 0;
				PE15_Pixel_2_out			<= 0;
				PE15_Pixel_2_valid_out		<= 0;
				  
				PE16_Pixel_0_out			<= 0;
				PE16_Pixel_0_valid_out		<= 0;
				PE16_Pixel_1_out			<= 0;
				PE16_Pixel_1_valid_out		<= 0;
				PE16_Pixel_2_out			<= 0;
				PE16_Pixel_2_valid_out		<= 0;
				  
				PE17_Pixel_0_out			<= 0;
				PE17_Pixel_0_valid_out		<= 0;
				PE17_Pixel_1_out			<= 0;
				PE17_Pixel_1_valid_out		<= 0;
				PE17_Pixel_2_out			<= 0;
				PE17_Pixel_2_valid_out		<= 0;
				  
				PE18_Pixel_0_out			<= 0;
				PE18_Pixel_0_valid_out		<= 0;
				PE18_Pixel_1_out			<= 0;
				PE18_Pixel_1_valid_out		<= 0;
				PE18_Pixel_2_out			<= 0;
				PE18_Pixel_2_valid_out		<= 0;
				  
				PE19_Pixel_0_out			<= 0;
				PE19_Pixel_0_valid_out		<= 0;
				PE19_Pixel_1_out			<= 0;
				PE19_Pixel_1_valid_out		<= 0;
				PE19_Pixel_2_out			<= 0;
				PE19_Pixel_2_valid_out		<= 0;	

				PE20_Pixel_0_out			<= 0;
				PE20_Pixel_0_valid_out		<= 0;
				PE20_Pixel_1_out			<= 0;
				PE20_Pixel_1_valid_out		<= 0;
				PE20_Pixel_2_out			<= 0;
				PE20_Pixel_2_valid_out		<= 0;
				  
				PE21_Pixel_0_out			<= 0;
				PE21_Pixel_0_valid_out		<= 0;
				PE21_Pixel_1_out			<= 0;
				PE21_Pixel_1_valid_out		<= 0;
				PE21_Pixel_2_out			<= 0;
				PE21_Pixel_2_valid_out		<= 0;
				  
				PE22_Pixel_0_out			<= 0;
				PE22_Pixel_0_valid_out		<= 0;
				PE22_Pixel_1_out			<= 0;
				PE22_Pixel_1_valid_out		<= 0;
				PE22_Pixel_2_out			<= 0;
				PE22_Pixel_2_valid_out		<= 0;
				  
				PE23_Pixel_0_out			<= 0;
				PE23_Pixel_0_valid_out		<= 0;
				PE23_Pixel_1_out			<= 0;
				PE23_Pixel_1_valid_out		<= 0;
				PE23_Pixel_2_out			<= 0;
				PE23_Pixel_2_valid_out		<= 0;
				  
				PE24_Pixel_0_out			<= 0;
				PE24_Pixel_0_valid_out		<= 0;
				PE24_Pixel_1_out			<= 0;
				PE24_Pixel_1_valid_out		<= 0;
				PE24_Pixel_2_out			<= 0;
				PE24_Pixel_2_valid_out		<= 0;
				  
				PE25_Pixel_0_out			<= 0;
				PE25_Pixel_0_valid_out		<= 0;
				PE25_Pixel_1_out			<= 0;
				PE25_Pixel_1_valid_out		<= 0;
				PE25_Pixel_2_out			<= 0;
				PE25_Pixel_2_valid_out		<= 0;
				  
				PE26_Pixel_0_out			<= 0;
				PE26_Pixel_0_valid_out		<= 0;
				PE26_Pixel_1_out			<= 0;
				PE26_Pixel_1_valid_out		<= 0;
				PE26_Pixel_2_out			<= 0;
				PE26_Pixel_2_valid_out		<= 0;
				  
				PE27_Pixel_0_out			<= 0;
				PE27_Pixel_0_valid_out		<= 0;
				PE27_Pixel_1_out			<= 0;
				PE27_Pixel_1_valid_out		<= 0;
				PE27_Pixel_2_out			<= 0;
				PE27_Pixel_2_valid_out		<= 0;
				  
				PE28_Pixel_0_out			<= 0;
				PE28_Pixel_0_valid_out		<= 0;
				PE28_Pixel_1_out			<= 0;
				PE28_Pixel_1_valid_out		<= 0;
				PE28_Pixel_2_out			<= 0;
				PE28_Pixel_2_valid_out		<= 0;
				  
				PE29_Pixel_0_out			<= 0;
				PE29_Pixel_0_valid_out		<= 0;
				PE29_Pixel_1_out			<= 0;
				PE29_Pixel_1_valid_out		<= 0;
				PE29_Pixel_2_out			<= 0;
				PE29_Pixel_2_valid_out		<= 0;
				
				PE30_Pixel_0_out			<= 0;
				PE30_Pixel_0_valid_out		<= 0;
				PE30_Pixel_1_out			<= 0;
				PE30_Pixel_1_valid_out		<= 0;
				PE30_Pixel_2_out			<= 0;
				PE30_Pixel_2_valid_out		<= 0;
				  
				PE31_Pixel_0_out			<= 0;
				PE31_Pixel_0_valid_out		<= 0;
				PE31_Pixel_1_out			<= 0;
				PE31_Pixel_1_valid_out		<= 0;
				PE31_Pixel_2_out			<= 0;
				PE31_Pixel_2_valid_out		<= 0;
				  
				PE32_Pixel_0_out			<= 0;
				PE32_Pixel_0_valid_out		<= 0;
				PE32_Pixel_1_out			<= 0;
				PE32_Pixel_1_valid_out		<= 0;
				PE32_Pixel_2_out			<= 0;
				PE32_Pixel_2_valid_out		<= 0;
				  
				PE33_Pixel_0_out			<= 0;
				PE33_Pixel_0_valid_out		<= 0;
				PE33_Pixel_1_out			<= 0;
				PE33_Pixel_1_valid_out		<= 0;
				PE33_Pixel_2_out			<= 0;
				PE33_Pixel_2_valid_out		<= 0;
				  
				PE34_Pixel_0_out			<= 0;
				PE34_Pixel_0_valid_out		<= 0;
				PE34_Pixel_1_out			<= 0;
				PE34_Pixel_1_valid_out		<= 0;
				PE34_Pixel_2_out			<= 0;
				PE34_Pixel_2_valid_out		<= 0;
				  
				PE35_Pixel_0_out			<= 0;
				PE35_Pixel_0_valid_out		<= 0;
				PE35_Pixel_1_out			<= 0;
				PE35_Pixel_1_valid_out		<= 0;
				PE35_Pixel_2_out			<= 0;
				PE35_Pixel_2_valid_out		<= 0;
				  
				PE36_Pixel_0_out			<= 0;
				PE36_Pixel_0_valid_out		<= 0;
				PE36_Pixel_1_out			<= 0;
				PE36_Pixel_1_valid_out		<= 0;
				PE36_Pixel_2_out			<= 0;
				PE36_Pixel_2_valid_out		<= 0;
				  
				PE37_Pixel_0_out			<= 0;
				PE37_Pixel_0_valid_out		<= 0;
				PE37_Pixel_1_out			<= 0;
				PE37_Pixel_1_valid_out		<= 0;
				PE37_Pixel_2_out			<= 0;
				PE37_Pixel_2_valid_out		<= 0;
				  
				PE38_Pixel_0_out			<= 0;
				PE38_Pixel_0_valid_out		<= 0;
				PE38_Pixel_1_out			<= 0;
				PE38_Pixel_1_valid_out		<= 0;
				PE38_Pixel_2_out			<= 0;
				PE38_Pixel_2_valid_out		<= 0;
				  
				PE39_Pixel_0_out			<= 0;
				PE39_Pixel_0_valid_out		<= 0;
				PE39_Pixel_1_out			<= 0;
				PE39_Pixel_1_valid_out		<= 0;
				PE39_Pixel_2_out			<= 0;
				PE39_Pixel_2_valid_out		<= 0;

			end
		end
	  end
endmodule

module MUX_4_1 
(
	input [`DATA_WIDTH-1:0] data0_in,
	input [`DATA_WIDTH-1:0] data1_in,
	input [`DATA_WIDTH-1:0] data2_in,
	input [`DATA_WIDTH-1:0] data3_in,
	input [1:0] sel_in,
	output reg [`DATA_WIDTH-1:0] mux_4_1_out
);

	always @*
    case(sel_in)
		2'b00: mux_4_1_out = data0_in;
		2'b01: mux_4_1_out = data1_in;
		2'b10: mux_4_1_out = data2_in;
		2'b11: mux_4_1_out = data3_in;
		default: mux_4_1_out = data0_in;
    endcase

endmodule

module MUX_8_1
(
	input [`DATA_WIDTH-1:0] data0_in,
	input [`DATA_WIDTH-1:0] data1_in,
	input [`DATA_WIDTH-1:0] data2_in,
	input [`DATA_WIDTH-1:0] data3_in,
	input [`DATA_WIDTH-1:0] data4_in,
	input [`DATA_WIDTH-1:0] data5_in,
	input [`DATA_WIDTH-1:0] data6_in,
	input [`DATA_WIDTH-1:0] data7_in,
	input [2:0] sel_in,
	output reg [`DATA_WIDTH-1:0] mux_8_1_out
);

	wire [`DATA_WIDTH-1:0] mux_0, mux_1;

	MUX_4_1  mux0(
		.data0_in(data0_in),
		.data1_in(data1_in),
		.data2_in(data2_in),
		.data3_in(data3_in),
		.sel_in(sel_in[1:0]),
		.mux_4_1_out(mux_0)
	);

	MUX_4_1  mux1 (
		.data0_in(data4_in),
		.data1_in(data5_in),
		.data2_in(data6_in),
		.data3_in(data7_in),
		.sel_in(sel_in[1:0]),
		.mux_4_1_out(mux_1)
	);

	always @*
    case(sel_in[2:2])
		1'b0: mux_8_1_out = mux_0;
		1'b1: mux_8_1_out = mux_1;
		default: mux_8_1_out = mux_0;
    endcase

endmodule

module MUX_20_1
(
	input [`DATA_WIDTH-1:0] data0_in,
	input [`DATA_WIDTH-1:0] data1_in,
	input [`DATA_WIDTH-1:0] data2_in,
	input [`DATA_WIDTH-1:0] data3_in,
	input [`DATA_WIDTH-1:0] data4_in,
	input [`DATA_WIDTH-1:0] data5_in,
	input [`DATA_WIDTH-1:0] data6_in,
	input [`DATA_WIDTH-1:0] data7_in,
	input [`DATA_WIDTH-1:0] data8_in,
	input [`DATA_WIDTH-1:0] data9_in,
	input [`DATA_WIDTH-1:0] data10_in,
	input [`DATA_WIDTH-1:0] data11_in,
	input [`DATA_WIDTH-1:0] data12_in,
	input [`DATA_WIDTH-1:0] data13_in,
	input [`DATA_WIDTH-1:0] data14_in,
	input [`DATA_WIDTH-1:0] data15_in,
	input [`DATA_WIDTH-1:0] data16_in,
	input [`DATA_WIDTH-1:0] data17_in,
	input [`DATA_WIDTH-1:0] data18_in,
	input [`DATA_WIDTH-1:0] data19_in,
	input [4:0] sel_in,
	output reg [`DATA_WIDTH-1:0] mux_20_1_out
);

	wire [`DATA_WIDTH-1:0] mux_0, mux_1, mux_2;

	MUX_8_1  mux0(
		.data0_in(data0_in),
		.data1_in(data1_in),
		.data2_in(data2_in),
		.data3_in(data3_in),
		.data4_in(data4_in),
		.data5_in(data5_in),
		.data6_in(data6_in),
		.data7_in(data7_in),
		.sel_in(sel_in[2:0]),
		.mux_8_1_out(mux_0)
	);

	MUX_8_1   mux1 (
		.data0_in(data8_in),
		.data1_in(data9_in),
		.data2_in(data10_in),
		.data3_in(data11_in),
		.data4_in(data12_in),
		.data5_in(data13_in),
		.data6_in(data14_in),
		.data7_in(data15_in),
		.sel_in(sel_in[2:0]),
		.mux_8_1_out(mux_1)
	);

	MUX_4_1  mux2 (
		.data0_in(data16_in),
		.data1_in(data17_in),
		.data2_in(data18_in),
		.data3_in(data19_in),
		.sel_in(sel_in[1:0]),
		.mux_4_1_out(mux_2)
	);
	
	always @*
    case(sel_in[4:3])
		2'b00: mux_20_1_out = mux_0;
		2'b01: mux_20_1_out = mux_1;
		2'b10: mux_20_1_out = mux_2;
		default: mux_20_1_out = mux_0;
    endcase
endmodule

module MUX_2_1 
(
    input [`DATA_WIDTH-1:0] data0_in,
    input [`DATA_WIDTH-1:0] data1_in,
    input sel_in,
    output reg [`DATA_WIDTH-1:0] mux_2_1_out
);

    always @*
        case(sel_in)
            1'b0: mux_2_1_out = data0_in;
            1'b1: mux_2_1_out = data1_in;
            default: mux_2_1_out = data0_in;
        endcase

endmodule

module MUX_40_1 
(
    input [`DATA_WIDTH-1:0] data0_in,  input [`DATA_WIDTH-1:0] data1_in,  
    input [`DATA_WIDTH-1:0] data2_in,  input [`DATA_WIDTH-1:0] data3_in,
    input [`DATA_WIDTH-1:0] data4_in,  input [`DATA_WIDTH-1:0] data5_in,  
    input [`DATA_WIDTH-1:0] data6_in,  input [`DATA_WIDTH-1:0] data7_in,
    input [`DATA_WIDTH-1:0] data8_in,  input [`DATA_WIDTH-1:0] data9_in,  
    input [`DATA_WIDTH-1:0] data10_in, input [`DATA_WIDTH-1:0] data11_in,
    input [`DATA_WIDTH-1:0] data12_in, input [`DATA_WIDTH-1:0] data13_in,  
    input [`DATA_WIDTH-1:0] data14_in, input [`DATA_WIDTH-1:0] data15_in,
    input [`DATA_WIDTH-1:0] data16_in, input [`DATA_WIDTH-1:0] data17_in,  
    input [`DATA_WIDTH-1:0] data18_in, input [`DATA_WIDTH-1:0] data19_in,
    input [`DATA_WIDTH-1:0] data20_in, input [`DATA_WIDTH-1:0] data21_in,  
    input [`DATA_WIDTH-1:0] data22_in, input [`DATA_WIDTH-1:0] data23_in,
    input [`DATA_WIDTH-1:0] data24_in, input [`DATA_WIDTH-1:0] data25_in,  
    input [`DATA_WIDTH-1:0] data26_in, input [`DATA_WIDTH-1:0] data27_in,
    input [`DATA_WIDTH-1:0] data28_in, input [`DATA_WIDTH-1:0] data29_in,  
    input [`DATA_WIDTH-1:0] data30_in, input [`DATA_WIDTH-1:0] data31_in,
    input [`DATA_WIDTH-1:0] data32_in, input [`DATA_WIDTH-1:0] data33_in,  
    input [`DATA_WIDTH-1:0] data34_in, input [`DATA_WIDTH-1:0] data35_in,
    input [`DATA_WIDTH-1:0] data36_in, input [`DATA_WIDTH-1:0] data37_in,  
    input [`DATA_WIDTH-1:0] data38_in, input [`DATA_WIDTH-1:0] data39_in,
    input [5:0] sel_in,
    output wire [`DATA_WIDTH-1:0] mux_40_1_out
);

    wire [`DATA_WIDTH-1:0] mux_0, mux_1;

    MUX_20_1  mux0(
        .data0_in(data0_in),   .data1_in(data1_in),   .data2_in(data2_in),   .data3_in(data3_in),
        .data4_in(data4_in),   .data5_in(data5_in),   .data6_in(data6_in),   .data7_in(data7_in),
        .data8_in(data8_in),   .data9_in(data9_in),   .data10_in(data10_in), .data11_in(data11_in),
        .data12_in(data12_in), .data13_in(data13_in), .data14_in(data14_in), .data15_in(data15_in),
        .data16_in(data16_in), .data17_in(data17_in), .data18_in(data18_in), .data19_in(data19_in),
        .sel_in(sel_in[4:0]),
        .mux_20_1_out(mux_0)
    );

    MUX_20_1  mux1 (
        .data0_in(data20_in),  .data1_in(data21_in),  .data2_in(data22_in),  .data3_in(data23_in),
        .data4_in(data24_in),  .data5_in(data25_in),  .data6_in(data26_in),  .data7_in(data27_in),
        .data8_in(data28_in),  .data9_in(data29_in),  .data10_in(data30_in), .data11_in(data31_in),
        .data12_in(data32_in), .data13_in(data33_in), .data14_in(data34_in), .data15_in(data35_in),
        .data16_in(data36_in), .data17_in(data37_in), .data18_in(data38_in), .data19_in(data39_in),
        .sel_in(sel_in[4:0]),
        .mux_20_1_out(mux_1)
    );

    MUX_2_1 mux2 (
        .data0_in(mux_0),
        .data1_in(mux_1),
        .sel_in(sel_in[5]),
        .mux_2_1_out(mux_40_1_out)
    );
endmodule

