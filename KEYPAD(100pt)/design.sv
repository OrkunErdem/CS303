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
 input Keypressed,
 input [7:0] button,
 output reg [63:0] statusMsg
 );
/////////////////////////////////////////////////////////////////////////
parameter [2:0]idle 	  = 3'b000; 
parameter [2:0]ringing 	  = 3'b001;
parameter [2:0]cost 	  = 3'b010;

/////////////////////////////////////////////////////////////////////////
reg [31:0] counter;
reg [3:0] valid;
reg [7:0] currentstate;
reg [7:0] next_state;
reg[3:0]key;
/////////////////////////////////////////////////////////////////////////
always@(posedge clk or posedge rst)
begin:phone
if(rst)begin
statusMsg[63:0]<="        ";
currentstate<= idle;
counter<=0;

end
//////////////////////////////////////////////////////////////////////////////////////////
case(currentstate)
//////////////////////////////////////////////////////////////////////////////////////////
idle:begin
  key[0]<=1;
  key[1]<=2;
  key[2]<=3;
  key[3]<=4;
if(Keypressed)begin currentstate<=ringing;
end
end
//////////////////////////////////////////////////////////////////////////////////////////
ringing:begin
  if(Keypressed==0)begin
      if(counter==0)
        begin
          valid[0]<=button;
		  counter<=counter+1;
		  currentstate<=idle;
        end	
	if(counter==1)
        begin
          valid[1]<=button;
		  counter<=counter+1;
		  currentstate<=idle;
        end	
	if(counter==2)
        begin
          valid[2]<=button;
		  counter<=counter+1;
		  currentstate<=idle;
        end		
	if(counter==3)begin 
      valid[3]<=button;
	currentstate<=cost;end
    end
end


cost:begin
if(valid==key)begin
statusMsg<="VALID   ";
  currentstate<=idle;end
else
  begin
statusMsg<="INVALID ";
currentstate<=idle;
end
end
default: currentstate<=idle;
endcase

end
endmodule
