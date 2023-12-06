`include "encoder.v"

module testbench_encoder();

  reg [9:0] keyboard;
  reg enablen;
  wire [3:0] BCD;

  encoder dut (
    .keyboard(keyboard),
    .enablen(enablen),
    .BCD(BCD)
  );

  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, testbench_encoder);

    
    keyboard = 10'b1000000000;
    enablen = 0;
    #5;

    keyboard = 10'b0100000000;
    enablen = 0;
    #5;

    keyboard = 10'b0010000000;
    enablen = 0;
    #5;
    
    keyboard = 10'b0001000000;
    enablen = 0;
    #5;
    
    keyboard = 10'b0000100000;
    enablen = 0;
    #5;
        
    keyboard = 10'b0000010000;
    enablen = 0;
    #5;
            
    keyboard = 10'b0000001000;
    enablen = 0;
    #5;
        
    keyboard = 10'b0000000100;
    enablen = 0;
    #5;
        
    keyboard = 10'b0000000010;
    enablen = 0;
    #5;
        
    keyboard = 10'b0000000001;
    enablen = 0;
    #5;

    $finish;
  end

endmodule