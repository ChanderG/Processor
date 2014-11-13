


module branchComparator(reg1, funcCode, branchIdea, fC);

input reg1;
//input [4:0] opCode;
input [3:0] funcCode;
output reg branchIdea;
output fC;

always @(funcCode or reg1) begin
case(funcCode)
  4'b0000: begin
           case (opCode)
             5'b00011: begin
                        branchIdea = 1;
                        fC = 0;
                       end
             5'b00100: begin
           if(reg1 == 0) branchIdea = 1;
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
                        if(reg1 < 0) branchIdea = 1;
                        else branchIdea = 0;
                       end
           endcase
           end
endcase
end

endmodule
