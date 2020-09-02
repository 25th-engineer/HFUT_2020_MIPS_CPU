// 模块功能: 数据存储器
//          一个存储单元为4个字节
//          可控制数据类型
//          通过 A 读取写入
//          BE 来控制部分写入 与BEctrl协同工作 


module DM_4k(			//指令存储器为 ROM 类型的存储器，可根据 PC 值读取相应指令并输出。 分配 1024 个字存储
						//空间，字长为 32 位，容量为 4K。
  input   [11:2]  A,    // address bus
  input   [31:0]  WD,   // 32-bit input data
  input           clk,  // clock
  input           WE,	//数据存储器写使能
  input   [3:0]   BE,	//写回的位置
  output  [31:0]  RD    // 32-bit memory output
  );
  
  reg [31:0] RAM[0:1023];
  
  integer i;
  initial
    for (i = 0; i < 1023; i = i + 1)
      RAM[i] <= 0;
  
  assign RD = RAM[A];
  
  always @(posedge clk)
    if (WE)
      casex (BE)
        4'b0001: RAM[A][7:0]    <= WD[7:0];			//将ROM里面的数据读到RAM，运行CPU
        4'b0010: RAM[A][15:8]   <= WD[7:0];
        4'b0100: RAM[A][23:16]  <= WD[7:0];
        4'b1000: RAM[A][31:24]  <= WD[7:0];
        4'b0011: RAM[A][15:0]   <= WD[15:0];
        4'b1100: RAM[A][31:16]  <= WD[15:0];
        4'b1111: RAM[A]         <= WD;
        default: RAM[A]         <= 32'b0;
      endcase
  
endmodule