//PC - has the register and increments based on clock


module programCounter(next, current, RESET, startPC ,CLK, pcSrc, const);
output [31:0] next;
input [31:0] startPC;
input [31:0] current;
input RESET;
input CLK;

input pcSrc;
input [31:0] const;

reg [31:0] next;

always @(negedge CLK)
begin
 if (RESET==0) begin
    next = startPC;
    #0 $display("Started program - %d.", $time);
 end
 else begin
    case (pcSrc)
      0: next = current+32'd4;
      1: next = current +32'd4 + 4*const;
    endcase
    $display("New instr %d at %d.",next, $time);
 end
end
endmodule
