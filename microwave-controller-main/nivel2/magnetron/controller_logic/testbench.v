`timescale 1ns/1ps
`include "controller_logic.v"

module testbench_controller_logic();

  reg startn;
  reg stopn;
  reg clearn;
  reg door_closed;
  reg timer_done;
  wire set;
  wire reset;

  controller_logic dut (
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .timer_done(timer_done),
    .set(set),
    .reset(reset)
  );

  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, testbench_controller_logic);

    startn = 0;
    door_closed = 1;
    timer_done = 0;
    #10;

    door_closed = 0;
    #10;
    
    door_closed = 1;
    clearn = 0;
    #10;

    clearn = 1;
    stopn = 0;
    #10;

    stopn = 1;
    timer_done = 1;
    #10;

    $finish;
  end

endmodule