module Var6_89(DU,DC,NOERROR);
	input [1:7] DU;
	output [1:7] DC;
	output NOERROR;
	reg [1:7] DC;
	reg NOERROR;
	
	function [2:0] syndrome;
		input [1:7] D;
		begin
			syndrome[0] = D[1] ^ D[3] ^ D[5] ^ D[7];
			syndrome[1] = D[2] ^ D[3] ^ D[6] ^ D[7];
			syndrome[2] = D[4] ^ D[5] ^ D[6] ^ D[7];
		end
	endfunction
	
	integer i;
	always @ (DU)
	begin
		DC = DU;
		i = syndrome(DU);
		if(i == 3'b0) NOERROR = 1'b1;
		else
		begin
			NOERROR = 1'b0;
			DC[i] = ~DU[i];
		end
	end
endmodule