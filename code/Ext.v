module Ext(						//符号扩展模块，将输入的 16 位数据扩展为 32 位。
  input   [15:0]  ImmD_16,		//无符号扩展
  input   [1:0]   ExtOpD,		//扩展类型
  output  [31:0]  ImmD_32		//立即数
  );
  
  assign ImmD_32 = (ExtOpD == 2'b10) ? {ImmD_16, 16'b0} :               // lui，把一个16位的立即数填入到寄存器的高16位，低16位补零。
                   (ExtOpD == 2'b00) ? {{16{ImmD_16[15]}}, ImmD_16} :   // Sign Extend，扩展至低位
                   (ExtOpD == 2'b01) ? {16'b0, ImmD_16} :               // Zero Extend，扩展至低位,高位补零
                                       32'b0;							//复位
  
endmodule