module TwoByOneMux (input select, a0, a1, output f);
  
  wire w1, w2, w3;
  and(w1, select, a1);
  not(w2, select);
  and(w3, w2, a0);
  or(f, w1, w3);
  
endmodule
