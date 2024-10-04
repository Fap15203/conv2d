`timescale 1ns / 1ps

module multiplier # (
    parameter DATA_WIDTH = 32,
    parameter FIXED_POINT = 16
)(
    input [DATA_WIDTH-1 : 0] A, B,
    output [DATA_WIDTH-1 : 0] C
    );
    reg [2*DATA_WIDTH-1 : 0] result;
    reg [DATA_WIDTH-1 : 0] finalResult;
    assign C = finalResult;
    
    always @(A, B)	
	begin						
		result <= A[DATA_WIDTH-2:0] * B[DATA_WIDTH-2:0];													
	end
	
	always @(result) 
	begin											
		finalResult[DATA_WIDTH-1] <= A[DATA_WIDTH-1] ^ B[DATA_WIDTH-1];	
		finalResult[DATA_WIDTH-2:0] <= result[DATA_WIDTH-2+FIXED_POINT:FIXED_POINT];							
	end
endmodule
