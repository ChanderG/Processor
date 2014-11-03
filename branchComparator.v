


module branchComparator(reg1, funcCode, branchIdea);

input reg1;
input [3:0] funcCode;
output reg branchIdea;

always @(funcCode or reg1) begin
case(funcCode)
  4'b0000: begin
           if(reg1 == 0) branchIdea = 1;
           else branchIdea = 0;
           end
  4'b0010:begin
           if(reg1 > 0) branchIdea = 1;
           else branchIdea = 0;
           end
  4'b0001: begin
           if(reg1 < 0) branchIdea = 1;
           else branchIdea = 0;
           end
endcase
end

endmodule
