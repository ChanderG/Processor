//all the required MUX's

//needed for conflict in IR-RB dest reg between AR and T type
module MUX4_2to1(in0, in1, sel, out);
   input [3:0]  in0, in1;
   input    sel;
   output [3:0] out;
   reg [3:0] out;


   always @(in0 or in1 or sel)
   //begin
      if (sel == 1'b0) out = in0;
      else          out = in1;
   //end


   //assign out = (sel)?in1:in0;

endmodule


//needed for conflict in IR-RB constant val between AR and T type
module MUX32_2to1(in0, in1, sel, out);
   input [31:0]  in0, in1;
   input    sel;
   output [31:0] out;
   reg [31:0] out;


   always @(in0 or in1 or sel)
   //begin
      if (sel == 1'b0) out = in0;
      else          out = in1;
   //end


    //assign out = (sel)?in1:in0;

endmodule

