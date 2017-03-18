`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:22 03/16/2017
// Design Name:   ALU16
// Module Name:   D:/Projects/XilinxISE/HW2/Homework2/testALU16.v
// Project Name:  Homework2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testALU16;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [3:0] sel;

	// Outputs
	wire [15:0] out;
	wire N; //assuming signed
	wire L; //assuming unsignned (B<A)
	wire Z; //zero
	wire C; //error in signed
	wire F; //error in unsigned

	// Instantiate the Unit Under Test (UUT)
	ALU16 uut (
		.A(A), 
		.B(B), 
		.sel(sel), 
		.out(out), 
		.N(N), 
		.L(L), 
		.Z(Z), 
		.C(C), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$display("First signed operations" );	
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $signed(out), $signed(out), N,Z,L);
		
		$display("SUM" );
		A =  $signed(16'd69);
		B =  $signed(16'd55);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		
		#100;
		$display("SUM ") ;
		A =  $signed(-16'd10);
		B =  $signed(16'd55);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		
		
		#100;
		$display("SUM" );
		A =  $signed(-16'd10);
		B =  $signed(-16'd55);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
	
		#100;
		$display("SUM" );
		A =  $signed(+16'd55);
		B =  $signed(-16'd55);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		
		
		#100;
		$display("SUB" );
		A =  $signed(-16'd10);
		B =  $signed(16'd55);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		
		
		#100;
		$display("SUB" );
		A =  $signed(+16'd10);
		B =  $signed(-16'd55);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
		
		#100;
		$display("SUM" );
		A =  $signed(-16'd16372);
		B =  $signed(-16'd16372);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
		

		#100;
		$display("SUB" );
		A =  $signed(+16'd16372);
		B =  $signed(-16'd6880);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
		
		#100;
		$display("SUM" );
		A =  $signed(-16'd16372);
		B =  $signed(+16'd16372);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
		
		#100;
		$display("SUM" );
		A =  $signed(+16'd16384);
		B =  $signed(+16'd16394);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );
		
				
      #100;
		$display("SUM" );
		A =  $signed(+16'd16372);
		B =  $signed(+16'd10880);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		
		
      #100;
		$display("SUM" );
		A =  $signed(+16'd16372);
		B =  $signed(+16'd20880);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $signed(A), $signed(A), $signed(B), $signed(B), sel );

		//AND
		#100;
		$display("Now logic operations" );	
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $unsigned(out), $unsigned(out), N,Z,L);
		$display("AND" );
		A =  $unsigned(+16'd16372);
		B =  $unsigned(+16'd20880);
		sel = 4'b1000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

		
		#100;
		$display("AND" );
		A =  $unsigned(+16'd15);
		B =  $unsigned(+16'd2);
		sel = 4'b1000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		
		
		#100;
		$display("AND" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b1000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );


		#100;
		$display("AND" );
		A =  $unsigned(+16'd0);
		B =  $unsigned(+16'd32767);
		sel = 4'b1000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );


		//XOR
		#100;
		$display("XOR" );
		A =  $unsigned(+16'd0);
		B =  $unsigned(+16'd32767);
		sel = 4'b0000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

			
		#100;
		$display("XOR" );
		A =  $unsigned(+16'd16372);
		B =  $unsigned(+16'd20880);
		sel = 4'b0000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("XOR" );
		A =  $unsigned(+16'd15);
		B =  $unsigned(+16'd2);
		sel = 4'b0000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("XOR" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b0000 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

		//XNOR
		
		#100;
		$display("XNOR" );
		A =  $unsigned(+16'd0);
		B =  $unsigned(+16'd32767);
		sel = 4'b0010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

			
		#100;
		$display("XNOR" );
		A =  $unsigned(+16'd16372);
		B =  $unsigned(+16'd20880);
		sel = 4'b0010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("XNOR" );
		A =  $unsigned(+16'd15);
		B =  $unsigned(+16'd2);
		sel = 4'b0010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("XNOR" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b0010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );


		//OR
		
		#100;
		$display("OR" );
		A =  $unsigned(+16'd0);
		B =  $unsigned(+16'd32767);
		sel = 4'b1010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

			
		#100;
		$display("OR" );
		A =  $unsigned(+16'd16372);
		B =  $unsigned(+16'd20880);
		sel = 4'b1010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("OR" );
		A =  $unsigned(+16'd15);
		B =  $unsigned(+16'd2);
		sel = 4'b1010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("OR" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b1010 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
	
	
		//NOT A
		
		#100;
		$display("NOT A" );
		A =  $unsigned(+16'd0);
		B =  $unsigned(+16'd32767);
		sel = 4'b0111 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

			
		#100;
		$display("NOT A" );
		A =  $unsigned(+16'd16372);
		B =  $unsigned(+16'd20880);
		sel = 4'b0111 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("NOT A" );
		A =  $unsigned(+16'd15);
		B =  $unsigned(+16'd2);
		sel = 4'b0111 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );

	
		#100;
		$display("NOT A" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b0111 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		
		#100;
		$display("Lastly unsigned operations" );	
		$display("SUM" );
		A =  $unsigned(+16'd100);
		B =  $unsigned(+16'd185);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		
  
		#100;
		$display("SUM" );
		A =  $unsigned(+16'd35000);
		B =  $unsigned(+16'd30536);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		  
		#100;
		$display("SUM" );
		A =  $unsigned(+16'd31);
		B =  $unsigned(+16'd10000);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		  
		  
		#100;
		$display("SUM" );
		A =  $unsigned(+16'd32000);
		B =  $unsigned(+16'd32000);
		sel = 4'b0100 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd10000);
		B =  $unsigned(+16'd31);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd32000);
		B =  $unsigned(+16'd16000);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd500);
		B =  $unsigned(+16'd500);
		sel = 4'b0101 ;
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  
		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd500);
		B =  $unsigned(+16'd600);
		sel = 4'b0101 ;
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $signed(out), $signed(out), N,Z,L);
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  		  		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd500);
		B =  $unsigned(+16'd1000);
		sel = 4'b0101 ;
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $signed(out), $signed(out), N,Z,L);
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  		  		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd2);
		B =  $unsigned(+16'd5);
		sel = 4'b0101 ;
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $signed(out), $signed(out), N,Z,L);
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  		  		  
		#100;
		$display("SUB" );
		A =  $unsigned(+16'd2);
		B =  $unsigned(+16'd500);
		sel = 4'b0101 ;
		$monitor("OUT %g C= %b F= %b out= %b , %d  N= %b Z= %b L= %b  ",    $time,C, F, $signed(out), $signed(out), N,Z,L);
		$display("IN %g A= %b,%d B= %b,%d sel= %b ",    $time, $unsigned(A), $unsigned(A), $unsigned(B), $unsigned(B), sel );
		  		  		  
		  
	end
      
endmodule

