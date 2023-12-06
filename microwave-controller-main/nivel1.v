`include "nivel2/contador/contador_nivel2.v"
`include "nivel2/decodificador/decodificador.v"
`include "nivel2/entrada_clock/entrada_clock_nivel2.v"
`include "nivel2/magnetron/magnetron_nivel2.v"

module nivel1(  input wire [9:0] keypad, input wire clock, input wire  startn, input wire  stopn, input wire  clearn, input wire  door_closed,
                output wire [6:0] minutes, output wire [6:0] tenSec,  output wire [6:0] sec, output wire mag_on   );

    wire saida_controle;
    wire [3:0] D;
    wire loadn;
    wire pgt_1Hz;
    wire zero;
    assign mag_on = saida_controle;
    wire [3:0] count_sec, count_tenSec, count_minutes; 
    entrada_clock_nivel2 entrada_clock_nivel2(keypad, saida_controle, clock, D, loadn, pgt_1Hz);
    contador_nivel2 contador_nivel2(D, pgt_1Hz, saida_controle, loadn, clearn, count_sec, count_tenSec, count_minutes, zero);
    magnetron_nivel2 magnetron_nivel2(startn, stopn, clearn, door_closed, zero, saida_controle);
    decodificador decodificador(count_minutes, count_tenSec, count_sec, minutes, tenSec, sec);

endmodule