`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 12:18:07
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [1:0]Op,
    input [5:0]Funct,
    input [3:0]Rd,
    output reg [1:0]FlagW,
    output reg PCS,RegW,MemW,
    output reg MemtoReg, ALUSrc,
    output reg [1:0] ImmSrc,RegSrc,ALUControl
    );
    
    //Internal wire
    wire Branch,ALUOp;
    reg [9:0] controls;
    
    //Main decoder
    always @(*)begin
        casex(Op)
            2'b00: begin 
                if(Funct[5]) 
                    controls = 10'b0011001001; // DATA processing immediate
                else 
                    controls = 10'b0000001001; // Data processing register
            end
            2'b01: begin
            if(Funct[5]) 
                controls = 10'b0001111000; //LDR
            else 
                controls = 10'b1001110100; //STR
            end
    2'b10: controls = 10'b0110100010; //B
    default: controls = 10'bx; //Unimplemented
    endcase
    
   controls = {Branch,MemtoReg,MemW,ALUSrc,ImmSrc,RegW,RegSrc, ALUOp} ;
    end
    
    //ALU Decoder
    always @(*)begin
    if(ALUOp) begin // which DP Instr
    case(Funct[4:1])
    4'b0100: ALUControl = 2'b00; //ADD
    4'b0010: ALUControl = 2'b01; //SUB
    4'b0000:ALUControl = 2'b10; //AND
    4'b1100:ALUControl = 2'bx; //unimplemented
    endcase
    // update flags if S bit is set(C & B only for arithmetic)
    FlagW[1] = Funct[0];
    FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
    end
    else begin
    ALUControl = 2'b00; // add for non-DP instructions
    FlagW = 2'b00; // don't update flag
    end
    end
    always @(*) begin
     PCS = ((Rd==4'b1111) & RegW)|Branch;
    end
endmodule