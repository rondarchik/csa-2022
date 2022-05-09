module flopr(input logic clk,
				 input logic reset,
				 input logic [5:0] d,
				 output logic [5:0] q);
				 
	always_ff @(posedge clk)
		if(reset) q <= 6'b0;
		else q <= d;
endmodule