// 32-bit multiplexer, with 1-bit inputs and outputs
module mux32to1by1 
(
    output q,
    input[4:0] sel,
    input[31:0] ins
);
    
// Assign value to Q based on inputs and address
    assign q = ins[sel];

endmodule

// 32-bit multiplexer, with 32-bit inputs and outputs
module mux32to1by32
(
    output[31:0] q,
    input[4:0] sel,
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
        in8, in9, in10, in11, in12, in13, in14, in15,
        in16, in17, in18, in19, in20, in21, in22, in23,
        in24, in25, in26, in27, in28, in29, in30, in31
);

    wire[31:0] mux[31:0];

    // Assign each input to a word of mux
    assign mux[0] = in0;
    assign mux[1] = in1;
    assign mux[2] = in2;
    assign mux[3] = in3;
    assign mux[4] = in4;
    assign mux[5] = in5;
    assign mux[6] = in6;
    assign mux[7] = in7;
    assign mux[8] = in8;
    assign mux[9] = in9;
    assign mux[10] = in10;
    assign mux[11] = in11;
    assign mux[12] = in12;
    assign mux[13] = in13;
    assign mux[14] = in14;
    assign mux[15] = in15;
    assign mux[16] = in16;
    assign mux[17] = in17;
    assign mux[18] = in18;
    assign mux[19] = in19;
    assign mux[20] = in20;
    assign mux[21] = in21;
    assign mux[22] = in22;
    assign mux[23] = in23;
    assign mux[24] = in24;
    assign mux[25] = in25;
    assign mux[26] = in26;
    assign mux[27] = in27;
    assign mux[28] = in28;
    assign mux[29] = in29;
    assign mux[30] = in30;
    assign mux[31] = in31;

    // Assign output to the correct input
    assign q = mux[sel];

endmodule
