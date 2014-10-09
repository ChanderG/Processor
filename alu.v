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

`define ADD 4'b0000
`define SUB 4'b0001
`define ANDOP 4'b0010
`define OROP 4'b0011
`define NOTOP 4'b0100
`define XOROP 4'b0101
`define SLAOP 4'b0110
`define SRAOP 4'b0111
`define SRLOP 4'b1000

module alu(
  input [31:0] A,
  input [31:0] B,
  //input cin,    cin not required ALU module added to PROC
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
reg [31:0] orop_res;
reg [31:0] notop_res;
reg [31:0] xorop_res;
reg [31:0] slaop_res;
reg [31:0] sraop_res;
reg [31:0] srlop_res;


add b0(A, B, add_res, coutlist[0]);
sub b1(A, B, sub_res, coutlist[1]);
andop b2(A,B,andop_res);
orop b3(A,B,orop_res);
notop b4(A,B,notop_res);
xorop b5(A,B,xorop_res);
slaop b6(A,B,slaop_res);
sraop b7(A,B,sraop_res);
srlop b8(A,B,srlop_res);

always @(A or B or ctrl or add_res or sub_res or andop_res or orop_res or notop_res or xorop_res or slaop_res or sraop_res or srlop_res or coutlist)
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
     `OROP: begin
            res = orop_res;
           end
     `NOTOP: begin
            res = notop_res;
           end
     `XOROP: begin
            res = xorop_res;
           end
     `SLAOP: begin
            res = slaop_res;
           end
     `SRAOP: begin
            res = sraop_res;
           end
     `SRLOP: begin
            res = srlop_res;
           end
   endcase
 end

endmodule
