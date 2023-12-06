`timescale 1ns/1ps
`include "entrada_clock_nivel2.v"

module entrada_clock_nivel2_teste();

    reg [9:0] keyboard;
    reg enablen;
    reg clk;
    wire [3:0] D;
    wire loadn;
    wire p_1hz;

    entrada_clock_nivel2 DUT(
        .keyboard(keyboard),
        .enablen(enablen),
        .clk(clk),
        .D(D),
        .loadn(loadn),
        .p_1hz(p_1hz)
    );

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, entrada_clock_nivel2_teste);

            #5 keyboard = 10'b1000000000;
            clk = 1;
            enablen = 0;
            repeat(256)
                #1 clk = ~clk;

            #5 keyboard = 10'b0100000000;
            clk = 1;
            repeat(256)
                #1 clk = ~clk;

            #5 keyboard = 10'b100000000;
            clk = 1;
            enablen = 1;
            repeat(256)
                #1 clk = ~clk;

            enablen = 0;
            repeat(256)
                #1 clk = ~clk;

    end
endmodule