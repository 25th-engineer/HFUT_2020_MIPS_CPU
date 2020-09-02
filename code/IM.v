module IM_2k(					//数据存储器为 RAM 类型的存储器， 在写入时需要时钟上升沿和控制信号。分配 512 个字存
								//储空间，字长为 32 位，容量为 2K。
  input   [10:2]  A,			//9 位地址
  output  [31:0]  RD
  );
  
  reg [31:0] RAM[501:0];
  
  initial $readmemh("testbench_wh_3.data", RAM);		//把测试数据读入 RAM 中 
  //testbench_wh_3.data：测跳转指令、分支指令
  //data_stalls_CPU_1.data：测数据前推
  //testbench_wh.data：测分支指令
  //testbench_lhx.data：实用测试集
  
  assign RD = RAM[A[10:2]];					//把对应9位地址的 RAM 内容 赋值給RD
  
endmodule