`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module ripple_carry(A3,A2,A1,A0,B3,B2,B1,B0,Cin,S0,S1,S2,S3,Cout3);

	//inputs
	input A0,A1,A2,A3; 
	input B0,B1,B2,B3;
	input Cin;
	
	//intermediate values
	wire Cout0;
	wire Cout1;
	wire Cout2;
	
	//outputs
	output S0,S1,S2,S3,Cout3;
	
	//instantiate full adder #1
	full_adder fa1(
		.A(A0),
		.B(B0),
		.Cin(Cin),
		.S(S0),
		.Cout(Cout0)
	);
	
	//instantiate full adder #2
	full_adder fa2(
		.A(A1),
		.B(B1),
		.Cin(Cout0),
		.S(S1),
		.Cout(Cout1)
	);
	
	//instantiate full adder #3
	full_adder fa3(
		.A(A2),
		.B(B2),
		.Cin(Cout1),
		.S(S2),
		.Cout(Cout2)
	);
	
	//instantiate full adder #4
	full_adder fa4(
		.A(A3),
		.B(B3),
		.Cin(Cout2),
		.S(S3),
		.Cout(Cout3)
	);
	
endmodule 
	