// 32-bit decoder
module decoder1to32
(
    output[31:0] q,
    input en,
    input[4:0] address
);
    assign q = en<<address;

endmodule
