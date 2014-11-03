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



module control_unit(CLK, opcode, ALUop, regWrite, muxWriteReg, muxWriteData, C_reg2_aluB_mux, pcSrc, branchIdea, C_offset, C_L_mux, C_sub_mAluInputB_L, C_mDataMemVsAluOutput,  C_read_dm, C_write_dm);

  input CLK;
  input [4:0] opcode;
  output reg regWrite;   //to write to register file
  output [3:0] ALUop;
  reg [3:0] ALUop;

  output reg muxWriteReg;
  output reg muxWriteData;
  output reg C_reg2_aluB_mux;
  output reg pcSrc;
  input branchIdea;
  output reg C_offset;
  output reg C_L_mux;
  output reg C_sub_mAluInputB_L;
  output reg C_mDataMemVsAluOutput;

  output reg C_read_dm;
  output reg C_write_dm;

  //always @(posedge CLK) begin
  always @(opcode or branchIdea) begin
    case(opcode)
      6'b00010: begin    //means AR opcode
          $display("AR instr found at %d", $time);
          ALUop <= 4'b1111;
          regWrite <= 1;
          muxWriteReg <= 0;
          muxWriteData <= 0;
          C_mDataMemVsAluOutput <= 0;
          C_reg2_aluB_mux <= 0;
          pcSrc <= 0;
          C_L_mux <= 0;
      end
      6'b01011: begin    //means T opcode
          $display("T instr found at %d", $time);
          ALUop <= 4'b1111;   //Not yet implemented - is dont care - check up!!!!!
          regWrite <= 1;
          muxWriteReg <= 1;
          muxWriteData <= 1;
          C_reg2_aluB_mux <= 0;
          pcSrc <= 0;
          C_L_mux <= 0;
      end
      6'b00001: begin    //means I opcode
          $display("I instr found at %d", $time);
          ALUop <= 4'b1111;   //Not yet implemented - is dont care - check up!!!!!
          regWrite <= 1;
          muxWriteReg <= 1;         //the reg to write to
          muxWriteData <= 0;        //the output of the alu
          C_mDataMemVsAluOutput <= 0;
          C_reg2_aluB_mux <= 1;     //the constant
          C_sub_mAluInputB_L <= 0;
          pcSrc <= 0;
          C_L_mux <= 0;

      end
      6'b00011: begin    //means J opcode
          $display("J instr found at %d", $time);
          //ALUop <= 4'b1111;   //Not yet implemented - is dont care - check up!!!!!
          //regWrite <= 1;
          //muxWriteReg <= 1;         //the reg to write to
          //muxWriteData <= 0;        //the output of the alu
          //C_reg2_aluB_mux <= 1;     //the constant
          pcSrc <= 1;
          C_offset <= 0;
          C_L_mux <= 0;
      end
      6'b00100: begin    //means M opcode
          $display("M instr found at %d", $time);
          //ALUop <= 4'b1111;   //Not yet implemented - is dont care - check up!!!!!
          //regWrite <= 1;
          //muxWriteReg <= 1;         //the reg to write to
          //muxWriteData <= 0;        //the output of the alu
          //C_reg2_aluB_mux <= 1;     //the constant
          C_offset <= 1;
          pcSrc <= branchIdea;
          C_L_mux <= 0;
      end
      6'b00000: begin    //means L opcode
          //for now only load instruction
          $display("L instr found at %d", $time);
          ALUop <= 4'b0000;   //represents L type instructions
          regWrite <= 1;
          muxWriteData <= 0;        //the output of the alu
          C_mDataMemVsAluOutput <= 1;
          C_reg2_aluB_mux <= 1;     //the constant
          C_sub_mAluInputB_L <= 1;
          pcSrc <= 0;
          C_L_mux <= 1;

          C_read_dm <= 1;
          C_write_dm <= 0;
      end
    endcase
  end

endmodule
