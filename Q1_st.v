`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:16 08/07/2014 
// Design Name: 
// Module Name:    Q1_st 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Q1_st(
    input a,
    input b,
    input Cin,
    output sum,
    output Cout
    );
     
     //sum
     xor g1 (sum , a,b,Cin);
    
     //Cout
     wire t1, t2, t3;
     and ab (t1, a, b);
     xor xab (t2, a, b);
     and ab2 (t3, t2, Cin);
     or final (Cout, t1, t3);

endmodule
