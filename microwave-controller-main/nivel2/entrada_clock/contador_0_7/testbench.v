`timescale 1ns/1ps
`include "counter07.v"

module counter07_testbench();

  reg clock;
  reg clear;
  wire Q;

  counter07 dut (
    .clock(clock),
    .clear(clear),
    .Q(Q)
  );

  always #5 clock = ~clock;


  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, counter07_testbench);

    clear = 0; 
    clock = 0;
    
    
    #5;
    
    clear = 1;
    #10 clear = 0;

    #20;
    
    clear = 0;

    repeat (4) begin
      #20;
    end
    
    clear = 1;
    #5 clear = 0;
       
    #40
    
    $finish;
  end

endmodule