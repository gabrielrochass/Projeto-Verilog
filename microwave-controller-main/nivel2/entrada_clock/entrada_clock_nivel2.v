`include "./nivel2/entrada_clock/codificador/encoder.v"
`include "./nivel2/entrada_clock/contador_0_7/counter07.v"
`include "./nivel2/entrada_clock/contador_freq100/count_50hz.v"
`include "./nivel2/entrada_clock/MUX/mux.v"

module entrada_clock_nivel2(    input [9:0] keyboard, input enablen, input clk,
                                output [3:0] D, output loadn,   output p_1hz    );

    wire relogio100, Q;
    reg keyboard_on;
    initial keyboard_on = 0;
    always @(keyboard) begin
        if(keyboard == 10'b00000_00000)
            keyboard_on <= 0;
        else
            keyboard_on <= 1;
    end
    assign loadn = ~keyboard_on;
    encoder encoder_inst(keyboard, enablen, D);
    count_50hz count_50hz_inst(clk, relogio100);
    counter07 counter07_inst(clk, loadn, Q);
    mux mux_inst(enablen, Q, relogio100, p_1hz);

endmodule
