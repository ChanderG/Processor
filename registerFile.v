//Register file
//Has the 16 general purpose 32 bit registers


module registerFile(Read1, Read2,Raddr1, Raddr2, Waddr,Writedata,RegWr, CLK, RESET);
    output [31:0] Read1;   //registers to be read
    output [31:0] Read2;
    input [31:0] Writedata;     //content to be written
    input [3:0] Raddr1, Raddr2;   // 5 bit - bits on Instruction
    input  [3:0] Waddr;
    input RegWr;   //flag to write
    input CLK, RESET;             //not yet verified
    reg [31:0] registers [0:15];  //untested

    //RESET all to zero based on RESET
    /*
    always @(RESET)
    begin
      //Set all registers to zero
        registers[0]<=0;
        registers[1]<=0;
        registers[2]<=0;
        registers[3]<=0;
        registers[4]<=0;
        registers[5]<=0;
        registers[6]<=0;
        registers[7]<=0;
        registers[8]<=0;
        registers[9]<=0;
        registers[10]<=0;
        registers[11]<=0;
        registers[12]<=0;
        registers[13]<=0;
        registers[14]<=0;
        registers[15]<=0;
    end
    */

    //get the registers to be read
    assign Read1 =registers[Raddr1];
    assign Read2 =registers[Raddr2];

    //write to registers
    always @(negedge CLK)
    begin
        if(RegWr == 1)
        begin
            registers[Waddr] = Writedata;
            $display("RW = %d at %d", RegWr, $time);
            $display("Waddress = %d", Waddr);
            $display("WD = %d", registers[Waddr]);

            $display("x = %d, y = %d", registers[0],registers[1]);
        end
    end

endmodule
