`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:54 03/15/2017 
// Design Name: 
// Module Name:    RF 
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

module MUX16(
	 input [15:0] register15,
	 input [15:0] register14,
	 input [15:0] register13,
	 input [15:0] register12,
	 input [15:0] register11,
	 input [15:0] register10,
	 input [15:0] register9,
	 input [15:0] register8,
	 input [15:0] register7,
	 input [15:0] register6,
	 input [15:0] register5,
	 input [15:0] register4,
	 input [15:0] register3,
	 input [15:0] register2,
	 input [15:0] register1,
	 input [15:0] register0,     
    input [3:0] sel,
    output [15:0] out
    );
	 wire [15:0] registers[15:0] ;
	 
	 assign registers[0]= register0; 
	 assign registers[1]= register1; 
	 assign registers[2]= register2; 
	 assign registers[3]= register3; 
	 assign registers[4]= register4; 
	 assign registers[5]= register5; 
	 assign registers[6]= register6; 
	 assign registers[7]= register7; 
	 assign registers[8]= register8; 
	 assign registers[9]= register9; 
	 assign registers[10]= register10; 
	 assign registers[11]= register11; 
	 assign registers[12]= register12; 
	 assign registers[13]= register13; 
	 assign registers[14]= register14; 
	 assign registers[15]= register15; 
	 
	 
	 
	 assign #5  out = registers[sel] ;	 //mux with aprox delay
	
endmodule


module RF( 
    input [3:0] Ra, // First Reg num to be read
    input [3:0] Rb, // Second Reg num to be read
    input [3:0] Rw, // Reg num to be written
    input WrEn,  // Write enable
	 input clk,
    input [15:0] Wdat,  // Data to be written
    output [15:0] Adat, // First read word
    output [15:0] Bdat  // Second read word 
    );
	 wire [15:0] d ; 
	 wire [15:0] w; 
	 wire [15:0] register[15:0] ;
	 
	  
	 
	 buf#(8)(w[0],Wdat[0]); //because demux process takes 8 ns
	 buf#(8)(w[1],Wdat[1]); 
	 buf#(8)(w[2],Wdat[2]); 
	 buf#(8)(w[3],Wdat[3]); 
	 buf#(8)(w[4],Wdat[4]); 
	 buf#(8)(w[5],Wdat[5]); 
	 buf#(8)(w[6],Wdat[6]); 
	 buf#(8)(w[7],Wdat[7]); 
	 buf#(8)(w[8],Wdat[8]); 
	 buf#(8)(w[9],Wdat[9]); 
	 buf#(8)(w[10],Wdat[10]); 
	 buf#(8)(w[11],Wdat[11]); 
	 buf#(8)(w[12],Wdat[12]); 
	 buf#(8)(w[13],Wdat[13]); 
	 buf#(8)(w[14],Wdat[14]); 
	 buf#(8)(w[15],Wdat[15]); 
	
	 
	 Demux16 dm(WrEn,Rw,d);	 
	 
	 generate  
		  genvar i;
		  for (i=0; i < 16; i=i+1) begin: r
				Reg_Cell e(w,clk,d[i],register[i]);		
		  end		  
	endgenerate
	
	
	MUX16 Mux_A(register[15],register[14],register[13],register[12],register[11],register[10],register[9],register[8],register[7],register[6],register[5],register[4],register[3],register[2],register[1],register[0],Ra,Adat);
	MUX16 Mux_B(register[15],register[14],register[13],register[12],register[11],register[10],register[9],register[8],register[7],register[6],register[5],register[4],register[3],register[2],register[1],register[0],Rb,Bdat);



endmodule
