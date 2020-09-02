module Hazard(											//检测冲突
														//
	/*
	取指令周期（IF）

	指令译码/读寄存器周期（ID）

	执行/有效地址计算周期（EX）

	存储器访问／分支完成周期（MEM）

	写回周期（WB）
	*/
	
//Defining module for Hazard detection Unit
//It detects RAW hazard related to Load and also responsible for 
//generating stalls of 1 cycle for RAW(Load---instruction) and 
//2 cycles when a branch instruction is found
//It is also responsible for changing the PC POINTER to the JUMP address
	
	
	
	
  input   [5:0] OpD,								//读寄存器周期时的操作数
  input   [4:0] RsD, RtD, RsE, RtE, RtM,			//ID / EX 阶段的地址
  input   [4:0] WriteRegE, WriteRegM, WriteRegW,	//EX / MEM / WB 阶段的地址
  input   [1:0] ALUSrcD,
  input         IsJrJalrD, BranchD, IsMdD, BusyE,
  input         IsJJalM, IsJrJalrM,
  input         MemToRegE, MemToRegM, MemWriteM,
  input         RegWriteE, RegWriteM, RegWriteW,
  output        StallF, StallD, FlushE,         //StallF：IF阶段访存阶段是否暂停，StallD：ID阶段访存阶段是否暂停，FlushE:是否清除流水线
  output  [1:0] ForwardAD, ForwardBD, ForwardAE, ForwardBE,		//均为：转发 MUX 控制信号
  output        ForwardM
  );
  
  parameter 
    BEQ   = 6'b000100,
    BNE   = 6'b000101,
    RType = 6'b000000;
  
  /*internal signals*/
  wire UseRsD, UseRtD, UseRsE, UseRtE;
  
  assign UseRsD = IsJrJalrD || BranchD;
  assign UseRtD = (OpD == BEQ) || (OpD == BNE);
  assign UseRsE = (OpD == RType) || (ALUSrcD == 2'b01);
  assign UseRtE = OpD == RType;
  
  assign StallF = FlushE;
  assign StallD = FlushE;
  
  /*create compare logic*/
  
  assign FlushE = (UseRsD && (((RsD == WriteRegE) && RegWriteE) || ((RsD == WriteRegM) && MemToRegM))) ||
                  (UseRtD && (((RtD == WriteRegE) && RegWriteE) || ((RtD == WriteRegM) && MemToRegM))) ||
                  (UseRsE && (RsD == WriteRegE) && MemToRegE) ||
                  (UseRtE && (RtD == WriteRegE) && MemToRegE) ||
                  (IsMdD && BusyE);				//流水线暂停
  
  assign ForwardAD = ((RsD == WriteRegM) && RegWriteM && (IsJJalM || IsJrJalrM) && (WriteRegM != 5'b00000)) ? 2'b11 :
                     ((RsD == WriteRegM) && RegWriteM && (WriteRegM != 5'b00000)) ? 2'b01 :
                     ((RsD == WriteRegW) && RegWriteW && (WriteRegW != 5'b00000)) ? 2'b10 : 2'b00 ;
  assign ForwardBD = ((RtD == WriteRegM) && RegWriteM && (WriteRegM != 5'b00000)) ? 2'b01 :
                     ((RtD == WriteRegW) && RegWriteW && (WriteRegW != 5'b00000)) ? 2'b10 : 2'b00 ;
  assign ForwardAE = ((RsE == WriteRegM) && RegWriteM && (WriteRegM != 5'b00000)) ? 2'b01 :
                     ((RsE == WriteRegW) && RegWriteW && (WriteRegW != 5'b00000)) ? 2'b10 : 2'b00 ;
  assign ForwardBE = ((RtE == WriteRegM) && RegWriteM && (WriteRegM != 5'b00000)) ? 2'b01 :
                     ((RtE == WriteRegW) && RegWriteW && (WriteRegW != 5'b00000)) ? 2'b10 : 2'b00 ;
  assign ForwardM  = ((RtM == WriteRegW) && RegWriteW && (WriteRegW != 5'b00000)) ? 1 : 0;
  
endmodule