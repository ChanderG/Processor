/* Chander G - Gp 22   28/08/14 */

/* ALU - implementation

Required operations:

ADD:   4'b0000
SUB:
AND:
OR:
XOR:
NOT:
SLA:
SRA:
SRL:

*/

`define ADD 3'b0000
`define SUB 3'b0001
`define ANDOP 3'b0001

module alu(
  input [31:0] A,
  input [31:0] B,
  input cin,
  input [3:0] ctrl,    //control instruction
  output [31:0] res,
  output cout
);

reg [31:0] res;
reg cout;
wire [1:0] coutlist;

reg [31:0] add_res;
reg [31:0] sub_res;
reg [31:0] andop_res;

add b0(A, B, add_res, coutlist[0]);
sub b1(A, B, sub_res, coutlist[1]);
andop b2(A,B,andop_res);


//assign res = add_res;

always @(A or B or ctrl)
 begin
   case(ctrl)
     `ADD: begin
             res = add_res;
             cout = coutlist[0];
           end
     `SUB: begin
            res = sub_res;
            cout = coutlist[1];
            end
     `ANDOP: begin
            res = andop_res;
           end
   endcase
 end
 
endmodule
