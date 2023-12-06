`include "./nivel2/contador/contador_mod_10/count_mod10.v"
`include "./nivel2/contador/contador_mod_6/count_mod6.v"

`timescale 1ns/1ps

module contador_nivel2( input [3:0] data, input wire clk, input wire enable, input wire load, input wire clear,
                        output wire [3:0] count_us, output wire [3:0] count_ds, output wire [3:0] count_m,  output wire zero  );

  wire tc1, tc2, tc3;
  wire zero1, zero2, zero3;

  count_mod10 us(data, clk, load, enable, clear, count_us, tc1, zero1);
  count_mod6 ds(count_us, clk, load, tc1, clear, count_ds, tc2, zero2);
  count_mod10 ms(count_ds, clk, load, tc2, clear, count_m, tc3, zero3);

  assign zero = zero1 & zero2 & zero3;

endmodule