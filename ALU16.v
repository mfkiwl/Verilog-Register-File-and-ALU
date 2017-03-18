`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:41 03/15/2017 
// Design Name: 
// Module Name:    ALU16 
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
primitive MUX2  ( out,in1,in0, sel);
  output out;
  input  in1,in0, sel;  
  table
    ?00 : 0;
	 ?10 : 1;
    0?1 : 0;
	 1?1 : 1; 	 	    
  endtable
endprimitive

primitive MUX4 ( out,in3,in2,in1,in0, sel1,sel0);
  output out;
  input  in3,in2,in1,in0, sel1,sel0;  
  table
    ???000 : 0;
	 ???100 : 1;
    ??0?01 : 0;
	 ??1?01 : 1; 
	 ?0??10 : 0;
	 ?1??10 : 1;
    0???11 : 0; 
	 1???11 : 1; 	    
  endtable
endprimitive



module ALU16(
    input [15:0] A,
    input [15:0] B,
	 input [3:0] sel,
    output [15:0] out,
    output N,	//negative
    output L,	//low
    output Z,	//zero
    output C,	//carry
    output F	//overflow
    );
	 wire [15:0] Cin,Cout , in , S;	 	 
	 
	 MUX2 m21_1(in[0],~B[0],B[0],sel[0]);	
	 MUX4 m4(Cin[0],B[0],sel[0],1'b1,1'b0,sel[2],sel[1]);					
	 Full_Adder f(A[0],in[0],Cin[0],S[0],Cout[0]);		
	 MUX2 m21_2(out[0],Cout[0],S[0],sel[3]);
				
	 generate
		  genvar i;
		  for (i=1; i < 15; i=i+1) begin: r
				MUX2 m2_1(in[i],~B[i],B[i],sel[0]);
				MUX4 m4(Cin[i],B[i],Cout[i-1],1'b1,1'b0,sel[2],sel[1]);								
				Full_Adder f(A[i],in[i],Cin[i],S[i],Cout[i]);		
				MUX2 m2_2(out[i],Cout[i],S[i],sel[3]);
		  end		  
	endgenerate
	
	MUX2 m22_1(in[15],~B[15],B[15],sel[0]);	
	MUX4 m24(Cin[15],B[15],Cout[14],1'b1,1'b0,sel[2],sel[1]);								
	Full_Adder f2(A[15],in[15],Cin[15],S[15],Cout[15]);		
	MUX2 m22_2(out[15],Cout[15],S[15],sel[3]);
	
	
	//Z
	assign Z = ~(S[0] | S[1] | S[2] | S[3] | S[4] | S[5] | S[6] | S[7] | S[8] | S[9] | S[10] | S[11] | S[12] | S[13] | S[14] | S[15]);
	//C
	MUX2 m(C,~Cout[15],Cout[15],sel[0]);	
	//F
	assign F = Cin[15] ^ Cout[15];
	//L
	assign L = ~Cout[15] ;
	//N
	assign N = S[15] ^ Cout[15] ^Cin[15] ;



endmodule
