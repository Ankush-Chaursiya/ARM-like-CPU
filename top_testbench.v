`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.02.2025 23:07:51
// Design Name: 
// Module Name: top_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: )
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_testbench();
reg clk;
reg reset;

top uut(clk,reset);

initial begin
reset <=1;
#10 reset<=0;
clk <= 1;
end

always #5 clk=~clk;
/*
initial begin
#10000
if(uut.dmem.RAM[21] == 32'd7) begin
$display("Test Passed: Memory[84] contains 7");
end 
else begin
$display("Test failed: Memory[84] contains %d",uut.dmem.RAM[21]);
end
$finish;
end */

initial begin
#10000
if(uut.cpu.dp.rf.rf[5] == 32'd11) begin
$display("Test Passed: R5 contains 11");
end 
else begin
$display("Test failed: R5 contains %d",uut.cpu.dp.rf.rf[5]);
end
$finish;
end
endmodule
