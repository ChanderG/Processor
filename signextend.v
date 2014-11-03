//sign extend

//for use with AR-T conflict, for write data
module signExtend19(in, out);
   parameter INSIZE = 19, OUTSIZE = 32;

   input [INSIZE-1:0] in;
   output [OUTSIZE-1:0] out;
   assign    out = {{ OUTSIZE-INSIZE {in[INSIZE-1]}}, in};
endmodule

//for use with J instruction
module signExtend23(in, out);
   parameter INSIZE = 23, OUTSIZE = 32;

   input [INSIZE-1:0] in;
   output [OUTSIZE-1:0] out;
   assign    out = {{ OUTSIZE-INSIZE {in[INSIZE-1]}}, in};
endmodule

//for use with L instruction
module signExtend15(in, out);
   parameter INSIZE = 15, OUTSIZE = 32;

   input [INSIZE-1:0] in;
   output [OUTSIZE-1:0] out;
   assign    out = {{ OUTSIZE-INSIZE {in[INSIZE-1]}}, in};
endmodule
