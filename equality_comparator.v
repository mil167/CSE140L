`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module equality_comparator(A_0,A_1,B_0,B_1,OUT);
	
	input A_0;
	input A_1;
	input B_0;
	input B_1;
	
	wire top_inv;
	wire top_and_gate;
	wire bot_inv;
	wire bot_and_gate;
	wire top_or_gate;
	wire bot_or_gate;
	
	output OUT;
	
	assign top_inv = ~(A_0) & ~(B_0);
	assign top_and_gate = (A_0 & B_0);
	assign top_or_gate = top_inv | top_and_gate;
	
	assign bot_inv = ~(A_1) & ~(B_1);
	assign bot_and_gate = (A_1 & B_1);
	assign bot_or_gate = bot_inv | bot_and_gate;
	
	assign OUT = (top_or_gate & bot_or_gate);
	
endmodule 
	
	