module StartCtrl(				//根据ID阶段的指令判断是否开启控制模块
  input [31:0] InstrD,			//ID阶段读入的指令
  input        BusyE,			//指示是否忙
  output       StartD			//是否启动控制模块
  );
  
  parameter
    RType = 6'b000000,			//0：寄存器类型的指令，对两个寄存器进行操作，输出结果放入第三个寄存器
    MULT  = 6'b011000,			//24：两个定点（有符号）寄存器的内容相乘
    MULTU = 6'b011001,			//25：两个定点（无符号）寄存器的内容相乘
    DIV   = 6'b011010,			//26：两个定点（有符号）寄存器的内容相除
    DIVU  = 6'b011011;			//27：两个定点（无符号）寄存器的内容相除
  
  assign StartD = (BusyE) ? 0 :
                  (
                    (InstrD[31:26] == RType &&
                      (InstrD[5:0] == MULT || InstrD[5:0] == MULTU ||
                       InstrD[5:0] == DIV  || InstrD[5:0] == DIVU)
                    ) ? 1 : 0
                  );
  
endmodule