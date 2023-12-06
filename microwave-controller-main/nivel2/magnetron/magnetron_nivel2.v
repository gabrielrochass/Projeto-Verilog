`include "./nivel2/magnetron/latch_SR/latch_sr.v"
`include "./nivel2/magnetron/controller_logic/controller_logic.v"

module magnetron_nivel2 (    input wire startn, input wire stopn, input wire clearn, input wire door_closed, input wire timer_done,
                            output wire mag_on  );

wire saida_set;
wire saida_reset;

controller_logic controller_logic(startn, stopn, clearn, door_closed, timer_done, saida_set, saida_reset);
latch_SR latch_SR(saida_set, saida_reset, mag_on);

endmodule