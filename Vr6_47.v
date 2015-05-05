module Vr6_47(A,B,C,D,EN,SEGA,SEGB,SEGC,SEGD,SEGE,SEGF,SEGG);
	input A,B,C,D,EN;
	output SEGA,SEGB,SEGC,SEGD,SEGE,SEGF,SEGG;
	reg SEGA,SEGB,SEGC,SEGD,SEGE,SEGF,SEGG;
	reg [1:7] SEGS;
	
	always @ (A or B or C or D or EN)
	begin
		if(EN)
		begin
			case({A,B,C,D})
				0: SEGS = 7'b1111110;
				1: SEGS = 7'b0110000;
				2: SEGS = 7'b1101101;
				3: SEGS = 7'b1111001;
				4: SEGS = 7'b0110011;
				5: SEGS = 7'b1011011;
				6: SEGS = 7'b1011111; //if no 'tail' 7'b0011111;
				7: SEGS = 7'b1110000;
				8: SEGS = 7'b1111111;
				9: SEGS = 7'b1111011; //if no 'tail' 7'b1110011
				default SEGS = 7'b1001111; //7'bx
			endcase
		end
		else SEGS = 7'b0;
		
		{SEGA,SEGB,SEGC,SEGD,SEGE,SEGF,SEGG} = SEGS;
	end
endmodule
				