
// 1-bit register module
// Essentially a D flip-flop with enable
module register
(
    output reg q,
    input d,
    input wrenable,
    input clk
);

// Write D to Q if enabled on clock edge
    always @(posedge clk) begin
        if (wrenable) begin
	    q <= d;
        end
    end
endmodule

// 32-bit register module
module register32
(
    output[31:0] q,
    input[31:0] d,
    input wrenable,
    input clk
);

// Generate 32 one-bit registers
    genvar i;
    generate
        for (i = 0; i<32; i = i + 1) begin
            register reg_inst (q[i], d[i], wrenable, clk);
        end
    endgenerate
endmodule

// 32-bit register module, except it always outputs
// zeros, regardless of input.
module register32zero
(
    output [31:0] q,
    input[31:0] d,
    input wrenable,
    input clk
);

// Set all outputs to zero
    assign q = 32'b00000000000000000000000000000000;

endmodule
