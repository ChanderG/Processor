


module branchComparator(reg1, funcCode, branchIdea)

input reg1, funcCode;
output reg branchIdea;

case(funcCode)
  4'b0000: begin
           if(reg1 == 0) branchIdea = 1;
           else branchIdea = 0;
  end
  4'b0001: begin
           if(reg1 < 0) branchIdea = 1;
           else branchIdea = 0;
  end
  4'b0010: begin
           if(reg1 > 0) branchIdea = 1;
           else branchIdea = 0;
  end
endcase


endmodule
