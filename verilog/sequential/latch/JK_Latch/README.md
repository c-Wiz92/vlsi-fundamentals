## A positive level triggered JK Latch with Asynchronous reset is implemented in verilog and its behavior is verified in a testbench.


I observed something particularly interesting when testing the JK Latch thats specified in the design file.
- I noticed that when the toggle condition of the flip flop is satisfied (J, K = 1), the latch continuosly tries to toggle Q, Q'.
- But the sensitivity list has the argument (*) and hence it is triggered again because of the change. 
- So Q, Q' are toggled again, triggering the always block once again.
- This happens in a continuous loop and never ends. Hence the simulation gets stuck. 
 

This highlights a critical problem of toggle behaviour in level sensitive devices. 
