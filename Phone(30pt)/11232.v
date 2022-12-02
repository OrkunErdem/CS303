`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:10:14 01/06/2021 
// Design Name: 
// Module Name:    phone 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module phone (input clk,
 input rst,
 input startCall, answerCall,
 input endCallCaller, endCallCallee,
 input sendCharCaller, sendCharCallee,
 input [7:0] charSent,
 output reg [63:0] statusMsg,
 output reg [63:0] sentMsg
 );
/////////////////////////////////////////////////////////////////////////
parameter [2:0]idle 	  = 3'b000; 
parameter [2:0]ringing 	  = 3'b001;
parameter [2:0]callerturn = 3'b010;
parameter [2:0]calleeturn = 3'b011;  
parameter [2:0]rejected   =	3'b100;
parameter [2:0]cost		  =	3'b101;
/////////////////////////////////////////////////////////////////////////
reg [31:0] counter;
reg [7:0] currentstate;
reg [7:0] next_state;
/////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
begin:phone
if(rst)begin
sentMsg[63:0]<="        ";
currentstate<= idle;
end
//////////////////////////////////////////////////////////////////////////////////////////
case(currentstate)
//////////////////////////////////////////////////////////////////////////////////////////
idle:begin
statusMsg<="IDLE   ";
if(startCall)begin currentstate<=ringing;
				statusMsg<="        ";
end
end
//////////////////////////////////////////////////////////////////////////////////////////
ringing:begin
	statusMsg<="RINGING ";
	if(answerCall)begin currentstate<=callerturn;
	statusMsg<="        ";end
	else if(endCallCallee) begin currentstate<=rejected; 
	statusMsg<="        ";end
	end
///////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
rejected:begin
 statusMsg<="REJECTED";
 statusMsg<="        ";
 currentstate<=idle;	
end
callerturn:begin
	statusMsg<="CALLER  ";
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if((charSent>63)&&(charSent<127))begin
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
end
//////////////////////////////////////////////////////////////////////////////////////////	
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if((charSent>63)&&(charSent<127))begin
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
//////////////////////////////////////////////////////////////////////////////////////////	
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCaller)begin
if(charSent==127) begin currentstate<=calleeturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[63:56]<=sentMsg[55:48];
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[63:56]<=sentMsg[55:48];
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
				end
///////////////////////////////////////////////////////////////////////////////////

end
/////////////

///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
calleeturn:begin
	statusMsg<="CALLEE  ";
	if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if((charSent>63)&&(charSent<127))begin
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
end
//////////////////////////////////////////////////////////////////////////////////////////	
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if((charSent>63)&&(charSent<127))begin
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
//////////////////////////////////////////////////////////////////////////////////////////	
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
if(endCallCallee) begin currentstate<=cost; 
sentMsg<="        ";
statusMsg<="        "; end
else if(endCallCaller)begin currentstate<=cost;
sentMsg<="        ";
statusMsg<="        "; end
else if(sendCharCallee)begin
if(charSent==127) begin currentstate<=callerturn; 
sentMsg<="        ";
statusMsg<="        "; end
else if((charSent<58)&&(charSent>31))begin
	sentMsg[63:56]<=sentMsg[55:48];
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+1;end
else if ((charSent>63)&&(charSent<127))begin
	sentMsg[63:56]<=sentMsg[55:48];
	sentMsg[55:48]<=sentMsg[47:40];
	sentMsg[47:40]<=sentMsg[39:32];
	sentMsg[39:32]<=sentMsg[31:24];
	sentMsg[31:24]<=sentMsg[23:16];
	sentMsg[23:16]<=sentMsg[15:8];
	sentMsg[15:8]<=sentMsg[7:0];
	sentMsg[7:0]<=charSent;
	counter<=counter+2;end
	end
///////////////////////////////////////////////////////////////////////////////////
end
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
cost:begin

statusMsg<="COST   ";
sentMsg<=counter;
currentstate<=idle;
end
default: currentstate<=idle;
endcase

end
endmodule
