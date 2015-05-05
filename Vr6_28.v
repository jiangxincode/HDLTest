module Vr6_28(GS_L,A2,A1,A0,INFO);
	input GS_L,A2,A1,A0;
	output INFO;
	reg GS;
	reg char[0:8*6] INFO;
	
	always @ (GS_L or A2 or A1 or A0)
	begin
		GS = ~GS_L;
		if(GS)
		begin
			if(A2 == 0 && A1 == 0)
				INFO = "BILL_L";
			else if(A2 == 0 && A0 == 0)
				INFO = "MARY_L";
			else if(A2 == 0 && A1 == 1)
				INFO = "JOAN_L";
			else if(A2 == 0 && A0 == 1)
				INFO = "PAUL_L";
			else if(A2 == 1 && A1 == 0)
				INFO = "ANNA_L";
			else if(A2 == 1 && A0 == 0)
				INFO = "FRED_L";
			else if(A2 == 1 && A1 == 1)
				INFO = "DAVE_L";
			else if(A2 == 1 && A0 == 1)
				INFO = "KATE_L";
		end
		else INFO = "";
	end;
endmodule
			