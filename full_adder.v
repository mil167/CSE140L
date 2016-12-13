`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module full_adder(A,B,Cin,S,Cout);
	
	input A;
	input B;
	input Cin;
	
	output S;
	output Cout;
	
	wire S1;
	wire C1;
	wire C2;
	
	half_adder ha1 (
		.A(A),
		.B(B),
		.S(S1),
		.C(C1)
	);
	
	half_adder ha2 (
		.A(S1),
		.B(Cin),
		.S(S),
		.C(C2)
	);
	
	assign Cout = C1 | C2;
	endmodule 
		