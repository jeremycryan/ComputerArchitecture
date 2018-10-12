## Deliverable 1

See **thegoodway.png** and **thebadway.png** in this folder.

## Deliverable 6

The decoder works by using the bit shift operator in Verilog. The value assigned to out is the value of enable 
**shifted left** by *address* bits. This means that if enable is zero, out will always be equal to zero as well;
however, if enable is one, it will be shifted such that there are *address* zeros following it (e.g. for an address
of d3 / b11, out would equal 000...01000).

This is an elegant implementation of the decoder because it behaves exactly as you would hope, assigning the corresponding
single output based on an address and an enable, while only using a single operator.

## Other Deliverables

See Verilog files in HW4 folder.
