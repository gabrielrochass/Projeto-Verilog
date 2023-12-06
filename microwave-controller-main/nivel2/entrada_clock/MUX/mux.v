module mux (  input wire sel, input wire counter, input wire Hz,
              output reg Q  );

  always@*
  if (sel == 0)
    begin
      Q = counter;
    end
  else
      Q = Hz;
endmodule