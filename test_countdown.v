`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_countdown();
	reg start;
	reg stop;
	reg reset; 
	reg clk;
	
	wire [3:0] counter; 
	wire alarm;
	
	countdown uut(
		.start(start),
		.stop(stop),
		.reset(reset),
		.clk(clk),
		.counter(counter),
		.alarm(alarm)
	);
	
	initial begin 
		clk = 0;
		start = 0;
		stop = 0;
		reset = 0;
	end 
	
	always 
		#5 clk = !clk;
		
	initial begin 
		#10 
		start = 1;
		
		//at this point the counter reaches 0000, turn start = 0, stop = 1, reset the counter back to 1111
		#200
		start = 0;
		reset = 1;

		#10
		reset = 0;
		start = 1;
		
		//wait until 6seconds are left, stop counter, reset back to 1111
		#90
		start = 0;
		stop = 1;
		reset = 1;
		
		#10
		reset = 0;
		
		
		/*
		#10
		stop = 0;
		start = 1;
		//wait 9 cycles and reset the counter
		#90
		reset = 1;
		reset = 0;
		start = 0;
		stop = 1;
		*/
	end 
endmodule 