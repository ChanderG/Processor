`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:04 08/07/2014 
// Design Name: 
// Module Name:    Q2_16b 
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
module Q2_16b(
    input [15:0] a,
    input [15:0] b,
	 input Cin,
	 output [15:0] sum,
	 output Cout
    );
 
  wire temp[2:0];
  //supply0 gnd;
  
  Q2_4b one ( a[3:0], b[3:0], Cin, sum[3:0], temp[0]);
  Q2_4b two ( a[7:4], b[7:4], temp[0], sum[7:4], temp[1]);
  Q2_4b three ( a[11:8], b[11:8], temp[1], sum[11:8], temp[2]);
  Q2_4b four ( a[15:12], b[15:12], temp[2], sum[15:12], Cout);

endmodule
