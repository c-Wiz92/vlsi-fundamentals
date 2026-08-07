module D_FlipFlop( //positive edge triggered D-FF with active high async reset
  input clk, reset, D,
  output reg q, qbar
);
  
  always @(posedge reset, posedge clk) begin
    
    if (!reset) begin
      if (D==0) begin
        q<=0;
        qbar<=1;
      end
      else if (D==1) begin
        q<=1;
        qbar<=0;
      end
      
    end
    else begin
      q<= 1'b0;
      qbar<=1'b1;
    end

  end
endmodule
