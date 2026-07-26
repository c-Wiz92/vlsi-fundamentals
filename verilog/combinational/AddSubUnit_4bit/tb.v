module tb(
);
  
  reg t_Control;
  reg [3:0] t_A, t_B;
  wire [3:0] t_sum;
  wire t_carry;
  
  AddSubUnit4bit dut(.A(t_A), .B(t_B), .Control(t_Control), .sum(t_sum), .carry(t_carry));
  
  initial begin
    $monitor("A=%b B=%b Control=%b | Sum=%b Carry=%b", t_A, t_B, t_Control, t_sum, t_carry);
    
    t_A=4'b0000; t_B=4'b0000; t_Control=0; #5;
    t_A=4'b0000; t_B=4'b0001; t_Control=0; #5;
    
    t_A=4'b0001; t_B=4'b0001; t_Control=1; #5;
    t_A=4'b0000; t_B=4'b0000; t_Control=1; #5;
    
    t_A=4'b0000; t_B=4'b1000; t_Control=1; #5;


    
  end
  
endmodule
