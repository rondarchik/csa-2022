module lab2_10(input logic clk,
               input logic reset,
               input logic left, right,
               output logic la, lb, lc, ra, rb, rc);
	
	logic [5:0] state, nextstate;
	logic notstate0, notstate1, notstate2, notstate3, notstate4, notstate5, notleft, notright;
	
	flopr flop(clk, reset, nextstate, state);
	
	not n0(notstate0, state[0]);
	not n1(notstate1, state[1]);
	not n2(notstate2, state[2]);
	not n3(notstate3, state[3]);
	not n4(notstate4, state[4]);
	not n5(notstate5, state[5]);
	
	not nl(notleft, left);
	not nr(notright, right);
	
	and and1(nextstate[0], notstate5, notstate4, notstate3, notstate2, notstate1, notstate0, left, notright);
	and and2(nextstate[3], notstate5, notstate4, notstate3, notstate2, notstate1, notstate0, notleft, right);
	
	assign nextstate[1] = state[0];
	assign nextstate[2] = state[1];
	assign nextstate[4] = state[3];
	assign nextstate[5] = state[4];
	
	assign lc = state[0]; //L1
	assign lb = state[1]; //L2
	assign la = state[2]; //L3
	assign rc = state[3]; //R1
	assign rb = state[4]; //R2
	assign ra = state[5]; //R3
					
endmodule 