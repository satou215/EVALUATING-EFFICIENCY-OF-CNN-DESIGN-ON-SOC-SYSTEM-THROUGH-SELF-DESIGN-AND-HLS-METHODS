`timescale 1ns/1ns
module Dual_Port_RAM_1K
#(
  parameter AWIDTH = 10, // address width
  parameter DWIDTH = 32 // data width
)
(
  input clk, // clock
  ///*** Port A***///
  input ena,
  input wea,
  input [AWIDTH-1:0] addra, 
  input [DWIDTH-1:0] dina, 
  output reg [DWIDTH-1:0] douta,
  
  ///*** Port B***///
  input enb,
  input web, 
  input [AWIDTH-1:0] addrb, 
  input [DWIDTH-1:0] dinb, 
  output reg [DWIDTH-1:0] doutb,
  output wire [`LABEL-1:0] label_out
);
    
	reg  [DWIDTH-1:0] mem [2**AWIDTH-1:0];
	reg   [DWIDTH-1:0] mem0, mem1, mem2, mem3, mem4;
//    reg  [`LABEL-1:0] label_rg;
    assign label_out = (mem0 > mem1 & mem0 > mem2 & mem0 > mem3 & mem0 > mem4) ? 3'b000 : (mem1 > mem0 & mem1 > mem2 & mem1 > mem3 & mem1 > mem4 ? 3'b001 : (mem2 > mem0 & mem2 > mem1 & mem2 > mem3 & mem2 > mem4 ? 3'b010 : (mem3 > mem0 & mem3 > mem1 & mem3 > mem2 & mem3 > mem4 ? 3'b011 : (mem4 > mem0 & mem4 > mem1 & mem4 > mem2 & mem4 > mem3 ? 3'b100 : 3'b000))));
    always @(posedge clk) begin
		if (ena&enb) begin
			if(wea) begin
				mem[addra] <= dina;
			end
			else if(web) begin
				mem[addrb] <= dinb;
			end
			
			douta <= mem[addra];
			doutb <= mem[addrb];
		end
		else if(ena) begin
			if(wea) begin
				mem[addra] <= dina;
			end
			douta <= mem[addra];
		end
		else if (enb) begin
			if(web) begin
				mem[addrb] <= dinb;
			end
			doutb <= mem[addrb];
		end
		mem0 <= $signed(mem[0]);
		mem1 <= $signed(mem[1]);
		mem2 <= $signed(mem[2]);
		mem3 <= $signed(mem[3]);
		mem4 <= $signed(mem[4]);
	end
	
endmodule


module Dual_Port_RAM_16K
#(
  parameter AWIDTH = 14, // address width
  parameter DWIDTH = 32 // data width
)
(
  input clk, // clock
  ///*** Port A***///
  input ena,
  input wea,
  input [AWIDTH-1:0] addra, 
  input [DWIDTH-1:0] dina, 
  output reg [DWIDTH-1:0] douta,
  
  ///*** Port B***///
  input enb,
  input web, 
  input [AWIDTH-1:0] addrb, 
  input [DWIDTH-1:0] dinb, 
  output reg [DWIDTH-1:0] doutb
);

	reg [DWIDTH-1:0] mem [2**AWIDTH-1:0];

	always @(posedge clk) begin
		if (ena&enb) begin
			if(wea) begin
				mem[addra] <= dina;
			end
			else if(web) begin
				mem[addrb] <= dinb;
			end
			
			douta <= mem[addra];
			doutb <= mem[addrb];
		end
		else if(ena) begin
			if(wea) begin
				mem[addra] <= dina;
			end
			douta <= mem[addra];
		end
		else if (enb) begin
			if(web) begin
				mem[addrb] <= dinb;
			end
			doutb <= mem[addrb];
		end		
	end
	
endmodule