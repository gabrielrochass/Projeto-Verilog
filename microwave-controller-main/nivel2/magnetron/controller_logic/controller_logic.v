module controller_logic(  input wire startn, input wire stopn, input wire clearn, input wire door_closed, input wire timer_done,
                          output wire set, output wire reset  );

  assign reset = (~door_closed) | (~clearn) | (~stopn) | timer_done;
  assign set = (~startn) & door_closed & (~timer_done);

endmodule