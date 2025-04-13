module MatrixMultiplier #(parameter M=4, N=4) (
    input clk,              // Clock signal
    input rst,              // Reset signal
    input [15:0] A [0:M-1], // Matrix A (MxK)
    input [15:0] B [0:N-1], // Matrix B (KxN)
    output [31:0] C [0:M-1][0:N-1] // Result matrix C (MxN)
);

    SystolicArray #(M, N) sa (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C)
    );

endmodule
