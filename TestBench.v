`timescale 1ns/1ps
module PRPG_tb;
reg clk_tb;
reg Load_tb;
reg Din_tb;

initial
begin
    clk_tb = 0;
    Din_tb = 4;
    Load_tb = 1'b0;
end

always
begin
    #10 clk_tb = ~clk_tb;
end

initial
begin
    #30 Load_tb = 1'b0;
    #80 Load_tb = 1'b1;
    #5 Load_tb = 1'b0;
    #250 $finish;
end

initial
begin
    $dumpfile("PRPG.vcd");
    $dumpvars(0, PRPG_tb);
end

PRPG PRPG_tb
(
    .clk(clk_tb),
    .Load(Load_tb)
);
endmodule
