`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:37:42 08/07/2014
// Design Name:
// Module Name:    Q2_st
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module andop(
    input [31:0] a,
    input [31:0] b ,
    output [31:0] out
    );

    //This is the behavioural version.
    assign out = a & b;
    //and ab (t1, a, b);


endmodule

