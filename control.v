//Control unit specification

//OpCodes

//R type instructions
`define OPCODE_ADD 6'b00000
`define OPCODE_SUB 6'b00000
`define OPCODE_AND 6'b00000
`define OPCODE_OR  6'b00000
`define OPCODE_NOT 6'b00000
`define OPCODE_XOR 6'b00000
`define OPCODE_SLA 6'b00000
`define OPCODE_SRA 6'b00000
`define OPCODE_SRL 6'b00000

//Function codes of ISA  - R type only
`define ADD 4'b0000
`define SUB 4'b0001
`define ANDOP 4'b0010
`define OROP 4'b0011
`define NOTOP 4'b0100
`define XOROP 4'b0101
`define SLAOP 4'b0110
`define SRAOP 4'b0111
`define SRLOP 4'b1000



module control_unit(opcode, ALUop);

  input [5:0] opcode;
  output [3:0] ALUop;
  reg [3:0] ALUop;

  always @(opcode) begin
    case(opcode)
      6'b00010: begin    //means AR opcode
          ALUop <= 4'b1111;
      end
    endcase
  end

endmodule
