`timescale 1ns / 1ps

module IF (input clk, reset, PCSrc, PC_write, 
           input [31:0] PC_Branch, 
           output [31:0] PC_IF, INSTRUCTION_IF);

    wire [31:0] out_mux, out_add, out_pc, shifted;
    reg [31:0] prev = 0;
    
    mux2_1 mx(PC_Branch, prev, PCSrc, out_mux);
//    mux2_1 mx(PC_Branch, out_add, PCSrc, out_mux);
    PC pc(clk, reset, PC_write, out_mux, out_pc);
    assign PC_IF = out_pc;
    adder ad(out_pc, 4, out_add);
    
    always @(out_add)
        prev = out_add;
    
    assign shifted = out_pc  >> 2;
    
    instruction_memory im(shifted[9:0], INSTRUCTION_IF);
    
    
endmodule
