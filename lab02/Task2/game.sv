module game(input  logic clk, reset,
            input  logic N, S, E, W,
            output logic Win, Die);
				
logic sword_in, sword_out;

room room_state(clk, reset, N, S, E, W, sword_in, sword_out, Win, Die);

sword sword_state(clk, reset, sword_out, sword_in);
					
endmodule
