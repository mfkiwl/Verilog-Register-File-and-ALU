`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:54 03/15/2017 
// Design Name: 
// Module Name:    Reg_Cell 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reg_Cell(
    input [15:0] in,
	 input clk,
    input En,	
    output [15:0] out
    );
	 
	  generate
		  genvar i;
		  for (i=0; i < 16; i=i+1) begin: d
				DFF df(clk,En,in[i],out[i]);
		  end		  
	endgenerate


endmodule
