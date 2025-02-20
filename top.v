`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 22:13:05
// Design Name: 
// Module Name: top
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


module top(
input clk,reset
    );
    //internal wire
    wire [31:0]PC,Instr,ReadData;
    wire [31:0]WriteData,DataAdr;
    wire MemWrite;
    
    //instantiate cpu and memories
    cpu cpu(clk,reset,PC,Instr,MemWrite,DataAdr,WriteData,ReadData);
    imem imem(PC,Instr);
    dmem dmem(clk,MemWrite,DataAdr,WriteData,ReadData);
endmodule
