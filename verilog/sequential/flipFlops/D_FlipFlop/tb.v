module tb;
  
  reg clk, reset, D;
  wire q, qbar;
  
  D_FlipFlop dut(.reset(reset), .clk(clk), .D(D), .q(q), .qbar(qbar));
  
  always #5 clk = ~clk; // clk starts at 0 and switches to 1 at t=5
  
  initial begin
    {clk, D} = 1'b0; 
    reset = 1'b1;
    $monitor("Time=%t CLK=%b Reset=%b | D=%b | Q=%b Q'=%b", $time, clk, reset, D, q, qbar);
  end
  
  initial begin
    #10 reset=1'b0; D = 1'b1; // set
    #10 reset = 1'b1; // async reset
    #10 reset =1'b0; D = 1'b1;
    #10 D = 1'b0;
    #10 $finish;
  end
  
endmodule
