`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_description_to_verilog();
	reg in;
	reg reset;
	reg flux;
	
	wire out;
	wire A,B,C,D,E,F;
	
	description_to_verilog uut(
		.in(in),
		.reset(reset),
		.flux(flux),
		.out(out),
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E),
		.F(F)
	);
	
	initial begin 
	/*
		//reset the FSM
		in = 1'bx;
		reset = 1'b1;
		flux = 0;
		
		//I will first demonstrate that the pattern is recognized by the FSM, without any incorrect inputs
		//input = 1 A -> B
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 1;
		
		//input = 0 B -> C
		#10
		in = 1'b0;
		reset = 1'b0;
		flux = 0;
		
		//input = 1 C -> D
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 1;
		
		//input = 1 D -> E
		#10
		in = 1'b1;
		reset = 1'b0;
		flux = 0;
		
		//pattern has been recognized, first output bit of 1 is printed
		#10 
		in = 1'bx;
		reset = 1'b0;
		flux = 1;
		
		//reset the FSM again
		#10 
		in = 1'bx;
		reset = 1'b1;
		flux = 0;
	*/
		//Below I will demonstrate that the FSM will return to state A when at any
		//state before state E, an incorrect input is detected 
		//reset the FSM
		in = 1'bx;
		reset = 1'b1;
		flux = 0;
		
		//input = 0 A -> A (RESET at A)
		#10 
		in = 1'b0;
		reset = 1'b0;
		flux = 1;
		
		//input = 1 A -> B (PROCEED)
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 0;
		
		//input = 1 B -> A (RESET at B)
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 1;
		
		//input = 1 A -> B (PROCEED)
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 0;
		
		//input = 0 B -> C (PROCEED)
		#10 
		in = 1'b0;
		reset = 1'b0;
		flux = 1;
		
		//input = 0 C -> A (RESET at C)
		#10
		in = 1'b0;
		reset = 1'b0;
		flux = 0;

		//input = 1 A -> B (PROCEED)
		#10 
		in = 1'b1;
		reset = 1'b0;
		flux = 0;
		
		//input = 0 B -> C (PROCEED)
		#10 
		in = 1'b0;
		reset = 1'b0;
		flux = 1;
		
		//input = 1 C -> D (PROCEED)
		#10
		in = 1'b1;
		reset = 1'b0;
		flux = 0;
		
		//input = 0 D -> A (RESET at D)
		#10
		in = 1'b0;
		reset = 1'b0;
		flux = 1;
		
		
	end 
endmodule 