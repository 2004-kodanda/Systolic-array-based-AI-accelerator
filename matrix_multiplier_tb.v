`timescale 1ns/1ps

module MatrixMultiplier_tb;

    // Parameters
    parameter M = 4; // Rows of matrix A
    parameter N = 4; // Columns of matrix B

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] A [0:M-1]; // Matrix A (MxK)
    reg [15:0] B [0:N-1]; // Matrix B (KxN)

    // Outputs
    wire [31:0] C [0:M-1][0:N-1]; // Result matrix C (MxN)

    // Instantiate the MatrixMultiplier module
    MatrixMultiplier #(M, N) uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .B(B),
        .C(C)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        rst = 1; // Reset the system
        #20;     // Wait for 20 time units
        rst = 0; // Release reset

        // Initialize matrix A (4x4)
        A[0] = 16'h0001; A[1] = 16'h0002; A[2] = 16'h0003; A[3] = 16'h0004;
        A[4] = 16'h0005; A[5] = 16'h0006; A[6] = 16'h0007; A[7] = 16'h0008;
        A[8] = 16'h0009; A[9] = 16'h000A; A[10] = 16'h000B; A[11] = 16'h000C;
        A[12] = 16'h000D; A[13] = 16'h000E; A[14] = 16'h000F; A[15] = 16'h0010;

        // Initialize matrix B (4x4)
        B[0] = 16'h0001; B[1] = 16'h0000; B[2] = 16'h0000; B[3] = 16'h0000;
        B[4] = 16'h0000; B[5] = 16'h0001; B[6] = 16'h0000; B[7] = 16'h0000;
        B[8] = 16'h0000; B[9] = 16'h0000; B[10] = 16'h0001; B[11] = 16'h0000;
        B[12] = 16'h0000; B[13] = 16'h0000; B[14] = 16'h0000; B[15] = 16'h0001;

        // Wait for computation to complete
        #200;

        // Display the result matrix C
        $display("Result Matrix C:");
        for (integer i = 0; i < M; i = i + 1) begin
            for (integer j = 0; j < N; j = j + 1) begin
                $display("C[%0d][%0d] = %h", i, j, C[i][j]);
            end
        end

        // Verify the result
        if (C[0][0] === 32'h0001 && C[1][1] === 32'h0006 && C[2][2] === 32'h000B && C[3][3] === 32'h0010) begin
            $display("Test Passed: Result matrix C is correct!");
        end else begin
            $display("Test Failed: Result matrix C is incorrect!");
        end

        // End simulation
        $finish;
    end

endmodule
