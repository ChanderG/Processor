


module branchComparator(reg1, funcCode, branchIdea, fC, opCode);

input [31:0] reg1;
input [4:0] opCode;
input [3:0] funcCode;
output reg branchIdea;
output reg fC;

always @(funcCode or reg1 or opCode) begin
case(funcCode)
  4'b0000: begin
           case (opCode)
             5'b00011: begin
                        branchIdea = 1;
                        fC = 0;
                       end
             5'b00100: begin
                         if(reg1 == 0) begin
                            branchIdea = 1;
                            fC = 0;
                         end
                         else branchIdea = 0;
                       end
           endcase
           end
  4'b0010:begin
           if(reg1 > 0) branchIdea = 1;
           else branchIdea = 0;
           end
  4'b0001: begin
           case (opCode)
             5'b00011: begin
                        branchIdea = 1;
                        fC = 1;
                       end
             5'b00100: begin
                       $display("Expected path");
                         //if(reg1[31] == 1) branchIdea = 1;
                         if(reg1 > 2147483647) begin
                           branchIdea = 1;
                           fC = 0;
                         end  
                         //((reg1 < 0)||
                         else branchIdea = 0;
                       end
           endcase
           end
endcase
end

endmodule
