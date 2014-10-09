//Processor module

//Right now ONLY supports AR type instructions

module Proc();
  //Some inputs and outputs
  reg regWrite;  //8  //input to Register_File from Controller
  wire CLK;       //???
  wire RESET;     //???

  m555 clk(CLK);  //instantiate clock module

  wire [31:0] instr;    //the actual instruction read from memory
  /* implying ->
     considering for a AR instruction

     instr[31:27] -> opcode
     instr[26:23] -> func code
     instr[22:19] -> source reg 1
     instr[18:15] -> source reg 2
     instr[14:11] -> dest reg
     instr[10:0]  -> don't care

  */

  //CPU modules

  reg [31:0] alu_inputA;    //1
  reg [31:0] alu_inputB;    //2
  wire [3:0] alu_control;   //3  - between aluctrl and alu
  reg [31:0] alu_output;    //4
  wire alu_cout;            //NID , use case not yet seen
  wire [3:0] alu_op;        //5  - between aluctrl and ctrl

  //The control unit
  control_unit controlUnit(instr[31:27], alu_op, regWrite);

  //the aluControl unit
  aluControl_unit aluControlUnit(alu_op, instr[26:23], alu_control);

  //The ALU with the correct inputs and outputs
  alu aluUnit(alu_inputA, alu_inputB, alu_control, alu_output, alu_cout);

  //the register file
  //REQ UPDATE
  registerFile registerBank(alu_inputA, alu_inputB, instr[22:19], instr[18:15], alu_output, instr[14:11], regWrite, CLK, RESET);

endmodule
