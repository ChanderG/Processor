//Processor module

//Right now ONLY supports AR type instructions

module Proc();
  //Some inputs and outputs
  reg regWrite;  //8  //input to Register_File from Controller
  wire CLK;       //???
  wire RESET;     //???
  wire[31:0] startPC;  ///???

  m555 clk(CLK);  //instantiate clock module

  wire [31:0] pc;
  programCounter pcManager(pc, pc, RESET, startPC, CLK);

  reg [31:0] instr;    //the actual instruction read from memory

  instrMemory im(instr, pc);

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
  */

  //CPU modules

  reg [31:0] alu_inputA;    //1
  reg [31:0] alu_inputB;    //2
  wire [3:0] alu_control;   //3  - between aluctrl and alu
  reg [31:0] alu_output;    //4
  wire alu_cout;            //NID , use case not yet seen
  wire [3:0] alu_op;        //5  - between aluctrl and ctrl

  wire C_ART_reg;   //selection line for mWriteRegB
  wire C_ART_data;   //selection line for mWriteDataB

  //The control unit
  control_unit controlUnit(instr[31:27], alu_op, regWrite, C_ART_reg, C_ART_data);

  //the aluControl unit
  aluControl_unit aluControlUnit(alu_op, instr[26:23], alu_control);

  //The ALU with the correct inputs and outputs
  alu aluUnit(alu_inputA, alu_inputB, alu_control, alu_output, alu_cout);

  //input wires for reg bank
  //wire [3:0] readReg1;
  //wire [3:0] readReg2;
  reg [3:0] writeReg;
  reg [31:0] writeData;

  //Mux for write register
  MUX4_2to1 mWriteRegB (instr[14:11], instr[22:19], C_ART_reg, writeReg);

  //Sign extending in case of T
  wire [31:0] extendedOut;
  signExtend19 sE(instr[18:0], extendedOut);

  //Mux for write data
  MUX32_2to1 mWriteDataB (alu_output, extendedOut, C_ART_data, writeData);

  //the register file
  //REQ UPDATE
  registerFile registerBank(alu_inputA, alu_inputB, instr[22:19], instr[18:15], writeReg, writeData, regWrite, CLK, RESET);

  //example testing
  initial begin

  end

endmodule
