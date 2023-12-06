`timescale 1ns/1ps
`include "mux.v"

module testbench_mux();

  reg sel;
  reg counter;
  reg Hz;
  wire Q;

  mux dut (
    .sel(sel),
    .counter(counter),
    .Hz(Hz),
    .Q(Q)
  );

  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, testbench_mux);

    sel = 0;
    counter = 1;
    Hz = 0;
    #5;

    sel = 1;
    counter = 0;
    Hz = 1;
    #5;
    
    sel = 0;
    counter = 0;
    Hz = 1;
    #5;

    sel = 1;
    counter = 0;
    Hz = 0;
    #5;
    $finish;
  end

endmodule