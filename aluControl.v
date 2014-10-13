//ALU CONTROL UNIT


module aluControl_unit (ALUop, FuncCode, ALUCtrl);
    input [3:0] ALUop;         //controlling the aluControl actions
    input [3:0] FuncCode;      // from instruction
    output[3:0] ALUCtrl;       //the original 4 bit instruction/order that OUR alu expects
    reg [3:0] ALUCtrl;         // so this module works closely with OUR alu
always @ (ALUCtrl or ALUop or FuncCode)
begin

if(ALUop!=4'b1111)
    begin
    
        /*
        case(FuncCode)

        6'b100000 :ALUCtrl = `ADD;
        6'b100010 :ALUCtrl = `SUB;
        //6'b100001 :ALUCtrl =  `ADDU;
        //6'b100011 :ALUCtrl =  `SUBU;
        //6'b000000 :ALUCtrl = `NOP;
        endcase
        */
    end
else ALUCtrl = FuncCode;

end
endmodule

