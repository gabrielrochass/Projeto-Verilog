`timescale 1ns/1ps
`include "latch_sr.v"

module testbench_latch_SR();

  reg set;
  reg reset;
  wire Q;

  latch_SR dut (
    .set(set),
    .reset(reset),
    .Q(Q)
  );

  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, testbench_latch_SR);

    set = 0;
    reset = 1;
    #5;

    set = 0;
    reset = 0;
    #5;

    set = 1;
    reset = 0;
    #5;

    set = 0;
    reset = 1;
    #5;
    
    set = 1;
    reset = 1;
    #5;

    $finish;
  end

endmodule