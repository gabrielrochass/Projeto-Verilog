`timescale 1ms/1ms
`include "nivel1.v"

module nivel1_test();
    reg [9:0] keypad;
    reg clock;
    reg startn;
    reg stopn;
    reg door_closed;
    reg clearn;

    wire [6:0] sec, tenSec, minutes;
    wire mag_on;

    nivel1 dut(.startn(startn), .stopn(stopn), .door_closed(door_closed), .clearn(clearn), .keypad(keypad), .clock(clock), .sec(sec), .tenSec(tenSec), .minutes(minutes), .mag_on(mag_on));

    initial clock = 0;

    always #5 clock = ~clock;

    initial begin
        $dumpfile("result.vcd");
        $dumpvars(0, nivel1_test);
    end

    initial begin
            keypad = 10'b0000000000;
            door_closed = 0;
            stopn = 1;
            startn = 1;

            // Start counter
            clearn = 1; #1;
            clearn = 0; #1;
            clearn = 1;

            // Press 5
            #900;
            keypad = 10'b0000100000;
            #900;
            keypad = 10'b0000000000;
            
            // Press 0
            #900;
            keypad = 10'b0000000001;
            #900;
            keypad = 10'b0000000000;
            
            // Press 3
            #900;
            keypad = 10'b0000000100;
            #900;
            keypad = 10'b0000000000;
            
            // Close door
            door_closed = 1;
            #700;
            startn = 0;
            #700;
            startn = 1;
            #1400;
            
            // Turn on
            #900;
            startn = 0;
            #900;
            startn = 1;
            #900;
            
            // Stop timer
            stopn = 0;
            #700;
            stopn = 1;
            #700;
            startn = 0;
            #700;
            startn = 1;
            #1400;
            
            // Open door
            #8000;
            door_closed = 0;
            #800;
            door_closed = 1;
            #1000;
            $finish();
    end

endmodule