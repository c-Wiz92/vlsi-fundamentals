module tb();
  
  reg [7:0] t_Input;
  reg [2:0] t_sel;
  wire t_f; 
  
  cascade8by1 dut(.sel(t_sel), .in(t_Input), .f(t_f));
  
  initial begin
    $monitor("\nT=%t | S2=%b S1=%b S0=%b | Input=%b | F=%b" ,$time, t_sel[2], t_sel[1], t_sel[0], t_Input, t_f);
    
    t_Input = 8'b00000000; t_sel = 3'b000; #10;
    t_Input = 8'b00000001; t_sel = 3'b000; #10;
    
    t_Input = 8'b00000010; t_sel = 3'b001; #10;
    t_Input = 8'b00000001; t_sel = 3'b001; #10;
    
    t_Input = 8'b10000000; t_sel = 3'b111; #10;
    t_Input = 8'b00000000; t_sel = 3'b111; #10;
    
    t_Input = 8'b01000000; t_sel = 3'b110; #10;
    t_Input = 8'b11011111; t_sel = 3'b101; #10;
    
    t_Input = 8'b11011111; t_sel = 3'b011; #10;
    t_Input = 8'b11110111; t_sel = 3'b011; #10;

    $finish;
    
  end
endmodule
