Developed a Verilog-based hardware accelerator using a systolic array architecture to efficiently perform matrix multiplication, a core operation in neural network inference and training.

Architecture & Design Highlights:
Implemented a 4×4 systolic array of Processing Elements (PEs), each responsible for executing Multiply-Accumulate (MAC) operations in a pipelined and parallel fashion.

PEs were arranged in a 2D grid where:

Inputs flowed horizontally and vertically across rows and columns.

Partial products propagated diagonally through the array.

Each PE had local registers and accumulators for data reuse, reducing memory bandwidth.

Achieved a fully pipelined dataflow, enabling one output per clock cycle after the array is filled (high throughput)
Developed a custom SystemVerilog testbench to stimulate the design with multiple matrix inputs (positive, negative, zero cases).

Used self-checking testbenches to compare output with expected results.

Visualized waveforms with GTKWave to ensure correct pipelining and timing behavior.

Verified corner cases like:

Zero matrices

Identity matrices

Asymmetric inputs (non-square test variation for scalability check)
