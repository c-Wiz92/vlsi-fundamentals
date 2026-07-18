module test_Full_Subtractor();
  
  reg t_a, t_b, t_c;
  wire t_diff, t_borr;
  
  // Instantiate the DUT
  Full_Subtractor FS1(.ain(t_a), .bin(t_b), .c(t_c), .diff(t_diff), .borrow(t_borr));
  
  initial begin
    $dumpfile("FullAdder.vcd");
    $dumpvars(0, test_Full_Subtractor);
    
    $monitor("Timme=%0t: | a=%b b=%b c=%b difference=%b borrow=%b", $time, t_a, t_b, t_c, t_diff, t_borr);
    
  end
  
  initial begin
    t_a = 0; t_b = 0; t_c = 0; #10;
    t_a = 0; t_b = 0; t_c = 1; #10;
    t_a = 1; t_b = 1; t_c = 1; #10;
    $finish;
  end
  
endmodule
