`timescale 1ns / 1ps

module conv_tb;

    parameter NUM_FILTER    = 6;
    parameter OUT_ROW       = 28;
    parameter OUT_COL       = 28;

    reg clk;
    reg [31:0] imageArray [0:1023];									
	reg [31:0] weightArray [0:150];
	reg [31:0] biasArray [0:5];
    
    initial $readmemb("inputpixel.mem", imageArray, 0, 1023);		
	initial $readmemb("weight.mem", weightArray, 0, 150);	
	initial $readmemb("bias.mem", biasArray, 0, 5);	
    
    wire [31:0] finalOutput;
    reg [31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8, input9,
                    input10, input11, input12, input13, input14, input15, input16, input17, input18, input19,
                    input20, input21, input22, input23, input24;
    
    reg [31:0]     weight0, weight1, weight2, weight3, weight4, weight5, weight6, weight7, weight8, weight9,
                    weight10, weight11, weight12, weight13, weight14, weight15, weight16, weight17, weight18, weight19,
                    weight20, weight21, weight22, weight23, weight24;
    reg [31:0] bias = 0;
    mmu uut (
        .input0(input0),
        .input1(input1),
        .input2(input2),
        .input3(input3),
        .input4(input4),
        .input5(input5),
        .input6(input6),
        .input7(input7),
        .input8(input8),
        .input9(input9),
        .input10(input10),
        .input11(input11),
        .input12(input12),
        .input13(input13),
        .input14(input14),
        .input15(input15),
        .input16(input16),
        .input17(input17),
        .input18(input18),
        .input19(input19),
        .input20(input20),
        .input21(input21),
        .input22(input22),
        .input23(input23),
        .input24(input24),
        
        .weight0(weight0),
        .weight1(weight1),
        .weight2(weight2),
        .weight3(weight3),
        .weight4(weight4),
        .weight5(weight5),
        .weight6(weight6),
        .weight7(weight7),
        .weight8(weight8),
        .weight9(weight9),
        .weight10(weight10),
        .weight11(weight11),
        .weight12(weight12),
        .weight13(weight13),
        .weight14(weight14),
        .weight15(weight15),
        .weight16(weight16),
        .weight17(weight17),
        .weight18(weight18),
        .weight19(weight19),
        .weight20(weight20),
        .weight21(weight21),
        .weight22(weight22),
        .weight23(weight23),
        .weight24(weight24),
        .bias(bias),
        .finalOutput(finalOutput)
   );
    
    initial clk = 0;
    always begin
        #1 clk = ~clk ;
    end 
    
    initial begin 
        #5000;
        $finish;
    end
    
    integer n = 0, x = 0, y = 0;
    
    always begin
	    for (n = 0; n < NUM_FILTER; n = n+1) begin
            weight0 <= weightArray[25*n+0];
            weight1 <= weightArray[25*n+1];
            weight2 <= weightArray[25*n+2];
            weight3 <= weightArray[25*n+3];
            weight4 <= weightArray[25*n+4];
            weight5 <= weightArray[25*n+5];
            weight6 <= weightArray[25*n+6];
            weight7 <= weightArray[25*n+7];
            weight8 <= weightArray[25*n+8];
            weight9 <= weightArray[25*n+9];
            weight10 <= weightArray[25*n+10];
            weight11 <= weightArray[25*n+11];
            weight12 <= weightArray[25*n+12];
            weight13 <= weightArray[25*n+13];
            weight14 <= weightArray[25*n+14];
            weight15 <= weightArray[25*n+15];
            weight16 <= weightArray[25*n+16];
            weight17 <= weightArray[25*n+17];
            weight18 <= weightArray[25*n+18];
            weight19 <= weightArray[25*n+19];
            weight20 <= weightArray[25*n+20];
            weight21 <= weightArray[25*n+21];
            weight22 <= weightArray[25*n+22];
            weight23 <= weightArray[25*n+23];
            weight24 <= weightArray[25*n+24];
            
            bias <= biasArray[n];
            for (x = 0; x < OUT_ROW; x = x+1) begin
                for (y = 0; y < OUT_COL; y = y+1) begin
                #1
                    input0 <= imageArray[(x * 32) + y +  0];
                    input1 <= imageArray[(x * 32) + y +  1];
                    input2 <= imageArray[(x * 32) + y +  2];
                    input3 <= imageArray[(x * 32) + y +  3];
                    input4 <= imageArray[(x * 32) + y +  4];
                    
                    input5 <= imageArray[((x+1) * 32) + y +  0];
                    input6 <= imageArray[((x+1) * 32) + y +  1];
                    input7 <= imageArray[((x+1) * 32) + y +  2];
                    input8 <= imageArray[((x+1) * 32) + y +  3];
                    input9 <= imageArray[((x+1) * 32) + y +  4];
                    
                    input10 <= imageArray[((x+2) * 32) + y +  0];
                    input11 <= imageArray[((x+2) * 32) + y +  1];
                    input12 <= imageArray[((x+2) * 32) + y +  2];
                    input13 <= imageArray[((x+2) * 32) + y +  3];
                    input14 <= imageArray[((x+2) * 32) + y +  4];
                    
                    input15 <= imageArray[((x+3) * 32) + y +  0];
                    input16 <= imageArray[((x+3) * 32) + y +  1];
                    input17 <= imageArray[((x+3) * 32) + y +  2];
                    input18 <= imageArray[((x+3) * 32) + y +  3];
                    input19 <= imageArray[((x+3) * 32) + y +  4];
                    
                    input20 <= imageArray[((x+4) * 32) + y +  0];
                    input21 <= imageArray[((x+4) * 32) + y +  1];
                    input22 <= imageArray[((x+4) * 32) + y +  2];
                    input23 <= imageArray[((x+4) * 32) + y +  3];
                    input24 <= imageArray[((x+4) * 32) + y +  4];
                end
            end
        end
    end                        
endmodule
