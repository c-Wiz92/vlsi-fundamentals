module mux_4by1 (input s1, s0, a0, a1, a2, a3, output f);
  
  wire w0, w1, w2, w3, w4, w5;
  not(w0, s0); // w0 = s0'
  not(w1, s1); // w1 = s1'
  
  and(w2, w1, w0, a0);
  and(w3, w1, s0, a1);
  and(w4, s1, w0, a2);
  and(w5, s1, s0, a3);
  
  or(f, w2, w3, w4, w5);
  
endmodule
