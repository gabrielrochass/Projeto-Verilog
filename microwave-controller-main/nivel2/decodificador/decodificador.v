module decodificador(input wire [3:0] Minutes, TenSec, Sec,
                     output reg [6:0] OutMinutes, OutTen, OutSec);
  
  always@(Minutes)
    case(Minutes)
      4'b0000 : OutMinutes = 7'b0000001;
      4'b0001 : OutMinutes = 7'b1001111;
      4'b0010 : OutMinutes = 7'b0010010;
      4'b0011 : OutMinutes = 7'b0000110;
      4'b0100 : OutMinutes = 7'b1001100;
      4'b0101 : OutMinutes = 7'b0100100;
      4'b0110 : OutMinutes = 7'b0100000;
      4'b0111 : OutMinutes = 7'b0001111;
      4'b1000 : OutMinutes = 7'b0000000;
      4'b1001 : OutMinutes = 7'b0000100;
    endcase

  always@(TenSec)
    case(TenSec)
      4'b0000 : OutTen = 7'b0000001;
      4'b0001 : OutTen = 7'b1001111;
      4'b0010 : OutTen = 7'b0010010;
      4'b0011 : OutTen = 7'b0000110;
      4'b0100 : OutTen = 7'b1001100;
      4'b0101 : OutTen = 7'b0100100;
      4'b0110 : OutTen = 7'b0100000;
      4'b0111 : OutTen = 7'b0001111;
      4'b1000 : OutTen = 7'b0000000;
      4'b1001 : OutTen = 7'b0000100;
    endcase
  
  always@(Sec)
    case(Sec)
      4'b0000 : OutSec = 7'b0000001;
      4'b0001 : OutSec = 7'b1001111;
      4'b0010 : OutSec = 7'b0010010;
      4'b0011 : OutSec = 7'b0000110;
      4'b0100 : OutSec = 7'b1001100;
      4'b0101 : OutSec = 7'b0100100;
      4'b0110 : OutSec = 7'b0100000;
      4'b0111 : OutSec = 7'b0001111;
      4'b1000 : OutSec = 7'b0000000;
      4'b1001 : OutSec = 7'b0000100;
    endcase
  
endmodule