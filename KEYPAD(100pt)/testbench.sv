`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:43 01/06/2021
// Design Name:   phone
// Module Name:   C:/Users/orkun/projects/OrkunErdemTermProject20701/test.v
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

module test;

	// Inputs
	reg clk;
	reg rst;
	reg Keypressed;
  reg [7:0] button;

	// Outputs
	wire [63:0] statusMsg;

	// Instantiate the Unit Under Test (UUT)
	phone uut (
		.clk(clk), 
		.rst(rst), 
		.Keypressed(Keypressed), 
      .button(button), 
		.statusMsg(statusMsg)
	);

	always #5 clk = ~clk; 

initial begin
	// initialize every input to 0
	clk = 0;
	rst = 0;
	Keypressed = 0;
	button = 0;
	 
	
	// reset your circuit
	rst=1; #20; rst=0; #20; rst=0;              // reset
  
  Keypressed=1;#10;Keypressed=0;button=1;#10;
  Keypressed=1;#10;Keypressed=0;button=2;#10;
  Keypressed=1;#10;Keypressed=0;button=3;#10;
  Keypressed=1;#10;Keypressed=0;button=4;#10;
	#50;
  	rst=1; #20; rst=0; #20;
	Keypressed=1;#10;Keypressed=0;button=3;#10;
	Keypressed=1;#10;Keypressed=0;button=4;#10;
	Keypressed=1;#10;Keypressed=0;button=2;#10;
	Keypressed=1;#10;Keypressed=0;button=1;#10;


	

	
end

always #5 clk = ~clk;
  initial #400 $finish;
   initial
     begin
	$dumpfile("dump.vcd");
	$dumpvars;
     end

endmodule
