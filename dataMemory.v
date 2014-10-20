//Data Memory

//???

module dataMemory(rd, wr, d_in,add_lines, d_out, CLK);

input rd;   //1 to read from memory
input wr;   //1 to write to memory
input [31:0] d_in;  //32 bit input to write to memory

//the size of the Mem must be adjusted with this
input [31:0] add_lines;   //32 bit address lines

output reg [31:0] d_out;  //32 bit output

//actual memory
reg [31:0] Mem [0:4095];

input CLK;

always@(posedge CLK)
begin
  //assuming the user takes care of not sending both high simultaneously
  if(rd) begin
    d_out <= Mem[add_lines];
  end
  if(wr) begin
    Mem[add_lines] <= d_in;
  end
end

endmodule
