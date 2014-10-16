//PC - has the register and increments based on clock


module programCounter(next, current, RESET, startPC ,CLK);
output [31:0] next;
input [31:0] current, startPC;
input RESET;
input CLK;

reg [31:0] next;

always @(negedge CLK)
begin
 if (RESET==0)
    next <= startPC;
 else
    next <= current+32'd4;
end
endmodule
