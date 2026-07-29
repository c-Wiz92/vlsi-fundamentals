module tb;
  reg [7:0] t_In;
  wire [2:0] designOut;
  reg [2:0] expected;
  integer i;

  encoder dut(.In(t_In), .Out(designOut));
  
  task test;
    input [7:0] in;
    output [2:0] expected;
    
    casez(in)
      8'b00000001: expected = 3'b000;
      8'b0000001?: expected = 3'b001;
      8'b000001??: expected = 3'b010;
      8'b00001???: expected = 3'b011;
      8'b0001????: expected = 3'b100;
      8'b001?????: expected = 3'b101;
      8'b01??????: expected = 3'b110;
      8'b1???????: expected = 3'b111;
      default:expected = 3'bxxx;
    endcase
  endtask
  
  initial begin
    t_In = 8'b00000000; #1;
    for(i = 0; i<256; i=i+1) begin
      test(t_In, expected);
      if (designOut !== expected)
        $fatal(1, "\n\nFATAL ERROR | Input=%b Expected=%b Design Out=%b\n\n", t_In, expected, designOut);
      t_In=t_In+1; #1;
    	    
    end
  end
 endmodule
