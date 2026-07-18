module test_4By1Mux();
  reg t_s1, t_s0, t_a0, t_a1, t_a2, t_a3;
  wire t_f;
  
  // Instantiating the Desgin Under Test (DUT)
  mux_4by1 M1(t_s1, t_s0, t_a0, t_a1, t_a2, t_a3, t_f);
  
  initial begin
    t_s1 = 0; t_s0 = 0; t_a0 = 1; t_a1 = 0; t_a2 = 1; t_a3 = 1; #10
    t_s1 = 0; t_s0 = 0; t_a0 = 0; t_a1 = 0; t_a2 = 1; t_a3 = 1; #10
    
    t_s1 = 1; t_s0 = 0; t_a0 = 1; t_a1 = 0; t_a2 = 0; t_a3 = 1; #10
    t_s1 = 1; t_s0 = 0; t_a0 = 1; t_a1 = 0; t_a2 = 1; t_a3 = 1; #10
    $finish;
  end
  
  initial begin
    $dumpfile("muxDump.vcd");
    $dumpvars(0, test_4By1Mux);
  end
  
endmodule
