//Processor module

module Proc();
  //Some inputs and outputs


  //CPU modules

  reg [31:0] alu_inputA;    //1
  reg [31:0] alu_inputB;    //2
  wire [3:0] alu_control;   //3
  reg [31:0] alu_output;    //4
  wire alu_cout;            //NID , use case not yet seen

  //The ALU with the correct inputs and outputs
  alu aluUnit(alu_inputA, alu_inputB, alu_control, alu_output, alu_cout);

  wire [3:0] alu_op;        //5
  wire [5:0] func_code;     //6

  //the aluControl unit
  aluControl_unit aluControlUnit(alu_op, func_code, alu_control);

  wire [5:0] op_code;       //7

  //The control unit
  control_unit controlUnit(op_code, alu_code);

  //the register file
  //

endmodule
