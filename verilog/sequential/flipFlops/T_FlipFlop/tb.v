module tb;
  
  reg clk, reset, T;
  wire q, qbar;
  
  T_FlipFlop dut(.reset(reset), .clk(clk), .T(T), .q(q), .qbar(qbar));
  
  always #5 clk = ~clk;
  
  initial begin
    $monitor("Time=%t Clk=%b Reset=%b | T=%b | Q=%b Q'=%b", $time, clk, reset, T, q, qbar);
    {reset, clk, T} = 1'b0;
    $dumpfile("dump.vcd");
    $dumpvars(1, tb);
  end

  initial begin
  	#10 reset=1'b1; T=1'b1;
    #10 reset=1'b0; 
    #10 reset=1'b1; T=1'b1;
    #10 T=1'b0; //hold state
    #10 $finish;
  end
endmodule
