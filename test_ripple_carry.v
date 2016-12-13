`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_ripple_carry();
	
	reg A0,A1,A2,A3;
	reg B0,B1,B2,B3;
	reg Cin;
	
	wire S0;
	wire S1;
	wire S2;
	wire S3;
	wire Cout3;
	
	ripple_carry uut(
		.A3(A3),
		.A2(A2),
		.A1(A1),
		.A0(A0),
		.B3(B3),
		.B2(B2),
		.B1(B1),
		.B0(B0),
		.Cin(Cin),
		.S0(S0),
		.S1(S1),
		.S2(S2),
		.S3(S3),
		.Cout3(Cout3)
	);
	
	//the results are correct, but I need to get the $display statements to work correctly
	initial begin
		//3 + 5
		A3 = 1'b0;
		A2 = 1'b0;
		A1 = 1'b1;
		A0 = 1'b1;
	
		B3 = 1'b0;
		B2 = 1'b1;
		B1 = 1'b0;
		B0 = 1'b1;
		
		Cin = 0;
		
		//7 + 7
		#10
		A3 = 1'b0;
		A2 = 1'b1;
		A1 = 1'b1;
		A0 = 1'b1;
	
		B3 = 1'b0;
		B2 = 1'b1;
		B1 = 1'b1;
		B0 = 1'b1;
		
		Cin = 0;	
		
		//9 + 6
		#10
		A3 = 1'b1;
		A2 = 1'b0;
		A1 = 1'b0;
		A0 = 1'b1;
	
		B3 = 1'b0;
		B2 = 1'b1;
		B1 = 1'b1;
		B0 = 1'b0;
		
		Cin = 0;
		
		//10 + 10
		#10
		A3 = 1'b1;
		A2 = 1'b0;
		A1 = 1'b1;
		A0 = 1'b0;
	
		B3 = 1'b1;
		B2 = 1'b0;
		B1 = 1'b1;
		B0 = 1'b0;
		
		Cin = 0;
	end 
endmodule 