module JK_Latch( // positive level triggered jk latch with async reset
  input enb, reset, J, K,
  output reg q, qbar
);
  
  always @(*) begin
    if (!reset) begin
      if (enb) begin
        if (J==0 && K==0) begin
          q <= q;
          qbar <= qbar;
        end
        else if (J==0 && K==1) begin
          q <= 0;
          qbar <= 1;
        end
        else if (J==1 && K==0) begin
          q <= 1; 
          qbar <= 0;
        end
        else if (J==1 && K==1) begin
          q <= ~q;
          qbar <= ~qbar;
        end
      end
    end
    
    else begin // asynchronous reset
      q <= 0;
      qbar <= 1;
    end
  end
  
endmodule
