`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:00:30 03/15/2017 
// Design Name: 
// Module Name:    DFF 
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
module NAND(
    input in1,
    input in2,
    output out
    );
	buf#(2) (out,~(in1 & in2));

endmodule

module NOR(
    input in1,
    input in2,
    output out
    );
	
	buf#(3,2) (out,~(in1 | in2));

endmodule

module DNlatch_NOR(
    input En,
    input D,
    output Q,
    output not_Q
    );
	 
	 wire not_D,A,B ;
	 
	 NOR n1(D,D,not_D);	 
	 NOR n2(D,En,A);
	 NOR n3(not_D,En,B);
	 NOR n4(A,not_Q,Q);
	 NOR n5(B,Q,not_Q);


endmodule

module Dlatch_NAND(
    input En,
    input D,
    output Q,
	 output not_Q
    );
	 
	 wire not_D,A,B ;
	 
	 NAND n1(D,D,not_D);
	 NAND n2(D,En,A);
	 NAND n3(not_D,En,B);
	 NAND n4(A,not_Q,Q);
	 NAND n5(B,Q,not_Q);	  
		
		

endmodule

module DFF(
    input clk,
	 input En,
    input D,
    output Q
    );
	wire D2;
	DNlatch_NOR dn1(clk,D,D2,);
   Dlatch_NAND d1((clk & En),D2,Q,); 


endmodule
