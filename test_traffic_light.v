`timescale 1ns / 1ps 
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_traffic_light;
	
	reg in; 
	reg clk;
	
	wire [1:0] out; 
	
	traffic_light uut(
		.in(in),
		.clk(clk),
		.out(out)
	);
	
	initial begin 
		in = 0;
		clk = 1;
	end 
	
	always 
		#10 clk = !clk;
			
	initial begin 
		//turn the light GREEN
		#10 
		in = 1;
		
		//wait 3 clock cycles and turn the light ORANGE
		#30;
		
		//wait 2 clock cycles and turn the light RED
		#20;
		in = 0;
		#10
		$stop;
	end 
endmodule 
		