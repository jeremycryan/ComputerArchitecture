`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  reg in0, in1, in2, in3;	// Input lines
  reg s0, s1;			// Select lines
  wire out; wire out2;		// Output
  integer i;

  behavioralMultiplexer mux (out, s0, s1, in0, in1, in2, in3);
  structuralMultiplexer my_mux (out2, s0, s1, in0, in1, in2, in3);

  initial begin
    $dumpfile("multiplexer.vcd");
    $dumpvars();

    $display(" S0 S1 | I0 I1 I2 I3 | BEN OUT | MY OUT");
    for (i=0;i<64;i=i+1) begin
      in0=i%2;
      in1=i/2%2;
      in2=i/4%2;
      in3=i/8%2;
      s0=i/16%2;
      s1=i/32%2;
      #500;
      $display("  %b  %b |  %b  %b  %b  %b |       %b |      %b", s0, s1, in0, in1, in2, in3, out, out2);    
    
    
    end
    $finish();


    // Your test code here
  end
endmodule
