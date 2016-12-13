`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_half_adder;
	reg A,B;
	wire S,C;
	
	half_adder uut (
		.A(A),
		.B(B),
		.S(S),
		.C(C)
	);
	
	initial begin
		//initialize inputs 00 case
		A = 1'b0;
		B = 1'b0;
		
		//wait 100ns for global reset 01 case
		#10
		A = 1'b0;
		B = 1'b1;
		
		//wait 100ns for global reset 10 case
		#10
		A = 1'b1;
		B = 1'b0;
		
		//wait 100ns for global reset 11 case
		#10
		A = 1'b1;
		B = 1'b1;
		
	end
	endmodule
	