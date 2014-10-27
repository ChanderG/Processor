//PC - has the register and increments based on clock


module programCounter(next, current, RESET, startPC ,CLK);
output [31:0] next;
input [31:0] startPC;
input [31:0] current;
input RESET;
input CLK;

reg [31:0] next;

always @(negedge CLK)
begin
 if (RESET==0) begin
    next = startPC;
    #0 $display("Started program - %d.", $time);
 end
 else begin
    next = current+32'd4;
    $display("Step execution completed - %d.",$time);
 end
end
endmodule
