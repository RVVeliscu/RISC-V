`timescale 1ns / 1ps

module adder(input [31:0] ina,inb, 
             output reg[31:0] out);
    
    always @(ina, inb)
        out = ina + inb;
    
endmodule