//instruction Memory

module instrMemory(instr, address);
    parameter T_rd = 20;
    parameter MemSize = 40;

    output reg [31:0] instr;
    input [31:0] address;

    always @(address) begin
       case(address)
        //load the program here
        32'h00 : begin
                 instr = 32'b01011000000000000000000000001111;
                         //movi r0, 15
                  $display("First line of code at %d", $time);
                  end
        32'h04 : begin
                 instr = 32'b01011000000010000000000000010000;
                         //movi r1, 16
                 $display("Second line of code at %d", $time);
                 end
        32'h08 : begin
                 instr = 32'b00010000000000001001000000000000;
                         //add r2, r0,r1
                 $display("Third line of code at %d", $time);
                 end
       endcase
    end

endmodule
