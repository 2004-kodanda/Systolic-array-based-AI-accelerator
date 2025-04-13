module PE (
    input clk,              // Clock signal
    input rst,              // Reset signal
    input [15:0] a_in,      // Input from left PE
    input [15:0] b_in,      // Input from top PE
    output reg [15:0] a_out, // Output to right PE
    output reg [15:0] b_out, // Output to bottom PE
    output reg [31:0] c_out  // Accumulated result
);

    reg [31:0] accumulator; // Accumulator for MAC operation

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_out <= 16'b0;
            b_out <= 16'b0;
            c_out <= 32'b0;
            accumulator <= 32'b0;
        end else begin
            // Perform MAC operation
            accumulator <= accumulator + (a_in * b_in);
            // Pass inputs to next PE
            a_out <= a_in;
            b_out <= b_in;
            // Output accumulated result
            c_out <= accumulator;
        end
    end

endmodule
