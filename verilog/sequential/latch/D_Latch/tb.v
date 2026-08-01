module tb;
  reg enb, reset, D;
  wire q, qbar;
  
  D_Latch dut(.enb(enb), .reset(reset), .D(D), .q(q), .qbar(qbar));
  
  initial begin
    {enb, D} = 1'b0;
    reset = 1'b1;
    $monitor("Time=%t | Enable=%b Reset=%b | D=%b | Q=%b Q'=%b\n", $time, enb, reset, D, q, qbar);
  end
  
  always #5 enb = ~enb;
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1, tb);
    
    D = 1'b1;
    #10 reset = 1'b0;
    #10 D = 1'b1;
    #10 D = 1'b0;
    #10 $finish;
  end
  
endmodule
