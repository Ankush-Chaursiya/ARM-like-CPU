`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.02.2025 22:57:23
// Design Name: 
// Module Name: flop
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


module flopr(
input clk,reset,
input [31:0]d,
output reg [31:0]q
    );
    always @(posedge clk , posedge reset)
    if(reset) q<=0;
    else q<=d;
endmodule
