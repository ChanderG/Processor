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

        /*
         32'd00 : instr = 32'b01011000000000000000000000000001;  //mov r0, 1
         32'd04 : instr = 32'b01011000000010000000000000000010;  //mov r1, 2
         32'd08 : begin
                  instr = 32'b00010000100100001000000000000000;  //sub r2, r1,r0
                  end
         32'd12 : instr = 32'b00100001000100000000000000000001;  //bpl r2, 1
         32'd16 : instr = 32'b01011000000000000000000000000001;  //mov r0,1
         32'd16 : instr = 32'b01011000000000000000000000000011;  //mov r0, 3
        */

        /*
         32'd00 : instr = 32'b01011000000000000000000000000001;  //mov r0, 1
         32'd04 : instr = 32'b01011000000010000000000000000010;  //mov r1, 2
         32'd08 : instr =
        */

        //GCD code

        32'd00 : begin
                 instr = 32'b01011000000000000000000000001000;
                         //movi r0, 8
                 $display("First line of code at %d", $time);
                 end
        32'd04 : begin
                 instr = 32'b01011000000010000000000000010000;
                         //mov r1, 16
                 $display("Second line of code at %d", $time);
                 end
        32'd08 : begin
                 instr = 32'b00010000100010000001000000000000;
                         //sub r2, r1, r0
                 $display("Third line of code at %d", $time);
                 end
        32'd12 : begin
                 instr = 32'b00100000100100000000000000000011;
                         //bmi 3
                 $display("Fourth line of code at %d", $time);
                 end
        32'd16 : begin
                 instr = 32'b01000000000010011000000000000000;
                         //mov r3, r1
                 $display("Fifth line of code at %d", $time);
                 end
        32'd20 : begin
                 instr = 32'b01000000000000001000000000000000;
                         //mov r1, r0
                 $display("Sixth line of code at %d", $time);
                 end
        32'd24 : begin
                 instr = 32'b01000000000110000000000000000000;
                         //mov r0, r3
                 $display("Seventh line of code at %d", $time);
                 end
        32'd28 : begin
                 instr = 32'b00100000000010000000000000000100;
                         //bz y 4
                 $display("Eigth line of code at %d", $time);
                 end
        32'd32 : begin
                 instr = 32'b01000000000000011000000000000000;
                         //mov r3, r0
                 $display("Ninth line of code at %d", $time);
                 end
        32'd36 : begin
                 instr = 32'b01000000000010000000000000000000;
                         //mov r0, r1
                 $display("Tenth line of code at %d", $time);
                 end
       32'd40 : begin
                 instr = 32'b00010000100110001000100000000000;
                         //sub r1, r3, r1
                 $display("11th line of code at %d", $time);
                 end
       32'd44 : begin
                 instr = 32'b00011000100000000000000000001010;
                         //b -10
                 $display("12th line of code at %d", $time);
                 end
       32'd48 : begin
                 instr = 32'b01000000000000001000000000000000;
                         //mov r1, r0
                 $display("End of code. Ans is x %d", $time);
                 end
       /*32'd52 : begin
                 instr = 32'b01000 0000 0000 0001 000000000000000;
                         //mov r1, r0
                 $display("End of code. Ans is x %d", $time);
                 end
       */
       /* Simple test for bz
       32'd00 : begin
                 instr = 32'b01011000000010000000000000000000;
                         //movi r1, 0
                  $display("First line of code at %d", $time);
                  end
        32'd04 : begin
                 instr = 32'b00100000000010000000000000000100;
                         //bz y 4
                 $display("Second line of code at %d", $time);
                 end
        32'd08 : begin
                 instr = 32'b00010000100010000001000000000000;
                         //sub r2, r1, r0
                 $display("Third line of code at %d", $time);
                 end
        32'd12 : begin
                 instr = 32'b00100000100100000000000000000011;
                         //bmi 3
                 $display("Fourth line of code at %d", $time);
                 end
        32'd16 : begin
                 instr = 32'b01000000000010011000000000000000;
                         //mov r3, r1
                 $display("Fifth line of code at %d", $time);
                 end
        32'd20 : begin
                 instr = 32'b01000000000000001000000000000000;
                         //mov r1, r0
                 $display("Sixth line of code at %d", $time);
                 end
        32'd24 : begin
                 instr = 32'b01000000000110000000000000000000;
                         //mov r0, r3
                 $display("Seventh line of code at %d", $time);
                 end
        32'd28 : begin
                 instr = 32'b01000000000110000000000000000000;
                         //mov r0, r3
                 $display("Eigth line of code at %d", $time);
                 end
        */
       endcase
    end

endmodule
