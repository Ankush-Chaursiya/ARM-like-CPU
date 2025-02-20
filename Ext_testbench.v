`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2025 20:28:30
// Design Name: 
// Module Name: Ext_testbench
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


module Ext_testbench();
reg [23:0] Instr;
reg [1:0] ImmSrc;
wire [31:0] ExtImm;

Extender uut(
.Instr(Instr),
.ImmSrc(ImmSrc),
.ExtImm(ExtImm)
);

initial begin
Instr = 32'h00000009;
#16 ImmSrc = 2'b00;
#10 ImmSrc = 2'b01;
#10 ImmSrc = 2'b10;
$display("Test Case 5: Instr = %h, ImmSrc = %b, ExtImm = %h", Instr, ImmSrc, ExtImm);
end

initial begin
#10
Instr = 24'hA5B3C7;
        ImmSrc = 2'b00;
        #10;
        $display("Test Case 1: Instr = %h, ImmSrc = %b, ExtImm = %h", Instr, ImmSrc, ExtImm);

        // Test case 2: ImmSrc = 2'b01 (zero-extension of Instr[11:0])
        Instr = 24'hA5B3C7;
        ImmSrc = 2'b01;
        #10;
        $display("Test Case 2: Instr = %h, ImmSrc = %b, ExtImm = %h", Instr, ImmSrc, ExtImm);
         // Test case 3: ImmSrc = 2'b10 with a negative number (check sign extension)
        Instr = 24'hA5B3C7; // MSB is 1 (negative)
        ImmSrc = 2'b10;
        #10;
        $display("Test Case 3: Instr = %h, ImmSrc = %b, ExtImm = %h", Instr, ImmSrc, ExtImm);
// Test case 4: ImmSrc = 2'b11 (default case, undefined output)
        Instr = 24'hA5B3C7;
        ImmSrc = 2'b11;
        #10;
        $display("Test Case 4: Instr = %h, ImmSrc = %b, ExtImm = %h", Instr, ImmSrc, ExtImm);
end
endmodule
