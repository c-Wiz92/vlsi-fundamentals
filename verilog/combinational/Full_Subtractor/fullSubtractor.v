module Half_Subtractor(input a, b, output d, bor);
  
  wire w1;
  xor(d, a, b);
  not(w1, a);
  and(bor, w1, b);
  
endmodule


module Full_Subtractor(input ain, bin, c, output diff, borrow);
  
  wire w1, w2, w3;
  
  Half_Subtractor H1(.a(ain), .b(bin), .d(w1), .bor(w2));
  Half_Subtractor H2(.a(w1), .b(c), .d(diff), .bor(w3));

  or(borrow, w3, w2);
  
endmodule
