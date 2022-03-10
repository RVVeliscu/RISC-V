`timescale 1ns / 1ps

module registers(input clk, reg_write,
                 input [4:0] read_reg1, read_reg2, write_reg,
                 input [31:0] write_data,
                 output [31:0] read_data1,read_data2);

    reg [31:0]x[31:0];
    reg [31:0] aux1, aux2;
    
    //Initializez cu 0
    integer i;
    initial
        for (i = 0; i < 32; i = i + 1)
            x[i] = i;
            
    //asincron
    //read_reg1
    always @(read_reg1)
        aux1 = x[read_reg1];
    assign read_data1 = aux1;
    
    //read_reg2
    always @(read_reg2)
        aux2 = x[read_reg2];
    assign read_data2 = aux2;

    //sincron
    //Scriu
    always@(posedge clk)
        if(reg_write == 1)
            x[write_reg] = write_data;
    
endmodule
