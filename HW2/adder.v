// Adder circuit

// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin

);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Your adder code here

    wire axorb, ab, bc, ac, aborac, aboracorbc;

    // Calculate sum
    `XOR pre_sum_gate (axorb, a, b);
    `XOR sum_gate (sum, axorb, carryin);

    // Input ands
    `AND and0 (ab, a, b);
    `AND and1 (bc, b, carryin);
    `AND and2 (ac, a, carryin);
    
    // Determine carryout
    `OR aborac_gate (aborac, ab, ac);
    `OR aboracorbc_gate (aboracorbc, aborac, bc);
    `OR carry_gate (carryout, aboracorbc, ac);
    

endmodule
