`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu
//do this later some fan out error idk 
module carry_lookahead(A3,A2,A1,A0,B3,B2,B1,B0,C0,S0,S1,S2,S3,Cout_4);
	
	//inputs
	input A3,A2,A1,A0;
	input B3,B2,B1,B0;
	input C0;
	
	//intermediate values
	wire G0,G1,G2,G3;
	wire P0,P1,P2,P3;
	wire Cout_1;
	wire Cout_2;
	wire Cout_3;
	
	//outputs
	output S0,S1,S2,S3;
	output Cout_4;
	
	xor P0x(P0,A0,B0);
	xor P1x(P1,A1,B1);
	xor P2x(P2,A2,B2);
	xor P3x(P3,A3,B3);
	
	and G0a(G0,A0,B0);
	and G1a(G1,A1,B1);
	and G2a(G2,A2,B2);
	and G3a(G3,A3,B3);
	
	or Cout1o(Cout_1,G0,(P0*C0));
	or Cout2o(Cout_2,G1,(G0*P1),(P0*P1*C0));
	or Cout3o(Cout_3,G2,(G1*P2),(G0*P1*P2),(P0*P1*P2*C0));
	or Cout4o(Cout_4,G3,(G2*P3),(G1*P2*P3),(G0*P1*P2*P3),(P0*P1*P2*P3*C0));
	
	xor S0x(S0,P0,Cout_1);
	xor S1x(S1,P1,Cout_2);
	xor S2x(S2,P2,Cout_3);
	xor S3x(S3,P3,Cout_4);
	
	/*
	assign G0 = A0*B0;
	assign G1 = A1*B1;
	assign G2 = A2*B2;
	assign G3 = A3*B3;
	
	assign P0 = A0^B0;
	assign P1 = A1^B1;
	assign P2 = A2^B2;
	assign P3 = A3^B3;
	
	assign Cout_1 = G0 | (P0*C0);
	assign Cout_2 = G1 | (G0*P1) | (P0*P1*C0);
	assign Cout_3 = G2 | (G1*P2) | (G0*P1*P2) | (P0*P1*P2*C0);
	assign Cout_4 = G3 | (G2*P3) | (G1*P2*P3) | (G0*P1*P2*P3) | (P0*P1*P2*P3*C0);

	/*
	//instantiate full adder #1
	full_adder fa1(
		.A(A0),
		.B(B0),
		.Cin(C0),
		.S(S0),
		.Cout(Cout_1)
	);
	
	//instantiate full adder #2
	full_adder fa2(
		.A(A1),
		.B(B1),
		.Cin(Cout_1),
		.S(S1),
		.Cout(Cout_2)
	);	
	
	//instantiate full adder #3
	full_adder fa3(
		.A(A2),
		.B(B2),
		.Cin(Cout_2),
		.S(S2),
		.Cout(Cout_3)
	);
	
	//instantiate full adder #4
	full_adder fa4(
		.A(A3),
		.B(B3),
		.Cin(Cout_3),
		.S(S3),
		.Cout(Cout_4)
	);
	*/
endmodule 