`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2025 21:07:53
// Design Name: 
// Module Name: DataPath
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


module DataPath(
input clk,reset,
input [1:0] RegSrc,
input Regwrite,
input [1:0] ImmSrc,
input ALUSrc,
input [1:0]ALUControl,
input MemtoReg,
input PCSrc,
output reg [3:0]ALUflag,
output reg [31:0]PC,
input [31:0] Instr,
output reg [31:0] ALUResult,WriteData,
input [31:0] ReadData
    );
    
    wire [31:0] PCNext, PCPlus4,PCPlus8;
    wire [31:0] ExtImm,SrcA,SrcB,Result;
    wire [3:0] RA1,RA2;
    
    // PC logic
    mux2 #(32) pcmux(.d0(PCPlus4),.d1(Result),.s(PCSrc),.y(PCNext));
    flopr pcreg(clk,reset,PCNext,PC);
    adder pcadd1(PC,32'b100,PCPlus4);
    adder pcadd2(PCPlus4,32'b100,PCPlus8);
    
    // Reg File logic
    mux2 #(4) ra1mux(.d0(Instr[19:16]),.d1(4'b1111),.s(RegSrc[0]),.y(RA1));
    mux2 #(4) ra2mux(.d0(Instr[3:0]),.d1(Instr[15:12]),.s(RegSrc[1]),.y(RA2));
    regfile rf(clk, Regwrite, RA1, RA2, Instr[15:12], Result, PCPlus8, SrcA, WriteData);
    mux2 #(32) regmux(ALUResult,ReadData,MemtoReg,Result);
    Extender ext(Instr[23:0],ImmSrc,ExtImm);
    
    // ALU logic
    mux2 #(32) srcbmux(WriteData,ExtImm,ALUSrc,SrcB);
    ALU alu(SrcA,SrcB,ALUControl,ALUResult,ALUflag);
    
endmodule
