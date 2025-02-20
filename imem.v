`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2025 22:07:19
// Design Name: 
// Module Name: imem
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


module imem(
input [31:0]a,
output [31:0]rd
    );
    reg [31:0] RAM[63:0];
    initial
		$readmemh("memfile.mem",RAM);
		assign rd = RAM[a[31:2]]; // word aligned
endmodule
