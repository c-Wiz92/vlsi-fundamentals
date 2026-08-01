module tb;
  integer i;
  reg t_enb, t_reset;
  reg [1:0] t_in;
  wire t_q, t_qbar;
  
  SR_Latch dut(.enb(t_enb), .S(t_in[1]), .R(t_in[0]), .reset(t_reset), .q(t_q), .qbar(t_qbar));
  
  initial begin
    $monitor("\Time=%t Reset=%b | S=%b R=%b | Q=%b Q'=%b", $time, t_reset, t_in[1], t_in[0], t_q, t_qbar);
    {t_enb, t_reset, t_in} = 0;
  end
  
  always begin
    #5;
    t_enb = ~t_enb; // clock period = 10 time units
  end
  
  initial begin
    $dumpfile("muxdump.vcd");
    $dumpvars(1, tb);
    
    t_reset = 1;
    #10 t_reset = 0;
    #10 t_in = 2'b01;
    #10 t_in = 2'b10;
    #10 t_in = 2'b00; 
    #10 t_in = 2'b11;
    #10 $finish;
  end
endmodule

// inputs are applied at negative level to avoid potential setup, hold violations
