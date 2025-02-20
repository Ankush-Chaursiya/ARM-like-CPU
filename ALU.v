`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 22:08:46
// Design Name: 
// Module Name: ALU
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


module ALU(
input [31:0] SrcA,
input [31:0] SrcB,
input [1:0] ALUcontrol,
output reg [31:0] ALUResult,
output reg Zero,
output reg Overflow,
output reg Negative,
output reg Carry
);
always @(*) begin
case(ALUcontrol)
2'b00: begin //AND operation
ALUResult = SrcA & SrcB;
Carry =0;
Overflow = 0;
end

2'b01: begin //OR operation
ALUResult = SrcA | SrcB;
Carry =0;
Overflow = 0;
end

2'b10: begin //ADD operation
{Carry,ALUResult} = SrcA + SrcB;
Overflow = Carry;
end

2'b11: begin //SUB operation
{Carry,ALUResult} = SrcA - SrcB;
Overflow = Carry;
end

default: begin
ALUResult=32'b0;
Carry=0;
Overflow=0;
end

endcase
Zero = (ALUResult == 32'b0)?1'b1:1'b0;
Negative = ALUResult[31];
end

    
endmodule
