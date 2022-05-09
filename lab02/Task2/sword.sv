//следит за тем, есть ли у вас на текущий момент времени меч или же нет
module sword(input logic clk, reset,
		input logic sword_in,
		output logic sword_out);

	logic state, nextstate;
	
	// регистр состояния
	always @(posedge clk, posedge reset)
		begin
			if (reset) 	state <= 0;
			else			state <= nextstate;
		end

	// логика следующего состояния
   always_comb
		case (state)
			0: if (sword_in) nextstate = 1;
				else 			  nextstate = 0;
			1: 				  nextstate = 1;
		endcase
	// выходная логика
	assign sword_out = (state == 1);
	
endmodule
