module cronometro (CLK, UP, CLR, cent_unidade, cent_dezena,seg_unidade,seg_dezena);

input CLK, UP, CLR;
output [6:0]cent_unidade,cent_dezena,seg_unidade,seg_dezena;

wire f_out, en_out_centesimo, en_out_segundo;
wire[6:0]cont_centesimo;
wire [6:0]cont_segundo;

div_freq divisor(CLK,CLR, f_out);

contador centesimo(f_out,UP,CLR,7'd99,cont_centesimo,en_out_centesimo);
contador segundo(f_out,en_out_centesimo,CLR,7'd59,cont_segundo,en_out_segundo);

decodificador cent(cont_centesimo, cent_unidade,cent_dezena);
decodificador seg(cont_segundo,seg_unidade,seg_dezena);

endmodule