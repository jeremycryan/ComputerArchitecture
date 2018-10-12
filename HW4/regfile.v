`include "mux.v"
`include "register.v"
`include "decoder.v"

module regfile
(
    output[31:0] ReadData1,
    output[31:0] ReadData2,
    input[31:0] WriteData,
    input[4:0] ReadRegister1,
    input[4:0] ReadRegister2,
    input[4:0] WriteRegister,
    input RegWrite,
    input Clk
);

    wire[31:0] outs[31:0];   // Read outputs for each register
    wire[31:0] enables;      // Enable inputs for each register

    // Decodes write register address to write enable array. Additionally
    // filters based on RegWrite, so we don't write when we don't want to.
    decoder1to32 dec (enables, RegWrite, WriteRegister);


    // Generate 32 32-bit registers, one of which only outputs zeros.
    // The write enables of these registers are controlled by the decoder.
    register32zero reggie (outs[0], WriteData, enables[0], Clk); // All zeros

    genvar i;
    generate // The 31 normal registers
        for (i = 1; i < 32; i = i + 1) begin

            // Instantiate 32 memory elements
            register32 regs (outs[i], WriteData, enables[i], Clk);

        end
    endgenerate

    // Assign read outputs with 32-bit muxen
    mux32to1by32 mux0 (ReadData1, ReadRegister1, outs[0], outs[1], outs[2], outs[3], outs[4], outs[5], outs[6], outs[7], outs[8], outs[9], outs[10], outs[11], outs[12], outs[13], outs[14], outs[15], outs[16], outs[17], outs[18], outs[19], outs[20], outs[21], outs[22], outs[23], outs[24], outs[25], outs[26], outs[27], outs[28], outs[29], outs[30], outs[31]);

    mux32to1by32 mux1 (ReadData2, ReadRegister2, outs[0], outs[1], outs[2], outs[3], outs[4], outs[5], outs[6], outs[7], outs[8], outs[9], outs[10], outs[11], outs[12], outs[13], outs[14], outs[15], outs[16], outs[17], outs[18], outs[19], outs[20], outs[21], outs[22], outs[23], outs[24], outs[25], outs[26], outs[27], outs[28], outs[29], outs[30], outs[31]);

endmodule
