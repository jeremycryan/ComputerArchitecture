// Decoder testbench

`timescale 1 ns / 1 ps
`include "decoder.v"

module testDecoder (); 
    reg addr0, addr1;
    reg enable;
    wire out0,out1,out2,out3;
    wire out4,out5,out6,out7;

    behavioralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
    structuralDecoder my_decoder (out4,out5,out6,out7,addr0,addr1,enable); // Swap after testing

    initial begin

    $dumpfile("decoder.vcd");
    $dumpvars();

    $display("En A0 A1| Ben's Output | My Output | Expected Output");
    enable=0;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | All false ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=0;addr0=1;addr1=0; #1000
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | All false ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=0;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | All false ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=0;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | All false ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=1;addr0=0;addr1=0; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | O0 Only   ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=1;addr0=1;addr1=0; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | O1 Only   ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=1;addr0=0;addr1=1; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | O2 Only   ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    enable=1;addr0=1;addr1=1; #1000 
    $display("%b  %b  %b |   %b  %b  %b  %b |   %b %b %b %b | O3 Only   ", enable, addr0, addr1, out0, out1, out2, out3, out4, out5, out6, out7);
    $finish();
    end

endmodule
