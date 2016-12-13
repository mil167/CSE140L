`timescale 1ns / 1ps

//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module diagram_to_verilog(in,reset,flux,out,A,B,C,D,E);
	//input
	input in;
	input reset;
	input flux; //the purpose of this variable is to switch between 0 and 1
					//otherwise, there is no practical way of traversing the 
					//entire FSM diagram and testing all possible cases without
					//some instances ignoring the sensitivity list
	
	//output
	output out;
	output A,B,C,D,E;
	reg out;
	reg A,B,C,D,E; //current state
	always@(in or reset or flux) begin 
		if(reset == 1) begin
			A = 1; //currently at state A
			B = 0;
			C = 0;
			D = 0;
			E = 0;
			out = 0;
			$display("Reseting the FSM");
		end 
		//currently at state A, input = 0 --> state B
		else if(A == 1 && in == 0) begin 
			A = 0;
			B = 1;
			C = 0;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state A to B");
		end 
		//currently at state A, input = 0 --> state C
		else if(A == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 1;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state A to C");
		end 
		//currently at state B, input = 0 --> state B
		else if(B == 1 && in == 0) begin 
			A = 0;
			B = 1;
			C = 0;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state B to B");
		end 
		//currently at state B, input = 1 --> state D
		else if(B == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 1;
			E = 0;
			out = 1;
			$display("Transitioning from state B to D");
		end 
		//currently at state C, input = 0 --> state E
		else if(C == 1 && in == 0) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 0;
			E = 1;
			out = 1;
			$display("Transitioning from state C to E");
		end 
		//currently at state C, input = 1 --> state C
		else if(C == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 1;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state C to C");
		end 
		//currently at state D, input = 0 --> state E
		else if(D == 1 && in == 0) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 0;
			E = 1;
			out = 1;
			$display("Transitioning from state D to E");
		end 
		//currently at state D, input = 1 --> state C
		else if(D == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 1;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state D to C");
		end 
		//currently at state E, input = 0 --> state B
		else if(E == 1 && in == 0) begin 
			A = 0;
			B = 1;
			C = 0;
			D = 0;
			E = 0;
			out = 0;
			$display("Transitioning from state E to B");
		end 
		//currently at state E, input = 1 --> state D
		else if(E == 1 && in == 1) begin 
			A = 0;
			B = 0;
			C = 0;
			D = 1;
			E = 0;
			out = 1;
			$display("Transitioning from state E to D");
		end 
	end 
endmodule 
			
		
		
	