`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_four_to_one_mux;

	reg p_0;
	reg p_1;
	reg p_2;
	reg p_3;
	
	reg s_0;
	reg s_1;
	
	wire OUT;
	
	four_to_one_mux uut(
		.p_0(p_0),
		.p_1(p_1),
		.p_2(p_2),
		.p_3(p_3),
		.s_0(s_0),
		.s_1(s_1),
		.OUT(OUT)
	);
	
	initial begin 
		//select port 0
		s_0 = 1'b0;
		s_1 = 1'b0;
		
		//to make it clear which port was being selected by the MUX, I made the
		//selected port different from the others. I will only have two test cases
		//for each selected port
		p_0 = 1'b0;
		p_1 = 1'b1;
		p_2 = 1'b1;
		p_3 = 1'b1;
		
		//global reset secondary case of select port 0
		#10
		p_0 = 1'b1;
		p_1 = 1'b0;
		p_2 = 1'b0;
		p_3 = 1'b0;
		
		//select port 1
		#10
		s_0 = 1'b0;
		s_1 = 1'b1;
		
		p_0 = 1'b1;
		p_1 = 1'b0;
		p_2 = 1'b1;
		p_3 = 1'b1;
		
		//global reset secondary case of select port 1
		#10		
		p_0 = 1'b0;
		p_1 = 1'b1;
		p_2 = 1'b0;
		p_3 = 1'b0;
		
		//select port 2
		#10
		s_0 = 1'b1;
		s_1 = 1'b0;
		
		p_0 = 1'b1;
		p_1 = 1'b1;
		p_2 = 1'b0;
		p_3 = 1'b1;
		
		//global reset secondary case of select port 2
		#10
		p_0 = 1'b0;
		p_1 = 1'b0;
		p_2 = 1'b1;
		p_3 = 1'b0;
		
		//select port 3
		#10 
		s_0 = 1'b1;
		s_1 = 1'b1;
		
		p_0 = 1'b1;
		p_1 = 1'b1;
		p_2 = 1'b1;
		p_3 = 1'b0;
		
		//global reset secondary case of select port 3
		#10
		p_0 = 1'b0;
		p_1 = 1'b0;
		p_2 = 1'b0;
		p_3 = 1'b1;
		
		end 
endmodule 