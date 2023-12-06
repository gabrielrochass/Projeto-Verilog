module counter07( input wire clock, input wire clear,
                  output reg Q  );

  reg [2:0] counter07;

  always @(posedge clock or posedge clear) begin

    if (clear)
      begin
        counter07 = 3'b000;
        Q = 0;
      end
    
    else if (counter07 == 3)
      begin
        Q = 1;
        counter07 = counter07 + 1'b1;
      end
    
    else if (counter07 < 7)
      begin
        counter07 = counter07 + 1'b1;
      end
  end

endmodule