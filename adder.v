`timescale 1ns / 1ps
/*
module adder # (
    parameter DATA_WIDTH = 32,
    parameter FIXED_POINT = 16
)(
    input [DATA_WIDTH-1:0] a, b,
    output [DATA_WIDTH-1:0] c
    );
    reg [DATA_WIDTH-1:0] result;
    assign c = result;
    
    always @(a,b) 
    begin
        if(a[DATA_WIDTH-1] == b[DATA_WIDTH-1]) 
        begin						
            result[DATA_WIDTH-2:0] = a[DATA_WIDTH-2:0] + b[DATA_WIDTH-2:0];		
            result[DATA_WIDTH-1] = a[DATA_WIDTH-1];						
        end											
        else if(a[DATA_WIDTH-1] == 0 && b[DATA_WIDTH-1] == 1) 
        begin
            if( a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0] ) 
            begin					
                result[DATA_WIDTH-2:0] = a[DATA_WIDTH-2:0] - b[DATA_WIDTH-2:0];			
                result[DATA_WIDTH-1] = 0;										
            end
            else 
            begin												
                result[DATA_WIDTH-2:0] = b[DATA_WIDTH-2:0] - a[DATA_WIDTH-2:0];			
                if (result[DATA_WIDTH-2:0] == 0)
                    result[DATA_WIDTH-1] = 0;										
                else
                    result[DATA_WIDTH-1] = 1;									
                end
            end
        else 
        begin												
            if( a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0] ) 
            begin					
                result[DATA_WIDTH-2:0] = a[DATA_WIDTH-2:0] - b[DATA_WIDTH-2:0];			
                if (result[DATA_WIDTH-2:0] == 0)
                    result[DATA_WIDTH-1] = 0;										
                else
                    result[DATA_WIDTH-1] = 1;										
                end
            else 
            begin												
                result[DATA_WIDTH-2:0] = b[DATA_WIDTH-2:0] - a[DATA_WIDTH-2:0];			
                result[DATA_WIDTH-1] = 0;										
            end
        end
	end
endmodule
*/

module adder #(
	//Parameterized values
	parameter Q = 16,
	parameter N = 32
	)
	(
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] c
    );

reg [N-1:0] res;

assign c = res;

always @(a,b) begin
	// both negative or both positive
	if(a[N-1] == b[N-1]) begin						//	Since they have the same sign, absolute magnitude increases
		res[N-2:0] = a[N-2:0] + b[N-2:0];		//		So we just add the two numbers
		res[N-1] = a[N-1];							//		and set the sign appropriately...  Doesn't matter which one we use, 
															//		they both have the same sign
															//	Do the sign last, on the off-chance there was an overflow...  
		end												//		Not doing any error checking on this...
	//	one of them is negative...
	else if(a[N-1] == 0 && b[N-1] == 1) begin		//	subtract a-b
		if(a[N-2:0] > ~(b[N-2:0]) ) begin					//	if a is greater than b,
			res[N-2:0] = a[N-2:0] + b[N-2:0];			//		then just subtract b from a
			res[N-1] = 0;										//		and manually set the sign to positive
			end
		else begin												//	if a is less than b,
			res[N-2:0] = b[N-2:0] + a[N-2:0];			//		we'll actually subtract a from b to avoid a 2's complement answer
			if (res[N-2:0] == 0)
				res[N-1] = 0;										//		I don't like negative zero....
			else
				res[N-1] = 1;										//		and manually set the sign to negative
			end
		end
	else begin												//	subtract b-a (a negative, b positive)
		if( ~(a[N-2:0]) > b[N-2:0] ) begin					//	if a is greater than b,
			res[N-2:0] = a[N-2:0] + b[N-2:0];			//		we'll actually subtract b from a to avoid a 2's complement answer
			if (res[N-2:0] == 0)
				res[N-1] = 0;										//		I don't like negative zero....
			else
				res[N-1] = 1;										//		and manually set the sign to negative
			end
		else begin												//	if a is less than b,
			res[N-2:0] = b[N-2:0] + a[N-2:0];			//		then just subtract a from b
			res[N-1] = 0;								//		and manually set the sign to positive
			end
		end
	end
endmodule