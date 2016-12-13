`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_majority_voter();

	reg A;
	reg B;
	reg C; 
	
	wire OUT;
	
	majority_voter uut(
		.A(A),
		.B(B),
		.C(C),
		.OUT(OUT)
	);
	
	initial begin 
		//initialize 000 case
		A = 1'b0;
		B = 1'b0;
		C = 1'b0;
		
		//global reset 001 case 
		#10
		A = 1'b0;
		B = 1'b0;
		C = 1'b1;
		
		//global reset 010 case 
		#10
		A = 1'b0;
		B = 1'b1;
		C = 1'b0;
		
		//global reset 011 case 
		#10 
		A = 1'b0;
		B = 1'b1;
		C = 1'b1;
		
		//global reset 100 case 
		#10 
		A = 1'b1;
		B = 1'b0;
		C = 1'b0;
		
		//global reset 101 case 
		#10 
		A = 1'b1;
		B = 1'b0;
		C = 1'b1;
		
		//global reset 110 case
		#10 
		A = 1'b1;
		B = 1'b1;
		C = 1'b0;
		
		//global reset 111 case
		#10
		A = 1'b1;
		B = 1'b1;
		C = 1'b1;
		
		end
endmodule 