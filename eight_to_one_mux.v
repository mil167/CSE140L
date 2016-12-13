`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module eight_to_one_mux(in0,in1,in2,in3,in4,in5,in6,in7,s0,s1,s2,OUT);
	//inputs
	input in0,in1,in2,in3,in4,in5,in6,in7;
	input s0,s1,s2;
	
	//outputs
	output OUT;
	
	//intermediate values
	wire out1,out2,out3,out4,out5,out6;
	
	//first level of 2:1 mux
	assign out1 = ~(s0)*in0 | s0*in1;
	assign out2 = ~(s0)*in2 | s0*in3;
	assign out3 = ~(s0)*in4 | s0*in5;
	assign out4 = ~(s0)*in6 | s0*in7;
	
	//second level of 2:1 mux
	assign out5 = ~(s1)*out1 | s1*out2;
	assign out6 = ~(s1)*out3 | s1*out4;
	
	//last level of 2:1 mux
	assign OUT = ~(s2)*out5 | s2*out6;
	
endmodule 