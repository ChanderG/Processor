//instruction Memory

module instrMemory(instr, address);
    parameter T_rd = 20;
    parameter MemSize = 40;

    output reg [31:0] instr;
    input [31:0] address;

    always @(address) begin
       case(address)
        //load the program here
        /*
        32'd00 : begin
                 instr = 32'b01011000000000000000000000000000;
                         //movi r0, 0
                  $display("First line of code at %d", $time);
                  end
        32'd04 : begin
                 instr = 32'b01011000000010000000000000000011;
                         //mov r1, 3
                 $display("Second line of code at %d", $time);
                 end
        32'd08 : begin
                 instr = 32'b01000000000000001000000000000000;
                         //mov r1, r0 -> move r0 to r1
                 $display("Third line of code at %d", $time);
                 end
        32'd12 : begin
                 instr = 32'b00111000100000000000000000000000;
                         //nop
                 $display("Fourth line of code at %d", $time);
                 end
        32'd16 : begin
                 instr = 32'b00001000000000000000000000000010;
                         //addi r0, 2
                 $display("Fifth line of code at %d", $time);
                 end
        */

         32'd00 : instr = 32'b01011000000000000000000000000001;  //mov r0, 1
         32'd04 : instr = 32'b01011000000010000000000000000010;  //mov r1, 2
         32'd08 : begin
                  instr = 32'b00010000100100001000000000000000;  //sub r2, r1,r0
                  end
         32'd12 : instr = 32'b00100001000100000000000000000001;  //bpl r2, 1
         32'd16 : instr = 32'b01011000000000000000000000000001;   //mov r0,1
         32'd16 : instr = 32'b01011000000000000000000000000011;  //mov r0, 3
         
       endcase
    end

endmodule
