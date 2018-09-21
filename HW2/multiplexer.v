// Multiplexer circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out2,
    input s0, s1,
    input in0, in1, in2, in3
);
    // Your multiplexer code here
    wire ns0; wire ns1;
    wire goto_0; wire goto_1; wire goto_2; wire goto_3;
    wire tc0; wire tc1; wire tc2; wire tc3; wire or0; wire or1;    

    // Inverted selection inputs
    `NOT s0inv(ns0, s0);
    `NOT s1inv(ns1, s1);

    // Determine which input to pass to output
    `AND select_0(goto_0, ns0, ns1);
    `AND select_1(goto_1, s0, ns1);
    `AND select_2(goto_2, ns0, s1);
    `AND select_3(goto_3, s0, s1);

    // All possible high output conditions
    `AND cond0(tc0, goto_0, in0);
    `AND cond1(tc1, goto_1, in1);
    `AND cond2(tc2, goto_2, in2);
    `AND cond3(tc3, goto_3, in3);

    // Or those together
    `OR or_gate_0(or0, tc0, tc1);
    `OR or_gate_1(or1, tc2, tc3);
    `OR output_or(out2, or0, or1);

endmodule
