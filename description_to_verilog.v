`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module description_to_verilog(in,reset,flux,out,A,B,C,D,E,F);
	//inputs 
	input in;
	input reset;
	input flux; //the purpose of this variable is to switch between 0 and 1
					//otherwise, there is no practical way of traversing the 
					//entire FSM diagram and testing all possible cases without
					//some instances ignoring the sensitivity list
	
	//outputs
	output out;
	reg out;
	output A,B,C,D,E,F;
	reg A,B,C,D,E,F; //current state
	
	always@(in or reset or flux) begin 
		if(reset == 1) begin 
			A = 1;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("Reseting the FSM");
		end 
		//start at state A, input = 0 --> state A
		else if(A == 1 && in == 0) begin 
			A = 1;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("Invalid pattern detected! Returning to State A...");
		end 
		//start at state A, input = 1 --> state B
		else if(A == 1 && in == 1) begin
			A = 0;
			B = 1;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("1st bit of pattern detected! Moving to State B...");
		end
		//start at state B, input = 0 --> state C
		else if(B == 1 && in == 0) begin 
			A = 0;
			B = 0;
			C = 1;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("2nd bit of pattern detected! Moving to State C...");
		end
		//start at state B, input = 1 --> state A
		else if(B == 1 && in == 1) begin 
			A = 1;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("Invalid pattern detected! Returning to State A...");
		end
		//start at state C, input = 0 --> state A
		else if(C == 1 && in == 0) begin 
			A = 1;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("Invalid pattern detected! Returning to State A...");
		end
		//start at state C, input = 1 --> state D
		else if(C == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 1;
			E = 0;
			F = 0;
			out = 0;
			$display("3rd bit of pattern detected! Moving to State D...");
		end 
		//start at state D, input = 0 --> state A
		else if(D == 1 && in == 0) begin 
			A = 1;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 0;
			out = 0;
			$display("Invalid pattern detected! Returning to State A...");
		end 
		//start at state D, input = 1 --> state E
		else if(D == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 0;
			E = 1;
			F = 0;
			out = 1;
			$display("Input pattern '1011' detected! Output is now 1");
		end 
		//start at state E, move to state F
		else if(E == 1) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			F = 1;
			out = 1;
			$display("Input pattern '1011' detected! Output is now 1 1");
		end 
	end 
endmodule 
			