`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_full_adder;
	
	reg A;
	reg B;
	reg Cin; 
	
	wire S;
	wire Cout;
	
	full_adder uut (
		.A(A),
		.B(B),
		.Cin(Cin),
		.S(S),
		.Cout(Cout)
	);
	
	initial begin
		//initialize inputs 000 case
		A = 1'b0;
		B = 1'b0;
		Cin = 1'b0;
		
		//wait for global reset 001 case
		#10
		A = 1'b0;
		B = 1'b0;
		Cin = 1'b1;
		
		//wait for global reset 010 case
		#10
		A = 1'b0;
		B = 1'b1;
		Cin = 1'b0;
		
		//wait for global reset 011 case
		#10
		A = 1'b0;
		B = 1'b1;
		Cin = 1'b1;
		
		//wait for global reset 100 case
		#10
		A = 1'b1;
		B = 1'b0;
		Cin = 1'b0;
		
		//wait for global reset 101 case
		#10
		A = 1'b1;
		B = 1'b0;
		Cin = 1'b1;
		
		//wait for global reset 110 case
		#10
		A = 1'b1;
		B = 1'b1;
		Cin = 1'b0;
		
		//wait for global reset 111 case
		#10
		A = 1'b1;
		B = 1'b1;
		Cin = 1'b1;
		
		end 
		
		endmodule 