//Meta level

//One level above the Processor

//Will create processor and feed clock from here

module topLevelRunner(RESET, startPC);

  output reg RESET;
  output reg [31:0] startPC;


  //assign RESET = 0;
  //assign startPC = 0;

  initial begin
     //starting the computer
     RESET <= 0; startPC <= 0;

     #101
     RESET <= 1;
     #10000
     RESET <= 0;
     //$finish;

  end

endmodule

 module topLevel();

  wire RESET;
  wire [31:0] startPC;

  topLevelRunner tlr(RESET, startPC);
  Proc myPC(RESET, startPC);

 endmodule
