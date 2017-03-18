`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:25 03/15/2017 
// Design Name: 
// Module Name:    Full_Adder 
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
module XOR(
    input in1,
    input in2,
    output out
    );

	buf#(5) (out,in1 ^ in2);
	
endmodule

/*
module NAND(
    input in1,
    input in2,
    output out
    );
	buf#(2) (out,~(in1 & in2));

endmodule
*/

module Full_Adder(
    input A,
    input B,
    input Ci,
    output S,
    output Co
    );
	wire P , i1 , G  ;
	XOR x1(A,B,P);
	NAND n1(A,B,G);	
	
	XOR x2(P,Ci,S);
	NAND n2(P,Ci,i1);
	
	NAND n3(G,i1,Co);
	
endmodule