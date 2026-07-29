module encoder(
  input [7:0] In,
  output reg [2:0] Out
);
  
  always @(In) begin
    if (In[7])
      Out = 3'b111;
    else if (In[6])
      Out = 3'b110;
    else if (In[5])
      Out = 3'b101;
    else if (In[4])
      Out = 3'b100;
    else if (In[3])
      Out = 3'b011;
    else if (In[2])
      Out = 3'b010;
    else if (In[1])
      Out = 3'b001;
    else if (In[0])
      Out = 3'b000;
  end
  
endmodule
