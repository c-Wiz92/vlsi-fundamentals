module tb;
  
  reg J, K, enb, reset;
  wire q, qbar;
  
  JK_Latch dut(.enb(enb), .reset(reset), .J(J), .K(K), .q(q), .qbar(qbar));
  
  initial begin
    {enb, J, K} = 1'b0;
    reset = 1'b1;
    $monitor("Time=%t Enable=%b Reset=%b | J=%b K=%b | Q=%b Q'=%b", $time, enb, reset, J, K, q, qbar);
  end
  
  always #5 enb=~enb;
  
  initial begin
    #10 reset = 0; J=1'b1; K=1'b0; //set
    #10 J=1'b0; K = 1'b0; //hold
    #10 reset=1'b1; //async reset
    #10 reset=1'b0; J=1'b1; K=1'b0; //set
    #10 J=1'b0; K=1'b1; //reset
    #10 $display("Done"); $finish;
  end
  
endmodule
