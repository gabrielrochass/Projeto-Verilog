`timescale 1ns/1ps
`include "count_mod10.v"

module count_mod10_testbench();

    reg [3:0] data; 
    reg clk, load, en, clearn;
    wire [3:0] count; 
    wire tc, count_endTB;
    integer aux;
    count_mod10 dut(data, clk, load, en, clearn, count, tc, count_endTB);

    initial
        begin
        
            $dumpfile("result.vcd");
            $dumpvars(0, count_mod10_testbench);
          
      assign load = 1;
      assign en = 0; 
      assign clearn = 1;
      assign data = 4'b1000;

      #10 assign load = 0;

      #10 assign load = 1;

      #10 assign en = 1; 
    end
  
  initial
    
    begin
        clk = 1'b0;
      end
        
  initial
    begin
      #10 clk = ~clk;
      aux = 0;

      while(aux<32)
        begin
          #10 clk = ~clk;
          aux = aux + 1;
        end
      
    end
    
endmodule