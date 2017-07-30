module counter3b	(
Out     ,  // Output of the counter
Clk     ,  // clock Input
nReset      // reset Input
);
//------------Input Ports--------------
     input Clk, nReset;
//------------Internal Variables--------
   output reg [2:0] Out;
//-------------Code Starts Here-------
always @(posedge Clk or negedge nReset)
if (nReset == 0) 
begin
  Out[2:0] <= 3'b0 ;
end 
else 
begin
  Out[2:0] <= Out[2:0] + 3'b1;
end

endmodule 


module Lab1 (
Clock,	//Clk of counter
Reset,	//reset of counter
Fout,	//Function Output 
S1,		//Select Input
Out);
input Clock,S1,Reset;
output Fout,Out;
counter3b count1(Out,Clock,Reset);
wire [2:0]Out;

assign Fout = (S1 == 1'b0) ? (Out[0] & Out[2]) : (Out[0] ^ Out[2]);
endmodule





