//instruction Memory

module instructionMemory(instr, address);
    parameter T_rd = 20;
    parameter MemSize = 40;

    output reg [31:0] instr;
    input [31:0] address;

    always @(address) begin
       case(address):
        //load the program here

       endcase
    end

endmodule
