// Decoder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    
    wire con_0; wire con_1; wire con_2; wire con_3;
    wire tc0; wire tc1; wire tc2; wire tc3;    
    wire n0; wire n1;

    // Inverted inputs
    `NOT not_0 (n0, address0);
    `NOT not_1 (n1, address1);

    // Determine which output is connected to enable
    `AND connected_0 (con_0, n0, n1);
    `AND connected_1 (con_1, address0, n1);
    `AND connected_2 (con_2, n0, address1);
    `AND connected_3 (con_3, address0, address1);

    // Set output conditions
    `AND out0_is_true (out0, con_0, enable);
    `AND out1_is_true (out1, con_1, enable);
    `AND out2_is_true (out2, con_2, enable);
    `AND out3_is_true (out3, con_3, enable);
    
endmodule

