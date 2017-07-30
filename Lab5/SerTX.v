module SerTX (Clk,Send,PDin,SCout,SDout);
input Clk,Send;
input [7:0]PDin;
output SCout,SDout;
reg [8:0]D;
reg EnParOut,ParOut;
reg Data;

reg Send_d1;
wire Send_1cyc;

always @(posedge Clk)		//Asynchronous Send AND Long Send Data Input..
  Send_d1 <= Send;
assign Send_1cyc = ~Send_d1 & Send;

always @(posedge Send_1cyc or posedge EnParOut)		//Asynchronous 
begin
	if(EnParOut == 1'b1)
		ParOut<=1'b0;
	else
		ParOut<=1'b1;
end

always@(posedge Clk)
	EnParOut <= ParOut;


always @(posedge Clk)
begin
	if(EnParOut == 1'b1)
		begin
		D[8:1] <= PDin[7:0];
		D[0] <= ^PDin[7:0];
		Data <= 1'b1;
		end
	else
		begin
			D[8:1] <= D[7:0];
			D[0] <= 1'b0;
			Data <= D[8];
		end

end
assign SCout = Clk;
assign SDout = Data;

endmodule
