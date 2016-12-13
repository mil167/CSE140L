`timescale 1ns / 1ps 
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module traffic_light(in,clk,out);

	//inputs 
	input in;
	input clk;

	//outputs 
	output [1:0] out; 
	reg [1:0] out;
	//traffic light begins at RED 
	
	always@(posedge clk) begin
		if(in == 0) begin 
			out[0] = 0;
			out[1] = 1;
		end 
		else if(out[0] == 0 && out[1] == 1 && in == 1) begin 
			out[0] = 1;
			out[1] = 1;
		end else if(out[0] == 1 && out[1] == 1 && in == 1) begin 
			out[0] = 1;
			out[1] = 0;
		end else if(out[0] == 1 && out[1] == 0 && in == 1) begin 
			out[0] = 0;
			out[1] = 1;
		end 
	end 
endmodule 