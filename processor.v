//Processor module

//Right now ONLY supports AR type instructions

module Proc(RESET, startPC);
  //Some inputs and outputs
  reg regWrite;  //8  //input to Register_File from Controller
  wire CLK;       //???
  input wire RESET;     //???
  input wire[31:0] startPC;  ///???

  //testing reset
  //assign RESET = 1;
  //assign startPC = 0;

  //CPU modules

  reg [31:0] alu_inputA;    //1
  reg [31:0] alu_inputB;    //2
  wire [3:0] alu_control;   //3  - between aluctrl and alu
  reg [31:0] alu_output;    //4
  wire alu_cout;            //NID , use case not yet seen
  wire [3:0] alu_op;        //5  - between aluctrl and ctrl

  wire C_ART_reg;   //selection line for mWriteRegB
  wire C_ART_data;   //selection line for mWriteDataB
  wire C_mWwriteDataA;
  wire C_L_mux;       //selection line for mWriteReg2
  m555 clk(CLK);  //instantiate clock module

  //related to data memory
  wire C_read_dm;
  wire C_write_dm;
  //reg [31:0] data_write_dm = 0;  //data to be written
  reg [31:0] loc_op_dm; // location to be operated on
  reg [31:0] data_read_dm;  //data read out

  reg [31:0] pc;
  /*
  initial begin
    pc = 32'h00;
  end
  */

  reg pcSrc;
  reg [31:0] offset1;  //for jump
  reg [31:0] offset2;  //for jump
  reg [31:0] offset_res;  //for jump

  signExtend23 sE23(instr[22:0], offset1);
  signExtend19 sE192(instr[18:0], offset2);

  MUX32_2to1 mBrOffset (offset1, offset2, C_offset, offset_res);

  programCounter pcManager(pc, pc, RESET, startPC, CLK, pcSrc, offset_res);

  reg [31:0] instr;    //the actual instruction read from memory

  instrMemory im(instr, pc);

  reg branchIdea;
  branchComparator bc(alu_inputA, instr[26:23], branchIdea);

  /* implying ->
     considering for a AR instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] -> source reg 1
     instr[18:15] -> source reg 2
     instr[14:11] -> dest reg
     instr[10:0]  -> don't care

     for T instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] -> dest register
     instr[18:0] -> the most important constant Input

     for I instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] -> dest register  as well as source register
     instr[18:0] -> the immediate constant

     for J instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:0] -> number of words to jump

     for M instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] -> the register to compare
     instr[18:0] -> number of words to branch

     for L1 instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] ->the source register
     instr[18:15] ->the destination register
     instr[14:0] -> the constant offset from source

     for L2 instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] ->the destination register
     instr[18:15] ->the source register
     instr[14:0] -> the constant offset from source

     for Q type
     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] ->the source register
     instr[18:15] ->the destination register
     instr[14:0] -> dont care
  */

  //The control unit
  control_unit controlUnit(CLK, instr[31:27], alu_op, regWrite, C_ART_reg, C_ART_data, C_reg2_aluB_mux, pcSrc, branchIdea, C_offset, C_L_mux, C_sub_mAluInputB_L, C_mDataMemVsAluOutput, C_read_dm, C_write_dm, C_mWwriteDataA);

  //the aluControl unit
  aluControl_unit aluControlUnit(alu_op, instr[26:23], alu_control);

  //The ALU with the correct inputs and outputs
  alu aluUnit(alu_inputA, alu_inputB, alu_control, alu_output, alu_cout);

  //input wires for reg bank
  //wire [3:0] readReg1;
  //wire [3:0] readReg2;
  reg [3:0] writeReg;
  reg [31:0] writeData;
  reg [3:0] writeRegTemp;

  //Mux for write register
  MUX4_2to1 mWriteRegB (instr[14:11], instr[22:19], C_ART_reg, writeRegTemp);

  //Sign extending in case of T and I
  wire [31:0] extendedOut;
  wire [31:0] subFinalRegWriteData;
  wire [31:0] extendedOut_snd_option;
  wire [31:0] out_mWriteDataB;
  signExtend19 sE19(instr[18:0], extendedOut);

  //Mux for write data
  MUX32_2to1 mWriteDataB (subFinalRegWriteData, extendedOut, C_ART_data, out_mWriteDataB);

  MUX32_2to1 mWriteDataA ( out_mWriteDataB, alu_inputA, C_mWwriteDataA, writeData);


  //wire from read reg 2 to Mux
  reg [31:0] readReg2ToMux;

  //MUX for alu input B
  MUX32_2to1 mAluInputB (readReg2ToMux, extendedOut_snd_option, C_reg2_aluB_mux, alu_inputB);

  //mux between the second input and the o/p of mux(1,3) for the write reg
  MUX4_2to1 mWriteReg2 (writeRegTemp, instr[18:15], C_L_mux, writeReg);

  //extending the constant in L type
  wire [31:0] extendedOut_L;
  signExtend15 sE15(instr[14:0], extendedOut_L);

  MUX32_2to1 sub_mAluInputB_L(extendedOut, extendedOut_L, C_sub_mAluInputB_L, extendedOut_snd_option);


  //the register file
  //REQ UPDATE
  registerFile registerBank(alu_inputA, readReg2ToMux, instr[22:19], instr[18:15], writeReg, writeData, regWrite, CLK, RESET);

  //loc_op_dm <= alu_output;

  MUX32_2to1 mDataMemVsAluOutput(alu_output, data_read_dm, C_mDataMemVsAluOutput, subFinalRegWriteData);

  dataMemory DM(C_read_dm, C_write_dm, readReg2ToMux, alu_output, data_read_dm, CLK);

endmodule
