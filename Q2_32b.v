`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:08 08/07/2014 
// Design Name: 
// Module Name:    Q2_32b 
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
module Q2_32b(
    input [31:0] a,
    input [31:0] b,
	 input Cin,
	 output [31:0] sum,
	 output Cout
    );
 
  wire temp;
  
  Q2_16b one ( a[15:0], b[15:0], Cin, sum[15:0], temp);
  Q2_16b two ( a[31:16], b[31:16], temp, sum[31:16], Cout);

endmodule
