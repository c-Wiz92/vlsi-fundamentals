module Test_HA;
  
  reg t_A , t_B;
  wire t_Sum, t_Carry;
  
  
  Half_Adder HA1 (.A(t_A), .B(t_B), .Sum(t_Sum), .Carry(t_Carry));
  

  initial begin  
    t_A = 0; t_B = 0; #10;
    t_A = 0; t_B = 1; #10;
    t_A = 1; t_B = 0; #10;
    t_A = 1; t_B = 1; #10;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, Test_HA);
    $monitor("Time=%0t: A=%b B=%b | Sum=%b Carry=%b", $time, t_A, t_B, t_Sum, t_Carry);
  end
  
endmodule
