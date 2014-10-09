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
module sraop(
    input [31:0] a,
    input [31:0] b ,
    output [31:0] out
    );

    reg [31:0] out;

    //This is the behavioural version.
    always @(a or b)
    begin
    if (b[0] == 1)
      out = ($signed(a)>>>1);
      else
          out = a;
    end

endmodule
