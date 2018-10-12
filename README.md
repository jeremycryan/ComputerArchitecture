# ComputerArchitecture
A repository for submitting CompArch assignments. Fall 2018.

## HW2 Writeup
### One-bit adder
The logic for this component is fairly simple. Given three inputs A, B, and CarryIn, it provides a one-bit sum, as well as a CarryOut output which is true if the sum exceeds one. This component is fundamental to more complex computing systems because they can be chained to produce counters of arbitrary length.

This is the output when I run my Verilog implementation of the adder:

```
 A B Cin | Ben's: SUM Cout | My: SUM Cout
 0 0 0   |          0    0 |       0    0
 1 0 0   |          1    0 |       1    0
 0 1 0   |          1    0 |       1    0
 1 1 0   |          0    1 |       0    1
 0 0 1   |          1    0 |       1    0
 1 0 1   |          0    1 |       0    1
 0 1 1   |          0    1 |       0    1
 1 1 1   |          1    1 |       1    1

```

As you can see, my structural implementation behaves the same as Ben's behavioral implementation for all combinations of inputs. Since the above truth table is exhaustive, we know that my module behaves identical logically to the optimal behavior.

### 2-bit decoder
In a 2-bit decoder, one of four outputs is chosen to be high based on a 2-bit input. For instance, if In0 and In1 are both low, then Out0 will be set to high. Furthermore, there is an "enable" input, which prevents any outputs from being set high as long as it is low.

The following is the output from my decoder test bench:

```
En A0 A1| Ben's Output | My Output | Expected Output
0  0  0 |   0  0  0  0 |   0 0 0 0 | All false 
0  1  0 |   0  0  0  0 |   0 0 0 0 | All false 
0  0  1 |   0  0  0  0 |   0 0 0 0 | All false 
0  1  1 |   0  0  0  0 |   0 0 0 0 | All false 
1  0  0 |   1  0  0  0 |   1 0 0 0 | O0 Only   
1  1  0 |   0  1  0  0 |   0 1 0 0 | O1 Only   
1  0  1 |   0  0  1  0 |   0 0 1 0 | O2 Only   
1  1  1 |   0  0  0  1 |   0 0 0 1 | O3 Only 
```

The output of my module is identical to the expected output and to Ben's behavioral implementation.

### 4:1 multiplexer
In a four-input multiplexer, one of four input signals (I0, I1, I2, I3) is passed to the output based on the value of two selection inputs (S0 and S1). Each unique combination of values for S0 and S1 corresponds to a unique input; for instance, if they are both low, then I0 is passed to the output.

My test bench produced the following output for my mux implementation:

```
 S0 S1 | I0 I1 I2 I3 | BEN OUT | MY OUT
  0  0 |  0  0  0  0 |       0 |      0
  0  0 |  1  0  0  0 |       1 |      1
  0  0 |  0  1  0  0 |       0 |      0
  0  0 |  1  1  0  0 |       1 |      1
  0  0 |  0  0  1  0 |       0 |      0
  0  0 |  1  0  1  0 |       1 |      1
  0  0 |  0  1  1  0 |       0 |      0
  0  0 |  1  1  1  0 |       1 |      1
  0  0 |  0  0  0  1 |       0 |      0
  0  0 |  1  0  0  1 |       1 |      1
  0  0 |  0  1  0  1 |       0 |      0
  0  0 |  1  1  0  1 |       1 |      1
  0  0 |  0  0  1  1 |       0 |      0
  0  0 |  1  0  1  1 |       1 |      1
  0  0 |  0  1  1  1 |       0 |      0
  0  0 |  1  1  1  1 |       1 |      1
  1  0 |  0  0  0  0 |       0 |      0
  1  0 |  1  0  0  0 |       0 |      0
  1  0 |  0  1  0  0 |       1 |      1
  1  0 |  1  1  0  0 |       1 |      1
  1  0 |  0  0  1  0 |       0 |      0
  1  0 |  1  0  1  0 |       0 |      0
  1  0 |  0  1  1  0 |       1 |      1
  1  0 |  1  1  1  0 |       1 |      1
  1  0 |  0  0  0  1 |       0 |      0
  1  0 |  1  0  0  1 |       0 |      0
  1  0 |  0  1  0  1 |       1 |      1
  1  0 |  1  1  0  1 |       1 |      1
  1  0 |  0  0  1  1 |       0 |      0
  1  0 |  1  0  1  1 |       0 |      0
  1  0 |  0  1  1  1 |       1 |      1
  1  0 |  1  1  1  1 |       1 |      1
  0  1 |  0  0  0  0 |       0 |      0
  0  1 |  1  0  0  0 |       0 |      0
  0  1 |  0  1  0  0 |       0 |      0
  0  1 |  1  1  0  0 |       0 |      0
  0  1 |  0  0  1  0 |       1 |      1
  0  1 |  1  0  1  0 |       1 |      1
  0  1 |  0  1  1  0 |       1 |      1
  0  1 |  1  1  1  0 |       1 |      1
  0  1 |  0  0  0  1 |       0 |      0
  0  1 |  1  0  0  1 |       0 |      0
  0  1 |  0  1  0  1 |       0 |      0
  0  1 |  1  1  0  1 |       0 |      0
  0  1 |  0  0  1  1 |       1 |      1
  0  1 |  1  0  1  1 |       1 |      1
  0  1 |  0  1  1  1 |       1 |      1
  0  1 |  1  1  1  1 |       1 |      1
  1  1 |  0  0  0  0 |       0 |      0
  1  1 |  1  0  0  0 |       0 |      0
  1  1 |  0  1  0  0 |       0 |      0
  1  1 |  1  1  0  0 |       0 |      0
  1  1 |  0  0  1  0 |       0 |      0
  1  1 |  1  0  1  0 |       0 |      0
  1  1 |  0  1  1  0 |       0 |      0
  1  1 |  1  1  1  0 |       0 |      0
  1  1 |  0  0  0  1 |       1 |      1
  1  1 |  1  0  0  1 |       1 |      1
  1  1 |  0  1  0  1 |       1 |      1
  1  1 |  1  1  0  1 |       1 |      1
  1  1 |  0  0  1  1 |       1 |      1
  1  1 |  1  0  1  1 |       1 |      1
  1  1 |  0  1  1  1 |       1 |      1
  1  1 |  1  1  1  1 |       1 |      1
```

The first thing you will notice is that the outputs from my system exactly match those of the behavioral implementation, and are consistent with the expected behavior of the mux. The second thing you will notice is that this is a lot of input/output combinations, and I'm really glad that I looked into Verilog `for` loops.

### Waveforms and Delay
I furthermore added some delay to my gates to see how signal delay could affect these elements in a physical circuit.

In the **adder**, shown below, the CarryOut output had a particularly high latency. This was mostly because I used a few more gates than was optimal, and the individual delays added up.

![HW2_adder_waveform](https://github.com/jeremycryan/ComputerArchitecture/blob/master/HW2/HW2_adder_wave.JPG?raw=true)

The waveform for the **decoder** notably has a brief period where the last output is true where it should not be. This is an artifact of the delay in the other logic that temporarily puts the system in a state consistent with that output being true.

![HW2_demux_waveform](https://github.com/jeremycryan/ComputerArchitecture/blob/master/HW2/HW2_demux_wave.JPG?raw=true)

4:1 multiplexer waveform

![HW2_mux_waveform](https://github.com/jeremycryan/ComputerArchitecture/blob/master/HW2/HW2_mux_wave.JPG?raw=true)
