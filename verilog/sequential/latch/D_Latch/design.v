module D_Latch( // positive edge trigd. D Latch, async reset
  input enb, reset, D, 
  output reg q, qbar
);
  
  always @(*) begin
    if (!reset) begin
      if (enb) begin
        if (D==0) begin // reset
          q <=1'b0;
          qbar <=1'b1;
        end
        else if (D==1) begin // set
          q <= 1'b1;
          qbar <= 1'b0;
        end
        else begin
          q <= 1'bx;
          qbar <=1'bx;
        end
      end
    end
    else begin // Asynchronous reset
      q <= 1'b0;
      qbar <=1'b1;
    end
  end
  
endmodule
