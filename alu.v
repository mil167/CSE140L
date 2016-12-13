`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module alu(A,B,C,S0,S1,OUT);
	
	input [7:0]A,B,C;
	input S0,S1;
	
	output [15:0]OUT;
	reg [15:0]OUT;
	
	wire [1:0]sel;
	//assign sel = S0 + S1;
	
	always@(A or B or C or S0 or S1) begin
		case(S0)
			//00 case
			0: case(S1)
					0: OUT = A * B;
			//01 case 
					1: OUT = A - C;
				endcase 
			//10 case
			1: case(S1)
					0: OUT = ((A ~^ B)~^ C);
			//11 case
					1: if(A[0] == 1) begin 
							OUT = B + C;
						end else begin 
							OUT = B - C;
						end
				endcase 
		endcase 
	end 
endmodule 
	