`timescale 1ns/1ns
`include "decodificador.v"

module decodificador_teste;

    reg [3:0] Minutes_teste, TenSec_teste, Sec_teste;
  	wire [6:0] OutMinutes_teste, OutDezena_TB, OutSec_teste;

  	decodificador DUT(.Minutes(Minutes_teste), .TenSec(TenSec_teste), .Sec(Sec_teste), .OutMinutes(OutMinutes_teste), .OutTen(OutDezena_TB), .OutSec(OutSec_teste));

    initial
        begin
            $dumpfile("result.vcd");
            $dumpvars(0, decodificador_teste);

            Minutes_teste=4'b0000; TenSec_teste=4'b0000; Sec_teste=4'b0000;  
            #10  Minutes_teste=4'b0001; TenSec_teste=4'b0001; Sec_teste=4'b0001; 
         	  #10  Minutes_teste=4'b0010; TenSec_teste=4'b0010; Sec_teste=4'b0010;
            #10  Minutes_teste=4'b0011; TenSec_teste=4'b0011; Sec_teste=4'b0011;
            #10  Minutes_teste=4'b0100; TenSec_teste=4'b0100; Sec_teste=4'b0100;
            #10  Minutes_teste=4'b0101; TenSec_teste=4'b0101; Sec_teste=4'b0101;
          	#10  Minutes_teste=4'b0110; TenSec_teste=4'b0110; Sec_teste=4'b0110;
            #10  Minutes_teste=4'b0111; TenSec_teste=4'b0111; Sec_teste=4'b0111;
          	#10  Minutes_teste=4'b1000; TenSec_teste=4'b1000; Sec_teste=4'b1000;
            #10  Minutes_teste=4'b1001; TenSec_teste=4'b1001; Sec_teste=4'b1001;    
        end
endmodule