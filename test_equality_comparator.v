`timescale 1ns / 1ps
//Name: Michael Li
//Date: 08/07/2016

module test_equality_comparator;

	reg A_0;
	reg A_1;
	reg B_0;
	reg B_1;
	
	wire OUT;
	
	equality_comparator uut(
		.A_0(A_0),
		.A_1(A_1),
		.B_0(B_0),
		.B_1(B_1),
		.OUT(OUT)
	);
	
	initial begin 
		// 00 00 case
		A_0 = 1'b0;
		A_1 = 1'b0;
		B_0 = 1'b0;
		B_1 = 1'b0;
		
		//global reset 00 01 case
		#10
		A_0 = 1'b0;
		A_1 = 1'b0;
		B_0 = 1'b0;
		B_1 = 1'b1;
		
		//global reset 00 10 case
		#10
		A_0 = 1'b0;
		A_1 = 1'b0;
		B_0 = 1'b1;
		B_1 = 1'b0;
		
		//global reset 00 11 case
		#10
		A_0 = 1'b0;
		A_1 = 1'b0;
		B_0 = 1'b1;
		B_1 = 1'b1;
		
		//global reset 01 00 case
		#10
		A_0 = 1'b0;
		A_1 = 1'b1;
		B_0 = 1'b0;
		B_1 = 1'b0;
		
		//global reset 01 01 case
		#10 
		A_0 = 1'b0;
		A_1 = 1'b1;
		B_0 = 1'b0;
		B_1 = 1'b1;
		
		//global reset 01 10 case 
		#10 
		A_0 = 1'b0;
		A_1 = 1'b1;
		B_0 = 1'b1;
		B_1 = 1'b0;
		
		//global reset 01 11 case
		#10
		A_0 = 1'b0;
		A_1 = 1'b1;
		B_0 = 1'b1;
		B_1 = 1'b1;
		
		//global reset 10 00 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b0;
		B_0 = 1'b0;
		B_1 = 1'b0;
		
		//global reset 10 01 case
		#10 
		A_0 = 1'b1;
		A_1 = 1'b0;
		B_0 = 1'b0;
		B_1 = 1'b1;
		
		//global reset 10 10 case
		#10 
		A_0 = 1'b1;
		A_1 = 1'b0;
		B_0 = 1'b1;
		B_1 = 1'b0;
		
		//global reset 10 11 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b0;
		B_0 = 1'b1;
		B_1 = 1'b1;
		
		//global reset 11 00 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b1;
		B_0 = 1'b0;
		B_1 = 1'b0;
		
		//global reset 11 01 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b1;
		B_0 = 1'b0;
		B_1 = 1'b1;
		
		//global reset 11 10 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b1;
		B_0 = 1'b1;
		B_1 = 1'b0;
		
		//global reset 11 11 case
		#10
		A_0 = 1'b1;
		A_1 = 1'b1;
		B_0 = 1'b1;
		B_1 = 1'b1;
		
	end 
endmodule 
		
		