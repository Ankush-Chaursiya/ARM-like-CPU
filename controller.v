`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 20:47:51
// Design Name: 
// Module Name: controller
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


module controller(
input clk,reset,
input [31:12] Instr,
input [3:0] ALUFlag,
output [1:0] RegSrc,
output RegWrite,
output [1:0]ImmSrc,
output  ALUSrc,
output [1:0]ALUControl,
output MemWrite,MemtoReg,
output PCSrc
    );
 //Internal Wire   
    wire [1:0] FlagW;
    wire PCS,RegW,MemW;
    
    //integrate decoder
    Decoder dec(Instr[27:26], Instr[25:20], Instr[15:12],
    FlagW,PCS,RegW,MemW,
    MemtoReg,ALUSrc,ImmSrc,RegSrc,ALUControl);
    
    //Intergrate conditional logic block
    conditionalLogic cl(clk,reset,Instr[31:28],ALUFlag,FlagW,PCS,RegW,MemW,
    PCSrc,RegWrite,MemWrite);
endmodule
