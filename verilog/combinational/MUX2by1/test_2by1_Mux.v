module test_2by1Mux;
  
  reg t_a0, t_a1, t_select;
  wire t_f;
  
  TwoByOneMux M1(.select(t_select), .a0(t_a0), .a1(t_a1), .f(t_f));
  
  initial begin
    t_select = 0; t_a1 = 0; t_a0 = 0; #10;
    t_select = 0; t_a1 = 0; t_a0 = 1; #10;
    t_select = 0; t_a1 = 1; t_a0 = 0; #10;
    t_select = 0; t_a1 = 1; t_a0 = 1; #10;
    t_select = 1; t_a1 = 0; t_a0 = 0; #10;
    t_select = 1; t_a1 = 0; t_a0 = 1; #10;
    t_select = 1; t_a1 = 1; t_a0 = 0; #10;
    t_select = 1; t_a1 = 1; t_a0 = 1; #10;
    $finish;
  end
  
  initial begin
    $dumpfile("muxdump.vcd");
    $dumpvars(0, test_2by1Mux);
    
    $monitor("Time=%0t: Select=%b t_a1=%b t_a0=%b | F=%b", $time, t_select, t_a1, t_a0, t_f);
  end
  
endmodule

