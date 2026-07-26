module FullAdder(
  input a, b, cin,
  output reg sum, cout
);
  
  always @(*)
    begin
      sum = a ^ b ^ cin;
      cout = (a&b) + (b&cin) + (a&cin);
    end
    
endmodule


module AddSubUnit4bit (
  input wire[3:0] A,
  input wire[3:0] B,
  input Control,
  output wire[3:0] sum,
  output carry
);
  
  wire[3:0] Bcomp;
  wire c0, c1, c2;
  
  xor gates[3:0](Bcomp, B, Control);
  
  FullAdder FA0(.a(A[0]), .b(Bcomp[0]), .cin(Control), .sum(sum[0]), .cout(c0));
  FullAdder FA1(.a(A[1]), .b(Bcomp[1]), .cin(c0), .sum(sum[1]), .cout(c1));
  FullAdder FA2(.a(A[2]), .b(Bcomp[2]), .cin(c1), .sum(sum[2]), .cout(c2));
  FullAdder FA3(.a(A[3]), .b(Bcomp[3]), .cin(c2), .sum(sum[3]), .cout(carry));
  
endmodule
