`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module majority_voter(A,B,C,OUT);
	
	input A;
	input B;
	input C;
	
	output OUT;
	
	wire AB;
	wire AC;
	wire BC;
	
	assign AB = A & B;
	assign AC = A & C;
	assign BC = B & C;
	
	assign OUT = AB | AC | BC;
	
endmodule 