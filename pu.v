`timescale 1ns / 1ps

module pu # (parameter DATA_WIDTH = 32)(
    input wire clk,
    input wire select,
    input wire rst_n,
    input wire [DATA_WIDTH-1 : 0] w,
    input wire [DATA_WIDTH-1 : 0] x,
    input wire [DATA_WIDTH-1 : 0] psum,
    output wire [DATA_WIDTH-1 : 0] data_out
    );
    // multiplier
    wire [DATA_WIDTH-1 : 0] out_mul;
    multiplier mul_0 (
        .A(x),
        .B(w),
        .C(out_mul)
    );
    
endmodule
