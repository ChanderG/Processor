//all the required MUX's


module MUX4_2to1(in0, in1, sel, out);
   input [3:0]  in0, in1;
   input    sel;
   output [3:0] out;
   reg [3:0] out;

   always @(in0 or in1 or sel)
      if (sel == 0) out = in0;
      else          out = in1;
endmodule
