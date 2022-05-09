//следит за тем, в какой комнате вы сейчас находитесь
module room(input logic clk, reset,
				input logic N, S, E, W, sword_in,
			   output logic sword_out, Win, Die);
	
	typedef enum logic [3:0] {CC, WT, DE, SR, SC, DL, VV, DC} statetype;
	statetype state, nextstate;
	
	// регистр состояния
	// включение и асинхронный сброс
	always @(posedge clk, posedge reset)
		begin
			if (reset) state <= CC;
			else       state <= nextstate;
		end
		
	// логика следующего состояния
	always_comb
		case (state)
			CC:	if (E) 		  nextstate = WT;
					else			  nextstate = CC;
			WT:	if (S) 		  nextstate = SR;
					else if (E)   nextstate = DE;
					else if (W)   nextstate = CC;
					else			  nextstate = WT;
			DE:	if (S) 		  nextstate = DL;
					else if (W)   nextstate = WT;
					else 			  nextstate = DE;
			SR:	if (N)		  nextstate = WT;
					else if (W)   nextstate = SC;
					else if (E)	  nextstate = DL;
					else 		  	  nextstate = SR;
			SC:	if (E)   	  nextstate = SR;
					else 			  nextstate = SC;
			DL:	if (sword_in) nextstate = VV;
					else			  nextstate = DC;
			VV:					  nextstate = VV;
			DC:					  nextstate = DC;
			default: 			  nextstate = CC;
		endcase
		 
	 // выходная логика
	assign Win = (state == VV);
	assign Die = (state == DC);
	assign sword_out = (state == SC);

endmodule 