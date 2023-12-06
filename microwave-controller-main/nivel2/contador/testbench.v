`timescale 1ns/1ps
`include "contador_nivel2.v"

module contador_nivel2_teste();

  wire [3:0] minutos_teste, dezenas_teste, segundos_teste;
  wire timer_teste;
  reg [3:0] data_teste;
  reg clearn_teste, enable_teste, loadn_teste, clock_teste;

 
   contador_nivel2 DUT(data_teste, clock_teste, enable_teste, loadn_teste, clearn_teste,
                  segundos_teste, dezenas_teste, minutos_teste, timer_teste);

  initial begin
    $dumpfile("result.vcd");
    $dumpvars(0, contador_nivel2_teste);

    clock_teste = 0;
    enable_teste = 0;
    loadn_teste = 0;
  end


  always begin
    #1 clock_teste = loadn_teste ? ~clock_teste : clock_teste;
  end


  initial begin
    clearn_teste = 1;
    #1 clearn_teste = 0;
    #1 clearn_teste = 1;

    #1 data_teste = 2;
    #1 clock_teste = 1;
    #1 clock_teste = 0;

    #1 data_teste = 1;
    #1 clock_teste = 1;
    #1 clock_teste = 0;

    #1 data_teste = 7;
    #1 clock_teste = 1;
    #1 clock_teste = 0;

    #1 data_teste = 9;
    #1 clock_teste = 1;
    #1 clock_teste = 0;

    enable_teste = 1;
    loadn_teste = 1;
    #10;

    $finish();
  end
endmodule
