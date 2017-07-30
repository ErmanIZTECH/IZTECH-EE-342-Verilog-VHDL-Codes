module Lab5(ClkIn,PDataIn,PDataOut,Send,Ready,ParErr,SDout,Parity,Parr);
input ClkIn,Send;
input [7:0] PDataIn;
output ParErr,Ready;
output [7:0] PDataOut;
output SDout,Parity,Parr;
wire SCout,SDout;

SerTX Tx1(ClkIn,Send,PDataIn,SCout,SDout);
SerRX Rx1(SCout,SDout,PDataOut,Ready,ParErr,Parity,Parr);
endmodule
