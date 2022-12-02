`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:11:52 01/06/2021
// Design Name:   phone
// Module Name:   C:/Users/orkun/projects/OrkunErdemTermProject20701/mytest.v
// Project Name:  OrkunErdemTermProject20701
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: phone
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mytest;

	// Inputs
	reg clk;
	reg rst;
	reg startCall;
	reg answerCall;
	reg endCallCaller;
	reg endCallCallee;
	reg sendCharCaller;
	reg sendCharCallee;
	reg [7:0] charSent;

	// Outputs
	wire [63:0] statusMsg;
	wire [63:0] sentMsg;

	// Instantiate the Unit Under Test (UUT)
	phone uut (
		.clk(clk), 
		.rst(rst), 
		.startCall(startCall), 
		.answerCall(answerCall), 
		.endCallCaller(endCallCaller), 
		.endCallCallee(endCallCallee), 
		.sendCharCaller(sendCharCaller), 
		.sendCharCallee(sendCharCallee), 
		.charSent(charSent), 
		.statusMsg(statusMsg), 
		.sentMsg(sentMsg)
	);

		always #5 clk = ~clk; 

initial begin
	// initialize every input to 0
	clk = 0;
	rst = 0;
	startCall = 0;
	answerCall = 0;
	endCallCaller = 0;
	endCallCallee = 0;
	sendCharCaller = 0;
	sendCharCallee = 0;
	charSent = " ";
	
	// Xilinx global reset time
	#100; 
	
	// reset your circuit
	rst=1; #20; rst=0; #20; rst=0;              // reset
	
	startCall=1; #10; startCall=0; #10;         // caller starts call
	#100;                                       // statusMsg displaying "RINGING " 
	                                            // no answer for 10 clock cycles (and go back to IDLE)
	#20;
	
	startCall=1; #10; startCall=0; #10;         // caller starts call
	#20;                                        // statusMsg displaying "RINGING " 
	endCallCaller=1; #10; endCallCaller=0; #10; // caller ends the call
	#20;                                        // statusMsg displaying "RINGING " 
	
	startCall=1; #10; startCall=0; #10;         // caller starts call
	#20;                                        // statusMsg displaying "RINGING " 
	endCallCallee=1; #10; endCallCallee=0; #10; // callee rejects the call
	#100;                                       // statusMsg displaying 'REJECTED' for 10 clock cycles
	#20;
	
	startCall=1; #10; startCall=0;              // caller starts call
	#20;                                        // statusMsg displaying "RINGING " 
	answerCall=1; #10; answerCall=0;            // callee answer call
	#20;                                        // statusMsg displaying "CALLER  " 

	sendCharCaller=1; charSent="O"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="R"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="K"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="U"; #10; sendCharCaller=0; #10;
	sendCharCaller=1; charSent="N"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent=" "; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="E"; #10; sendCharCaller=0; #10; 
	#10;
	#10;
	sendCharCaller=1; charSent="R"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="D"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="E"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="M"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="2"; #10; sendCharCaller=0; #10; 
	sendCharCaller=1; charSent="0"; #10; sendCharCaller=0; #10; 
	#10;
	#10;
	sendCharCaller=1; charSent=127; #10; sendCharCaller=0; #10; 
	#10;                                                        
	#10;
	sendCharCallee=1; charSent="7"; #10; sendCharCallee=0; #10; 
	sendCharCallee=1; charSent="0"; #10; sendCharCallee=0; #10; 
	#10;
	sendCharCallee=1; charSent="1"; #10; sendCharCallee=0; #10; 
	sendCharCallee=1; charSent="0"; #10; sendCharCallee=0; #10; 
	sendCharCallee=1; charSent="1"; #10; sendCharCallee=0; #10; 
	#10;
	endCallCallee=1; #10; endCallCallee=0; 
	#50;	                              
end

// module instantiation

endmodule
