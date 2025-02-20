`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 23:00:16
// Design Name: 
// Module Name: ALU_testbench
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


module ALU_testbench();
reg [31:0] SrcA,SrcB;
reg [1:0]ALUcontrol;
wire [31:0]ALUResult;
wire Zero,Negative,Overflow,Carry;

ALU uut(
.SrcA(SrcA),
.SrcB(SrcB),
.ALUcontrol(ALUcontrol),
.ALUResult(ALUResult),
.Zero(Zero),
.Overflow(Overflow),
.Negative(Negative),
.Carry(Carry)
);

initial begin
SrcA = 32'h00000005;
SrcB = 32'h00000004;
#16 ALUcontrol = 2'b00;
#10 ALUcontrol = 2'b01;
#10 ALUcontrol = 2'b10;
#10 ALUcontrol = 2'b11;
end

initial begin
#25
ALUcontrol = 2'b11;
        SrcA = 32'h80000000; // Minimum negative 32-bit integer
        SrcB = 32'h00000001;
        #100;
        $display("SUB Operation: SrcA = %h, SrcB = %h, ALUResult = %h, Zero = %b, Overflow = %b, Negative = %b, Carry = %b",
                  SrcA, SrcB, ALUResult, Zero, Overflow, Negative, Carry);

        // Test ADD operation with overflow
        ALUcontrol = 2'b10;
        SrcA = 32'h7FFFFFFF; // Maximum positive 32-bit integer
        SrcB = 32'h7FFFFFFF; // Maximum positive 32-bit integer
        #100;
        $display("ADD Operation (Overflow): SrcA = %h, SrcB = %h, ALUResult = %h, Zero = %b, Overflow = %b, Negative = %b, Carry = %b",
                  SrcA, SrcB, ALUResult, Zero, Overflow, Negative, Carry);

        // Test SUB operation with overflow
        ALUcontrol = 2'b11;
        SrcA = 32'h80000000; // Minimum negative 32-bit integer
        SrcB = 32'h7FFFFFFF; // Maximum positive 32-bit integer
        #100;
        $display("SUB Operation (Overflow): SrcA = %h, SrcB = %h, ALUResult = %h, Zero = %b, Overflow = %b, Negative = %b, Carry = %b",
                  SrcA, SrcB, ALUResult, Zero, Overflow, Negative, Carry);
end
endmodule
