module RegFile(							//寄存器文件，实现了 32 个 32 位通用整数寄存器，
										//可以同时进行两个寄存器的读操作和一个寄存器的写操作，时钟下降沿使能则写入。
  input           clk, rst, WE3,
  input   [4:0]   A1, A2, A3,			//第 一/二/三 个读寄存器地址（编号）
  input   [31:0]  WD3,					//要写入的数据
  output  [31:0]  SrcAD, SrcBD			//2个从寄存器读出的数据
  );
  
  reg [31:0] Regs[31:0];
  
  integer i;
  
  initial
    for (i = 0; i < 32; i = i + 1)
      Regs[i] <= 0;
  
  always @(rst)
    for (i = 0; i < 32; i = i + 1)
      Regs[i] <= 0;
  
  always @(posedge clk)					//在时钟上升沿将WD3的内容写入寄存器
    if ((WE3 == 1'b1) && (A3 != 5'b00000))
      Regs[A3] <= WD3;
  
  assign SrcAD = ((WE3 == 1'b1) && (A3 == A1) && (A3 != 5'b00000)) ? WD3 : Regs[A1];
  assign SrcBD = ((WE3 == 1'b1) && (A3 == A2) && (A3 != 5'b00000)) ? WD3 : Regs[A2];
  
endmodule