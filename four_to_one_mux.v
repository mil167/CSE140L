`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module four_to_one_mux(p_0,p_1,p_2,p_3,s_0,s_1,OUT);
	
	input p_0;
	input p_1;
	input p_2;
	input p_3;
	
	input s_0;
	input s_1;
	
	wire select_zero;
	wire select_one;
	wire select_two;
	wire select_three;
	
	output OUT;
	
	assign select_zero = ~(s_0)&~(s_1)&p_0;
	assign select_one = ~(s_0)&(s_1)&p_1;
	assign select_two = (s_0)&~(s_1)&p_2;
	assign select_three = (s_0)&(s_1)&p_3;
	
	assign OUT = select_zero | select_one | select_two | select_three;
	
endmodule 