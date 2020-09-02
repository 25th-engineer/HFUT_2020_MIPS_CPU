module NPC(												//指令自增单元
  input   [31:0]  PCPlus4D,								//PC+4 的值，但不是下一条指令的地址
  input   [25:0]  ImmD_26,								//指令的低 26 位
  input   [31:0]  ImmD_32, Reg_32,						//分支指令的偏移
  input           IsJJalD, IsJrJalrD, BranchD, CompD,	//跳转类型、分支类型 
  output  [31:0]  NPCD,									//下一条指令的地址
  output          IsJBrD								//是否跳转/分支指令
  );
  
  assign NPCD = (IsJJalD)           ? {PCPlus4D[31:28], ImmD_26, 2'b00} :
                (IsJrJalrD)         ? Reg_32 :
                (BranchD && CompD)  ? PCPlus4D + ImmD_32 : PCPlus4D + 4;
  assign IsJBrD = ((BranchD && CompD) || IsJJalD || IsJrJalrD);
  
endmodule