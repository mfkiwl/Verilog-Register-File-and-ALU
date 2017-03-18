`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:21:43 03/15/2017 
// Design Name: 
// Module Name:    Demux16 
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

module Demux16(
    input in,
    input [3:0] sel,
    output [15:0] out
    );
	 
	 wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15 ;
	 assign #8 out[0] = ~sel[3] & ~sel[2] & ~sel[1] & ~sel[0] &	in ; 
	 assign #8 out[1] = ~sel[3] & ~sel[2] & ~sel[1] &  sel[0] &	in ; 
	 assign #8 out[2] = ~sel[3] & ~sel[2] &  sel[1] & ~sel[0] &	in ; 
	 assign #8 out[3] = ~sel[3] & ~sel[2] &  sel[1] &  sel[0] &	in ; 
	 assign #8 out[4] = ~sel[3] &  sel[2] & ~sel[1] & ~sel[0] &	in ; 
	 assign #8 out[5] = ~sel[3] &  sel[2] & ~sel[1] &  sel[0] &	in ; 
	 assign #8 out[6] = ~sel[3] &  sel[2] &  sel[1] & ~sel[0] &	in ; 
	 assign #8 out[7] = ~sel[3] &  sel[2] &  sel[1] &  sel[0] &	in ; 
	 assign #8 out[8] =  sel[3] & ~sel[2] & ~sel[1] & ~sel[0] &	in ; 
	 assign #8 out[9] =  sel[3] & ~sel[2] & ~sel[1] &  sel[0] &	in ; 
	 assign #8 out[10] =  sel[3] & ~sel[2] &  sel[1] & ~sel[0] &	in ; 
	 assign #8 out[11] =  sel[3] & ~sel[2] &  sel[1] &  sel[0] &	in ; 
	 assign #8 out[12] =  sel[3] &  sel[2] & ~sel[1] & ~sel[0] &	in ; 
	 assign #8 out[13] =  sel[3] &  sel[2] & ~sel[1] &  sel[0] &	in ; 
	 assign #8 out[14] =  sel[3] &  sel[2] &  sel[1] & ~sel[0] &	in ; 
	 assign #8 out[15] =  sel[3] &  sel[2] &  sel[1] &  sel[0] &	in ; 
	 
	 
	 
	 


endmodule
