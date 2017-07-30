module Lab2(nReset,Clk,CountEn, Co0, Co1, Co2);
input Clk,CountEn;
input nReset;
wire [1:0] NextEn;
output [3:0] Co0;
output [3:0] Co1;
output [3:0] Co2;

Counter4b C0(.nReset(nReset), .Clk(Clk), .CountEn(CountEn),   .COut(Co0), .EnableNext(NextEn[0]));
Counter4b C1(.nReset(nReset), .Clk(Clk), .CountEn(NextEn[0]), .COut(Co1), .EnableNext(NextEn[1]));
Counter4b C2(.nReset(nReset), .Clk(Clk), .CountEn(NextEn[1]), .COut(Co2), .EnableNext(         ));
endmodule 
