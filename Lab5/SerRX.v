module SerRX (SCin,SDin,PDout,PDready,ParErr,Parity,Parr);
input SCin,SDin;
output [7:0]PDout;
output ParErr;
output reg PDready;
reg [3:0]Count;
reg [7:0]Rec;
reg [7:0]Temp;
output reg Parity;
output reg Parr;

always @(posedge SCin)
begin
	if(SCin == 1'b1 && SDin==1'b1 && Count[3:0] == 4'd0)
		begin
			Count[3:0] <= 4'd9;
		end
	if(Count[3:0] != 4'd0)
		begin
			if(Count[3:0] != 4'd1)
				begin
					Rec[0] <= SDin;
					Rec[7:1] <= Rec[6:0];
				end
			Count[3:0] <= Count[3:0] - 4'd1;
		end
	if(Count[3:0]== 4'd1)
		begin
		Temp[7:0]<=Rec[7:0];
		end
	else if(SCin == 1'b0 && Count[3:0] == 4'd0)
		begin
			Count[3:0] <= 4'd0;
			Rec[7:0]<=Rec[7:0];
		end
end
always@(posedge SCin)
if(Count[3:0] == 4'd2)
	PDready = 1'b1;
else
	PDready = 1'b0;


always@(posedge SCin)
	if(PDready == 1'b1)
		begin
			Parity <= SDin;
			Parr<=^Rec[7:0];
		end

assign ParErr = (Parr != Parity && (Count[3:0]==4'd1 || Count[3:0]==4'd0) )? 1'b1:1'b0;
assign PDout[7:0] = (Count[3:0]==4'd1 || Count[3:0]==4'd0)? Rec[7:0] : Temp[7:0];


endmodule
