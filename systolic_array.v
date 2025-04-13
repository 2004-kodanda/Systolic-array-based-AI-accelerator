module SystolicArray #(parameter M=4, N=4) (
    input clk,              // Clock signal
    input rst,              // Reset signal
    input [15:0] A [0:M-1], // Matrix A (MxK)
    input [15:0] B [0:N-1], // Matrix B (KxN)
    output [31:0] C [0:M-1][0:N-1] // Result matrix C (MxN)
);

    // Instantiate PEs in a grid
    genvar i, j;
    generate
        for (i = 0; i < M; i = i + 1) begin : ROW
            for (j = 0; j < N; j = j + 1) begin : COL
                PE pe (
                    .clk(clk),
                    .rst(rst),
                    .a_in(i == 0 ? A[j] : ROW[i-1].COL[j].a_out),
                    .b_in(j == 0 ? B[i] : ROW[i].COL[j-1].b_out),
                    .a_out(ROW[i].COL[j].a_out),
                    .b_out(ROW[i].COL[j].b_out),
                    .c_out(C[i][j])
                );
            end
        end
    endgenerate

endmodule
