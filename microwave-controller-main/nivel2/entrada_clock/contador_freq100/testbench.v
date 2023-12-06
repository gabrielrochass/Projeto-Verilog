`timescale 1ns/1ps
`include "count_50hz.v"

module count_50hz_testbench();
  reg clk_tb;
  wire clk100_tb;

  count_50hz dut (
    .clk(clk_tb),
    .clk100(clk100_tb)
  );
  
  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, count_50hz_testbench);
    
    clk_tb = 1'b0;

    repeat (1000) begin
      #1 clk_tb = ~clk_tb;
    end
  end
endmodule
