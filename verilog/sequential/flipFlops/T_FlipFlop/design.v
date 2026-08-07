module T_FlipFlop( // positive edge triggered T FF with active low async reset
  input clk, reset, T,
  output reg q, qbar
);
  
  always @(posedge clk, negedge reset) begin
    if (reset) begin
      if (T==0) begin
        q<=q;
        qbar<= qbar;
      end
      else if (T==1) begin
        q<=~q;
        qbar<=~qbar;
      end
    end
    else begin
      q<=0;
      qbar<=1;
    end
  end
  
endmodule
