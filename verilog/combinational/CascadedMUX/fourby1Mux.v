module fourby1Mux (
  input [1:0] select,
  input [3:0] inputs,
  output out
);
  
  wire a, b, c, d;
  wire [1:0] notSelect;
  not notGates [1:0](notSelect, select);
  
  and (a, notSelect[1], notSelect[0], inputs[0]);
  and (b, notSelect[1], select[0], inputs[1]);
  and (c, select[1], notSelect[0], inputs[2]);
  and (d, select[1], select[0], inputs[3]);
  
  or (out, a, b, c, d);
endmodule


// 8:1 MUX using three 4:1 MUXs

module cascade8by1 (
  input [2:0] sel,
  input [7:0] in,
  output f
);
  
  wire a, b;
  
  fourby1Mux M1(.select({sel[1], sel[0]}), .inputs(in[3:0]), .out(a));
  fourby1Mux M2(.select({sel[1], sel[0]}), .inputs(in[7:4]), .out(b));
  fourby1Mux M3(.select({1'b0, sel[2]}), .inputs({1'b0,1'b0,b,a}), .out(f));
endmodule
