module Counter4b(nReset,Clk,CountEn,COut,EnableNext);
input Clk,CountEn,nReset;
output EnableNext;
output reg [3:0]COut;

always @(posedge Clk or negedge nReset)
	begin
		if(nReset == 1'b0)
			COut[3:0] <= 4'd0;
		else
			if(CountEn == 1'b1)
				if(COut[3:0] == 4'd9)
					COut[3:0] <= 4'b0;
				else
					COut[3:0] <= COut[3:0] + 4'd1;
	end 

assign EnableNext =(COut[3:0] == 4'd9)? (1'b1&CountEn) : (1'b0&CountEn);

endmodule
