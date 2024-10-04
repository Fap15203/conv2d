`timescale 1ns / 1ps

module mmu(
    input [31:0] input0,		
    input [31:0] input1,		
    input [31:0] input2,		
    input [31:0] input3,		
    input [31:0] input4,		
    input [31:0] input5,		
    input [31:0] input6,		
    input [31:0] input7,		
    input [31:0] input8,		
    input [31:0] input9,		
    input [31:0] input10,		
    input [31:0] input11,		
    input [31:0] input12,		
    input [31:0] input13,		
    input [31:0] input14,		
    input [31:0] input15,		
    input [31:0] input16,		
    input [31:0] input17,		
    input [31:0] input18,		
    input [31:0] input19,		
    input [31:0] input20,		
    input [31:0] input21,		
    input [31:0] input22,		
    input [31:0] input23,		
    input [31:0] input24,		
    
    input [31:0] weight0,
    input [31:0] weight1,
    input [31:0] weight2,
    input [31:0] weight3,
    input [31:0] weight4,
    input [31:0] weight5,
    input [31:0] weight6,
    input [31:0] weight7,
    input [31:0] weight8,
    input [31:0] weight9,
    input [31:0] weight10,
    input [31:0] weight11,
    input [31:0] weight12,
    input [31:0] weight13,
    input [31:0] weight14,
    input [31:0] weight15,
    input [31:0] weight16,
    input [31:0] weight17,
    input [31:0] weight18,
    input [31:0] weight19,
    input [31:0] weight20,
    input [31:0] weight21,
    input [31:0] weight22,
    input [31:0] weight23,
    input [31:0] weight24,
    
    input [31:0] bias,
    
    output [31:0] finalOutput

    );		
	wire [31:0] tempOutput[0:24];	
	wire [31:0] tempSum[0:24];
		
		//1st row
	multiplier m0 (input0,weight0,tempOutput[0]);
	multiplier m1 (input1,weight1,tempOutput[1]);
	multiplier m2 (input2,weight2,tempOutput[2]);
	multiplier m3 (input3,weight3,tempOutput[3]);
	multiplier m4 (input4,weight4,tempOutput[4]);
	
	adder a0(tempOutput[0], tempOutput[1], tempSum[0]);
	adder a1(tempSum[0], tempOutput[2], tempSum[1]);
	adder a2(tempSum[1], tempOutput[3], tempSum[2]);
	adder a3(tempSum[2], tempOutput[4], tempSum[3]);
	
	
	   //2nd row
	multiplier m5 (input5,weight5,tempOutput[5]);
	multiplier m6 (input6,weight6,tempOutput[6]);
	multiplier m7 (input7,weight7,tempOutput[7]);
	multiplier m8 (input8,weight8,tempOutput[8]);
	multiplier m9 (input9,weight9,tempOutput[9]);
	
	adder a4(tempOutput[5], tempOutput[6], tempSum[4]);
	adder a5(tempSum[4], tempOutput[7], tempSum[5]);
	adder a6(tempSum[5], tempOutput[8], tempSum[6]);
	adder a7(tempSum[6], tempOutput[9], tempSum[7]);
	
	
	   //3rd row
	multiplier m10 (input10,weight10,tempOutput[10]);
	multiplier m11 (input11,weight11,tempOutput[11]);
	multiplier m12 (input12,weight12,tempOutput[12]);
	multiplier m13 (input13,weight13,tempOutput[13]);
	multiplier m14 (input14,weight14,tempOutput[14]);
	
	adder a8(tempOutput[10], tempOutput[11], tempSum[8]);
	adder a9(tempSum[8], tempOutput[12], tempSum[9]);
	adder a10(tempSum[9], tempOutput[13], tempSum[10]);
	adder a11(tempSum[10], tempOutput[14], tempSum[11]);
	
	
	   //4th row
	multiplier m15 (input15,weight15,tempOutput[15]);
	multiplier m16 (input16,weight16,tempOutput[16]);
	multiplier m17 (input17,weight17,tempOutput[17]);
	multiplier m18 (input18,weight18,tempOutput[18]);
	multiplier m19 (input19,weight19,tempOutput[19]);
	
	adder a12(tempOutput[15], tempOutput[16], tempSum[12]);
	adder a13(tempSum[12], tempOutput[17], tempSum[13]);
	adder a14(tempSum[13], tempOutput[18], tempSum[14]);
	adder a15(tempSum[14], tempOutput[19], tempSum[15]);
	
	
	   //5th row
	multiplier m20 (input20,weight20,tempOutput[20]);
	multiplier m21 (input21,weight21,tempOutput[21]);
	multiplier m22 (input22,weight22,tempOutput[22]);
	multiplier m23 (input23,weight23,tempOutput[23]);
	multiplier m24 (input24,weight24,tempOutput[24]);
	
	adder a16(tempOutput[20], tempOutput[21], tempSum[16]);
	adder a17(tempSum[16], tempOutput[22], tempSum[17]);
	adder a18(tempSum[17], tempOutput[23], tempSum[18]);
	adder a19(tempSum[18], tempOutput[24], tempSum[19]);
	
	//--------------------------------------------------------------------------
	// sum of different row
	
	adder a20(tempSum[3], tempSum[7], tempSum[20]);
	adder a21(tempSum[11], tempSum[15], tempSum[21]);
	adder a22(tempSum[20], tempSum[19], tempSum[22]);
	adder a23(tempSum[22], tempSum[21], tempSum[23]);
	
    adder a24(tempSum[23], bias, tempSum[24]);
    
    assign finalOutput = tempSum[24];
endmodule		