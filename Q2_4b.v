`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:06 08/07/2014 
// Design Name: 
// Module Name:    Q2_4b 
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
//input a[3:0], b[3:0],
//	 output sum[3:0], Cout,

module Q2_4b(
    input [3:0] a,
    input [3:0] b,
	 input Cin,
	 output [3:0] sum,
	 output Cout
    );
  //wire sum[3:0], Cout;
  wire temp[2:0];
  //supply0 gnd;
  
  Q1_st one ( a[0], b[0], Cin, sum[0], temp[0]);
  Q1_st two ( a[1], b[1], temp[0], sum[1], temp[1]);
  Q1_st three ( a[2], b[2], temp[1], sum[2], temp[2]);
  Q1_st four ( a[3], b[3], temp[2], sum[3], Cout);

endmodule
