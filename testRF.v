`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:30 03/16/2017
// Design Name:   RF
// Module Name:   D:/Projects/XilinxISE/HW2/Homework2/testRF.v
// Project Name:  Homework2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testRF;

	// Inputs
	reg [3:0] Ra;
	reg [3:0] Rb;
	reg [3:0] Rw;
	reg WrEn;
	reg clk;
	reg [15:0] Wdat;

	// Outputs
	wire [15:0] Adat;
	wire [15:0] Bdat;

	// Instantiate the Design Under Test (DUT)
	RF dut (
		.Ra(Ra), 
		.Rb(Rb), 
		.Rw(Rw), 
		.WrEn(WrEn), 
		.clk(clk), 
		.Wdat(Wdat), 
		.Adat(Adat), 
		.Bdat(Bdat)
	);

	always begin
	
	#100 clk = ~clk;
	
	end
	
	initial begin
	
		// Initialize Inputs
		Ra = 0;
		Rb = 0;
		Rw = 0;
		WrEn = 0;
		clk = 0;
		Wdat = 0;
				
		$monitor(   "%g clk=%b Ra=%d Rb =%d Rw=%d WrEn=%b Adat=%h Bdat=%h Wdat=%h",    $time, clk, Ra, Rb, Rw , WrEn , Adat , Bdat , Wdat);

		// Wait 200 ns for global reset to finish
		#250;
		
		Wdat = 16'hABCD;
		WrEn = 1;
		Rw = 4'd5;
		
		#100;
		Ra = 4'd5;
		WrEn =0 ;	
		
		#100;
		Wdat =  16'hE050;
		Rw = 4'd12; 
		
		#200;
		WrEn =1;
		Rb=4'd12;
		
		#200;
		Wdat =  16'h5290;
		Rw = 4'd5; 
		
		
		#200;
		Wdat =  16'h529E;
		Rw = 4'd9; 
		
		
		
		#200;
		Wdat =  16'h529E;
		Rw = 4'd12;
		Ra = 	4'd9; 
		
		
		#200;
		WrEn =0;
		Wdat =  16'hEEEE;	
		Ra = 	4'd12; 
		Rb = 	4'd5; 
		
		#200;
		WrEn =1;
		Rw = 4'd9; 
		
		#200;
		WrEn =0;
		Wdat =  16'hAAAA;	
		Ra = 	4'd9; 
		
		
		
		
		
		
			
		
        
		// Add stimulus here

	end
      
endmodule

