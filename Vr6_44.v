module Vr6_44(A,B,C G1A_L,G1B_L,G2,OE,Y,ENOUT_L);
	input A,B,C;
	input G1A_L,G1B_L,G2;
	input OE;
	output [0:7] Y;
	output ENOUT_L;
	reg [0:7] Y;
	reg G1A,G1B,ENOUT;
	reg [0:7] temp; //中间变量
	reg [2:0] temp_input;
	reg ENOUT_L;
	integer i;
	
	always @ (A or B or C or G1A_L or G1B_L or G2 or OE or Y or ENOUT_L)
	begin
		temp_input[0] = A;
		temp_input[1] = B;
		temp_input[2] = C;
		G1A = ~G1A_L;
		G1B = ~G1B_L;
		ENOUT = ENOUT_L;
		
		if(G1A && G2A && G2)
    		case(temp_input)
    			0: temp = 8'b10000000;
    			1: temp = 8'b01000000;
    			2: temp = 8'b00100000;
    			3: temp = 8'b00010000;
    			4: temp = 8'b00001000;
    			5: temp = 8'b00000100;
    			6: temp = 8'b00000010;
    			7: temp = 8'b00000001;
    			default: temp = 8'b00000000;
    		endcase
    	else temp = 8'b00000000;
    	
    	if(OE)
    	begin
    		ENOUT = 1;
    		for(i = 0;i < 8; i++)
    		begin
    			Y[i] = temp[i]^(~OE);
    		end
    	end
    end
endmodule
		
		
			