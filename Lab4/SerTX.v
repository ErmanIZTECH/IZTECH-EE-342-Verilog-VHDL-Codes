module SerTX (Clk,Send,PDin,SCout,SDout);
input Clk,Send;
input [7:0]PDin;
output SCout,SDout;
reg [7:0]D;
reg Data;

reg Send_d1;     //One Cycle Send signal.
wire Send_1cyc;

always @(posedge Clk)
  Send_d1 <= Send;
assign Send_1cyc = ~Send_d1 & Send;

always @(posedge Clk)
begin
	if(Send_1cyc == 1'b1)
		begin
		D[7:0] <= PDin[7:0];
		Data <= 1'b1;
		end
	else
		begin
			D[7:1] <= D[6:0];
			D[0] <= 1'b0;
			Data <= D[7];
		end

end
assign SCout = Clk;
assign SDout = Data;

endmodule
