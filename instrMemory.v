//instruction Memory

module instrMemory(instr, address);
    parameter T_rd = 20;
    parameter MemSize = 40;

    output reg [31:0] instr;
    input [31:0] address;

    always @(address) begin
       case(address)
        //load the program here
        32'd00 : begin
                 instr = 32'b01011000000000000000000000000001;
                         //movi r0, 1
                  $display("First line of code at %d", $time);
                  end
        32'd04 : begin
                 instr = 32'b00001000100000000000000000000010;
                         //subi r0, 2
                 $display("Second line of code at %d", $time);
                 end
        32'd08 : begin
                 instr = 32'b00100000100000000000000000000001;
                         //bmi r0, 1 -> should jump to fifth line directly
                         //iff r0 < 0
                 $display("Third line of code at %d", $time);
                 end
        32'd12 : begin
                 instr = 32'b00010000000000001001000000000000;
                         //add r2, r0,r1
                 $display("Fourth line of code at %d", $time);
                 end
        32'd16 : begin
                 instr = 32'b00001000000000000000000000000010;
                         //addi r0, 2
                 $display("Fifth line of code at %d", $time);
                 end
       endcase
    end

endmodule
