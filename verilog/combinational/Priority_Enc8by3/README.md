# 8:3 Priority Encoder

### Description: 
In this design, I have implemented an 8:3 Encoder in verilog with priority logic. The encoder has 8 input lines, and each of the lines have a decreasing 
order of priority starting from the 8th line (I7). 

The 3 output lines together produce a three bit binary code in the range 000 to 111.  


### Verification: 
- Self checking testbench
- Task based
- Exhaustive (iterate through all 256 input combinations)
- Fatal errors are logged


### Files: 
design/
	design.v
testbench/
	self_checkingTB.v



