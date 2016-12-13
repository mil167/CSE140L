`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module countdown(start,stop,reset,clk,counter,alarm);

	input start;
	input stop;
	input reset; 
	input clk;
	
	output [3:0]counter;
	reg [3:0]counter;
	output alarm;
	reg alarm;
	
	always@(posedge clk) begin 
		//initial condition
		if(start == 0 && stop == 0 && reset == 0) begin 
			counter <= 4'b1111;
			alarm <= 0;
		end 
		//if reset is pressed, make counter display 15, set reset to 0, set alarm to 0
		if(reset == 1) begin
			counter <= 4'b1111;
			alarm <= 1'b0;
		end
		//counter counts down as long as start is ON and counter is not 0
		if(counter > 4'b0000) begin
		/*
			//if counter is at 0 and reset has not been pressed
			if(counter == 4'b0000 && reset == 0) begin
				alarm <= 1;
			end
		*/	
			if(start == 1) begin 
				counter <= counter - 1;
			end 
		end 
		//if counter is at 0 and reset has not been pressed
		if(counter == 4'b0000 && reset == 0) begin
			alarm <= 1;
		end 
	end 
endmodule 
			
	