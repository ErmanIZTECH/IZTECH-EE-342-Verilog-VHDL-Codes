module Lab4(ClkIn,PDataIn,PDataOut,Send,Ready);
input ClkIn,Send;
input [7:0] PDataIn;
output Ready;
output [7:0] PDataOut;
wire SCout,SDout;

SerTX Tx1(ClkIn,Send,PDataIn,SCout,SDout);
SerRX Rx1(SCout,SDout,PDataOut,Ready);
endmodule
