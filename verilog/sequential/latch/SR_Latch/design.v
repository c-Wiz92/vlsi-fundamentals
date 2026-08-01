module SR_Latch( // positive level trigd. , asynchronous reset
  input enb, reset, S, R, 
  output reg q, qbar
);
  always @(*) begin
    if(!reset) begin

      if (enb) begin
        if (S==1'b0 && R==1'b0) begin // hold
          q <= q;
          qbar <= qbar;
        end

        else if (S==1'b0 && R==1'b1) begin // reset
          q <= 0;
          qbar <= 1'b1;
        end

        else if (S==1'b1 && R==1'b0) begin // set
          q <= 1'b1;
          qbar <= 0;
        end

        else if(S==1'b1 && R==1'b1) begin // invalid
          q <= 1'bx;
          qbar <= 1'bx;
        end 
      end
    end
    
    else begin // ASYNC RESET
      q <= 0;
      qbar <=1;
    end
  end
  
endmodule
