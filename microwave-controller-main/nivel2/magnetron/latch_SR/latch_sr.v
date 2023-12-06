module latch_SR ( input wire set, input wire reset,
                  output reg Q  );

  always @* begin
    case ({set, reset})
      2'b00: Q <= Q;
      2'b01: Q <= 1'b0;
      2'b10: Q <= 1'b1;
      2'b11: Q <= 1'b0;
    endcase
  end

endmodule
