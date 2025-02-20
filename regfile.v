`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 22:08:09
// Design Name: 
// Module Name: regfile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regfile(
input clk,
input we3,
input [3:0] ra1,ra2,wa3, // wa1 and wa2 for read, wa3 for write
input [31:0]wd3,R15,
output [31:0] rd1,rd2
    );
reg [31:0] rf[14:0];
  always @(posedge clk)
  if(we3) rf[wa3]<= wd3;
  assign rd1 = (ra1==4'b1111)?R15:rf[ra1];
  assign rd2 = (ra2==4'b1111)?R15:rf[ra2];
endmodule
