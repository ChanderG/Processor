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
module sub(
    input [31:0] a,
    input [31:0] b ,
    output [31:0] sum,
    output Cout
    );

    //This is the structuaral version.

     //This does not consider negative numbers.
     supply1 high;
     Q2_32b one (a, ~b, high, sum, Cout);

     //For negative numbers


endmodule
