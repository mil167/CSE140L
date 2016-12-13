`timescale 1ns / 1ps
//Name: Michael Li
//PID: A12420469
//Email: mil167@ucsd.edu

module test_eight_to_one_mux();

	reg in0,in1,in2,in3,in4,in5,in6,in7;
	reg s0,s1,s2;
	
	wire OUT;
	
	//instantiate uut
	eight_to_one_mux uut(
		.in0(in0),
		.in1(in1),
		.in2(in2),
		.in3(in3),
		.in4(in4),
		.in5(in5),
		.in6(in6),
		.in7(in7),
		.s0(s0),
		.s1(s1),
		.s2(s2),
		.OUT(OUT)
	);
	
	initial begin
		//select port 0
		s0 = 1'b0;
		s1 = 1'b0;
		s2 = 1'b0;
		
		//output should be 0
		in0 = 0;
		in1 = 1;
		in2 = 1;
		in3 = 1;
		in4 = 1;
		in5 = 1;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 1;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 0;
		
		//select port 1
		#10
		s0 = 1'b1;
		s1 = 1'b0;
		s2 = 1'b0;
		
		//output should be 0
		in0 = 1;
		in1 = 0;
		in2 = 1;
		in3 = 1;
		in4 = 1;
		in5 = 1;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 1;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 0;		
		
		//select port 2
		#10
		s0 = 1'b0;
		s1 = 1'b1;
		s2 = 1'b0;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 0;
		in3 = 1;
		in4 = 1;
		in5 = 1;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 1;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 0;			
		//select port 3
		#10
		s0 = 1'b1;
		s1 = 1'b1;
		s2 = 1'b0;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 1;
		in3 = 0;
		in4 = 1;
		in5 = 1;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 1;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 0;			

		//select port 4
		#10
		s0 = 1'b0;
		s1 = 1'b0;
		s2 = 1'b1;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 1;
		in3 = 1;
		in4 = 0;
		in5 = 1;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 1;
		in5 = 0;
		in6 = 0;
		in7 = 0;		
	
		//select port 5
		#10
		s0 = 1'b1;
		s1 = 1'b0;
		s2 = 1'b1;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 1;
		in3 = 1;
		in4 = 1;
		in5 = 0;
		in6 = 1;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 1;
		in6 = 0;
		in7 = 0;				
		
		//select port 6
		#10
		s0 = 1'b0;
		s1 = 1'b1;
		s2 = 1'b1;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 1;
		in3 = 1;
		in4 = 1;
		in5 = 1;
		in6 = 0;
		in7 = 1;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 1;
		in7 = 0;			
		
		//select port 7
		#10
		s0 = 1'b1;
		s1 = 1'b1;
		s2 = 1'b1;
		
		//output should be 0
		in0 = 1;
		in1 = 1;
		in2 = 1;
		in3 = 1;
		in4 = 1;
		in5 = 1;
		in6 = 1;
		in7 = 0;
		
		//output should be 1
		#10
		in0 = 0;
		in1 = 0;
		in2 = 0;
		in3 = 0;
		in4 = 0;
		in5 = 0;
		in6 = 0;
		in7 = 1;	
		
		end
endmodule 