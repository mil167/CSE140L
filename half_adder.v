`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module half_adder(A,B,S,C);

	input A,B;
	output S,C;
	
	assign S = A^B;
	assign C = A&B;
	
endmodule 