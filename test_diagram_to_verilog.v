`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_diagram_to_verilog;
	reg in;
	reg reset;
	reg flux;
	wire out;
	wire A,B,C,D,E;
	
	diagram_to_verilog uut(
		.in(in),
		.reset(reset),
		.flux(flux),
		.out(out),
		.A(A),
		.B(B),
		.C(C),
		.D(D),
		.E(E)
	);
	
	initial begin 
		//reset the FSM
		reset = 1'b1;
		in = 1'bx;
		flux = 0;
	
		//start at A, input 1 --> C
		#10
		reset = 1'b0;
		in = 1'b1;
		flux = 1;
		
		//start at C, input 0 --> E
		#10
		reset = 1'b0;
		in = 1'b0;
		flux = 0;
		
		//start at E, input 1 --> D
		#10
		reset = 1'b0;
		in = 1'b1;
		flux = 1;
		
		//start at D, input 0 --> E
		#10
		reset = 1'b0;
		in = 1'b0;
		flux = 0;
		
		//start at E, input 0 --> B
		#10
		reset = 1'b0;
		in = 1'b0;
		flux = 1;
		
		//start at B, input 0 --> B
		#10
		reset = 1'b0;
		in = 1'b0;
		flux = 0;
		
		//start at B, input 1 --> D
		#10
		reset = 1'b0;
		in = 1'b1;
		flux = 1;
		
		//start at D, input 1 --> C
		#10
		reset = 1'b0;
		in = 1'b1;
		flux = 0;
		
		//start at C, input 1 --> C
		#10
		reset = 1'b0;
		in = 1'b1;
		flux = 1;
		
		//reset the FSM
		#10 
		reset = 1'b1;
		in = 1'bx;
		flux = 0;
		
		//start at A, input 0 --> B
		#10
		reset = 1'b0;
		in = 1'b0;
		flux = 1;
		
	end 
endmodule 
		
		
		
		