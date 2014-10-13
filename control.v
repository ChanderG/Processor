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



module control_unit(opcode, ALUop, regWrite, muxWriteReg, muxWriteData);

  input [4:0] opcode;
  output reg regWrite;   //to write to register file
  output [3:0] ALUop;
  reg [3:0] ALUop;

  input muxWriteReg;
  input muxWriteData;

  always @(opcode) begin
    case(opcode)
      6'b00010: begin    //means AR opcode
          ALUop <= 4'b1111;
          regWrite <= 1;
          muxWriteReg <= 0;
          muxWriteData <= 0;
      end
       6'b01011: begin    //means T opcode
          ALUop <= 4'b1111;   //Not yet implemented - is dont care - check up!!!!!
          regWrite <= 1;
          muxWriteReg <= 1;
          muxWriteData <= 1;
      end
    endcase
  end

endmodule
