module ALU(						//算术逻辑单元
  input   [31:0]  A, B,			//操作数A、B
  input   [3:0]   ALUControlE,	//算术或逻辑指令操作符
  output  [31:0]  ALUOutE		//算术或逻辑输出
  );

  parameter 
		ADDU = 4'b0000,			//0：无符号加
		ADD  = 4'b0001,			//1：算术加
		SUBU = 4'b0010,			//2：无符号减
		SUB  = 4'b0011,			//3：算术减
		SLTU = 4'b0100,			//4：两个无符号数判小
		SLT  = 4'b0101,			//5：两个有符号数判小
		SLL  = 4'b0110,			//6：逻辑左移，移动次数以数給出
		SLLV = 4'b0111,			//7：逻辑左移，移动次数以变量給出
		SRL  = 4'b1000,			//8：逻辑右移，移动次数以数給出
		SRLV = 4'b1001,			//9：逻辑右移，移动次数以变量給出
		SRA  = 4'b1010,			//10：算术右移，移动次数以数給出
		SRAV = 4'b1011,			//11：算术右移，移动次数以变量給出
		AND  = 4'b1100,			//12：逻辑与
		OR   = 4'b1101,			//13：逻辑或
		XOR  = 4'b1110,			//14：逻辑异或
		NOR  = 4'b1111;			//15：逻辑同或
  
  reg [31:0] Temp;
  always @(*)
    Temp <= $signed(B) >>> $signed(A[4:0]);			//对$signed(B)算术左移位，
													//signed变量移位操作时最好使用<<<和>>>，防止对符号位进行操作，导致数据出错
  assign ALUOutE = (ALUControlE == ADDU)  ? (A + B) :
                   (ALUControlE == ADD)   ? (A + B) :
                   (ALUControlE == SUBU)  ? (A - B) :
                   (ALUControlE == SUB)   ? (A - B) :
                   (ALUControlE == SLTU)  ? ((A < B) ? 1 : 0) :
                   (ALUControlE == SLT)   ? (($signed(A) < $signed(B)) ? 1 : 0) :
                   (ALUControlE == SLL)   ? (B << A[4:0]) :
                   (ALUControlE == SLLV)  ? (B << A[4:0]) :
                   (ALUControlE == SRL)   ? (B >> A[4:0]) :
                   (ALUControlE == SRLV)  ? (B >> A[4:0]) :
                   (ALUControlE == SRA)   ? (Temp) :
                   (ALUControlE == SRAV)  ? (Temp) :
                   (ALUControlE == AND)   ? (A & B) :
                   (ALUControlE == OR)    ? (A | B) :
                   (ALUControlE == XOR)   ? (A ^ B) :
                   (ALUControlE == NOR)   ? ~(A | B) :
                                            32'b0;
  
endmodule