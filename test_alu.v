`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_alu();

	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] C;
	
	reg S0;
	reg S1;
	
	wire [15:0] OUT;
	
	alu uut(
		.A(A),
		.B(B),
		.C(C),
		.S0(S0),
		.S1(S1),
		.OUT(OUT)
	);
	
	initial begin 
		//00 case works 
		A = 8'd100;
		B = 8'd20;
		C = 8'd34;
		S0 = 1'b0;
		S1 = 1'b0;
		
		//01 case works
		#10
		A = 8'd15;
		B = 8'd34;
		C = 8'd3;
		S0 = 1'b0;
		S1 = 1'b1;

		//10 case doesnt work
		#10
		A = 8'd25;
		B = 8'd2;
		C = 8'd1;
		S0 = 1'b1;
		S1 = 1'b0;
		
		//11 case doesnt work
		#10
		A = 8'd1;
		B = 8'd255;
		C = 8'd128;
		S0 = 1'b1;
		S1 = 1'b1;
		
		//reset 
		#10
		A = 8'd0;
		B = 8'd0;
		C = 8'd0;
		S0 = 1'b0;
		S1 = 1'b0;
	end 
endmodule 