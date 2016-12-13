`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module TinyCPU(In,Clk,Result);
	input [11:0] In;
	input Clk;
	output [7:0] Result;
	wire [7:0] data;
	wire [3:0] instruction;
	wire clear,enableA,enableB,enableOut;
	wire s0,s1,s2,s3;
	wire [7:0] QoutA;
	wire [7:0] QoutB;
	wire [7:0] mux2;
	wire [7:0] mux8;
	wire [63:0] ALUout;
	
	//split to data and instruction 
	BusSplit split(
		.In(In),
		.data(data),
		.instruction(instruction)
	);

	//decode the instruction 
	InstructionDecoder decoder(
		.instruction(instruction),
		.clear(clear),
		.enableA(enableA),
		.enableB(enableB),
		.enableOut(enableOut),
		.s0(s0),
		.s1(s1),
		.s2(s2),
		.s3(s3)
	);
	
	//register A
	Register8bit regA(
		.D(data),
		.En(enableA),
		.Clk(Clk),
		.CLR(clear),
		.Qout(QoutA)
	);
	//2:1 mux leading to register B
	Mux2To1 mux21(
		.A(data),
		.B(Result),
		.Sel(s0),
		.Y(mux2)
	);
	//register B
	Register8bit regB(
		.D(mux2),
		.En(enableB),
		.Clk(Clk),
		.CLR(clear),
		.Qout(QoutB)
	);
	
	ALU alu(
		.A(QoutA),
		.B(QoutB),
		.Out(ALUout)
	);
	
	Mux8To1 mux81(
		.A(ALUout[7:0]),
		.B(ALUout[15:8]),
		.C(ALUout[23:16]),
		.D(ALUout[31:24]),
		.E(ALUout[39:32]),
		.F(ALUout[47:40]),
		.G(ALUout[55:48]),
		.H(ALUout[63:56]),
		//concatenates s1,s2,s3 into a single 3-bit input 
		.Sel({s1,s2,s3}),
		.Y(mux8)
	);
	
	Register8bit regOut(
		.D(mux8),
		.En(enableOut),
		.Clk(Clk),
		.CLR(clear),
		.Qout(Result)
	);
	
	
endmodule 

module ALU(A,B,Out);
	input [7:0] A,B;
	output [63:0] Out;
	
	Adder add(
		.A(A),
		.B(B),
		.Out0(Out[7:0])
	);
	
	ShiftLeft shiftL(
		.A(A),
		.Out1(Out[15:8])
	);
	
	ShiftRight shiftR(
		.A(A),
		.Out2(Out[23:16])
	);

	assign Out[31:24] = A & B;
   assign Out[39:32] = A | B;
	assign Out[47:40] = A ^ B;
   assign Out[55:48] = ~(A & B);
	
	Comparator compare(
		.A(A),
		.B(B),
		.Out7(Out[63:56])
	);
endmodule 

module InstructionDecoder(instruction,clear,enableA,enableB,enableOut,s0,s1,s2,s3);
	input [3:0] instruction;
	output clear, enableA, enableB, enableOut, s0, s1, s2, s3;
	reg clear, enableA, enableB, enableOut, s0, s1, s2, s3;
	
	always@(instruction) begin 
		//clear
		if(instruction == 4'b0000) begin
			clear = 1;
			enableA = 1;
			enableB = 1;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'bx;
			s2 = 1'bx;
			s3 = 1'bx;
		//move1 
		end else if (instruction == 4'b0001) begin 
			clear = 0;
			enableA = 1;
			enableB = 0;
			enableOut = 0;
			s0 = 1'bx;
			s1 = 1'bx;
			s2 = 1'bx;
			s3 = 1'bx;
		//move2
		end else if (instruction == 4'b0010) begin 
			clear = 0;
			enableA = 0;	
			enableB = 1;
			enableOut = 0;
			s0 = 1'b0;
			s1 = 1'bx;
			s2 = 1'bx;
			s3 = 1'bx;

		//store out 
		end else if (instruction == 4'b0011) begin 
			clear = 0;
			enableA = 0;
			enableB = 1;
			enableOut = 0;
			s0 = 1'b1;
			s1 = 1'bx;
			s2 = 1'bx;
			s3 = 1'bx;
		//add
		end else if (instruction == 4'b0100) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b0;
			s2 = 1'b0;
			s3 = 1'b0;
		//shift left 
		end else if (instruction == 4'b0101) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b0;
			s2 = 1'b0;
			s3 = 1'b1;
		//shift right
		end else if (instruction == 4'b0110) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b0;
			s2 = 1'b1;
			s3 = 1'b0;
		//AND
		end else if (instruction == 4'b0111) begin 		
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b0;
			s2 = 1'b1;
			s3 = 1'b1;
		//OR
		end else if (instruction == 4'b1000) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b1;
			s2 = 1'b0;
			s3 = 1'b0;
		//XOR
		end else if (instruction == 4'b1001) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b1;
			s2 = 1'b0;
			s3 = 1'b1;
		//NAND
		end else if (instruction == 4'b1010) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b1;
			s2 = 1'b1;
			s3 = 1'b0;
		//Compare
		end else if (instruction == 4'b1011) begin 
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 1;
			s0 = 1'bx;
			s1 = 1'b1;
			s2 = 1'b1;
			s3 = 1'b1;
		//Invalid conditions 
		end else begin
			clear = 0;
			enableA = 0;
			enableB = 0;
			enableOut = 0;
			s0 = 1'bx;
			s1 = 1'bx;
			s2 = 1'bx;
			s3 = 1'bx;
		end  
	end 
endmodule 

module BusSplit(In,data,instruction);
	input [11:0] In;
	output [7:0] data;
	output [3:0] instruction;
	
	assign data = In[7:0];
	assign instruction = In[11:8];
endmodule 

module Mux2To1(A,B,Sel,Y);
	input [7:0] A,B;
	input Sel;
	
	output [7:0] Y;
	assign Y = ~(Sel)*A | Sel*B;
endmodule 

//taken from hw3
module Mux8To1(A,B,C,D,E,F,G,H,Sel,Y);
	//inputs
	input [7:0] A,B,C,D,E,F,G,H;
	input [2:0] Sel;
	
	//outputs
	output [7:0] Y;
	
	//intermediate values
	wire [7:0] out1,out2,out3,out4,out5,out6;
	
	//first level of 2:1 mux
	assign out1 = ~(Sel[0])*A | (Sel[0])*B;
	assign out2 = ~(Sel[0])*C | (Sel[0])*D;
	assign out3 = ~(Sel[0])*E | (Sel[0])*F;
	assign out4 = ~(Sel[0])*G | (Sel[0])*H;
	
	//second level of 2:1 mux
	assign out5 = ~(Sel[1])*out1 | (Sel[1])*out2;
	assign out6 = ~(Sel[1])*out3 | (Sel[1])*out4;
	
	//last level of 2:1 mux
	assign Y = ~(Sel[2])*out5 | (Sel[2])*out6;
endmodule 

module Adder(A,B,Out0);
	input [7:0] A,B;
	output [7:0] Out0;
	reg [7:0] Out0;
	
	always@(A or B) begin
		Out0 <= A + B;
	end 
endmodule 

module Comparator(A,B,Out7);
	input [7:0] A,B;
	output [7:0] Out7;
	reg [7:0] Out7;
	
	always@(A or B) begin 
		if(A >= B)
			Out7 <= 8'b11111111;
		else 
			Out7 <= 8'b00000000;
	end 
endmodule 

module ShiftRight(A,Out2);
	input [7:0] A;
	output [7:0] Out2;
	
	assign Out2 = A >> 1;
endmodule 

module ShiftLeft(A,Out1);
	input [7:0] A;
	output [7:0] Out1;
	
	assign Out1 = A << 1;
endmodule 

module Register8bit(D,En,Clk,CLR,Qout);
	input [7:0] D;
	input En;
	input Clk,CLR;
	output [7:0] Qout;
	reg [7:0] Qout;
	
	always@(posedge Clk) begin 
		if(En) begin 
			if(CLR)
				Qout <= 8'b00000000;
			else 
				Qout <= D;
		end 
	end 
endmodule 


			