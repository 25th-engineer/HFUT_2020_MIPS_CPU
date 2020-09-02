module MIPS_TB;
  
  reg clk, rst;
  
  MIPS MIPS(clk, rst);
  wire        BranchD, CompD, StallF, StallD, FlushE;
  wire        RegWriteD, MemWriteD, MemToRegD, RegDstD, RegWriteW;
  wire        RegWriteE, RegDstE, MemWriteE, MemToRegE, StartD, StartE;
  wire        RegWriteM, MemWriteM, MemToRegM, MemToRegW, IsJrJalrD;
  wire        IsMdD, BusyE, IsJJalM, IsJrJalrM, ForwardM, IsJBrD, IsJJalD;
  wire        IsLbSbD, IsLhShD, IsUnsignedD, HiLoWriteD, HiLoD, IsShamtD, IsShamtE;
  wire        IsJJalE, IsJrJalrE, IsLbSbE, IsLhShE, IsUnsignedE, HiLoWriteE, HiLoE;
  wire        IsLbSbM, IsLhShM, IsUnsignedM, IsJJalW, IsJrJalrW, IsUnsignedW;
  wire [1:0]  ALUSrcD, ALUSrcE, ForwardAD, ForwardBD, ForwardAE, ForwardBE, MdOpD, MdOpE, ExtOpD;
  wire [2:0]  CompOpD;
  wire [3:0]  ALUControlD, ALUControlE, BEOutM, BEOutW;
  wire [4:0]  RsD, RtD, RdD, WriteRegW, RsE, RtE, RdE, RtM, ShamtD, ShamtE;
  wire [4:0]  WriteRegE, WriteReg2E, WriteRegM;
  wire [5:0]  OpD, FunctD;
  wire [31:0] NPCD, PCPlus4F, PCF, PCPlus4D, PCPlus8M, PCPlus8E, PCPlus8W, Result1W;
  wire [31:0] InstrF, InstrD, ResultW, SrcAD, SrcBD, ALUOutM, SrcA2D, SrcB2D, ImmD, ImmE;
  wire [31:0] SrcA2E, SrcB2E, SrcA3E, SrcB3E, ALUOutE, WriteDataM, ReadDataM;
  wire [31:0] ALUOutW, ReadDataW, WriteData2M, SrcA4E, SrcB4E, Lo, Hi, ReadDataExtW;
  
  // Hazard
  Hazard Hazard(OpD, RsD, RtD, RsE, RtE, RtM, WriteReg2E, WriteRegM, WriteRegW,
                ALUSrcD, IsJrJalrD, BranchD, IsMdD, BusyE, IsJJalM, IsJrJalrM,
                MemToRegE, MemToRegM, MemWriteM, RegWriteE, RegWriteM, RegWriteW,
                StallF, StallD, FlushE, ForwardAD, ForwardBD, ForwardAE, ForwardBE, ForwardM);
  
  // IF
  PC PC(clk, rst, !StallF, IsJBrD, NPCD, PCPlus4F, PCF);
  IM_2k IM(PCF[10:2], InstrF);
  
  // ID
  assign OpD    = InstrD[31:26];
  assign FunctD = InstrD[5:0];
  assign RsD    = InstrD[25:21];
  assign RtD    = InstrD[20:16];
  assign RdD    = InstrD[15:11];
  assign ShamtD = InstrD[10:6];
  RegD RegD(clk, rst, !StallD, InstrF, PCPlus4F, InstrD, PCPlus4D);
  Ctrl Ctrl(OpD, FunctD, RtD, RegWriteD, MemWriteD, MemToRegD, RegDstD, BranchD,
            IsJJalD, IsJrJalrD, IsLbSbD, IsLhShD, IsUnsignedD, HiLoWriteD, HiLoD,
            IsMdD, IsShamtD, MdOpD, ALUControlD, ALUSrcD, ExtOpD, CompOpD);
  RegFile RegFile(clk, rst, RegWriteW, RsD, RtD, WriteRegW, ResultW, SrcAD, SrcBD);
  MUX4 #(32) ForwardSrcAMUX(SrcAD, ALUOutM, ResultW, PCPlus8M, ForwardAD, SrcA2D);
  MUX3 #(32) ForwardSrcBMUX(SrcBD, ALUOutM, ResultW, ForwardBD, SrcB2D);
  Comp Comp(SrcA2D, SrcB2D, CompOpD, CompD);
  Ext Ext(InstrD[15:0], ExtOpD, ImmD);
  NPC NPC(PCPlus4D, InstrD[25:0], {ImmD[29:0], 2'b00}, SrcA2D, IsJJalD,
          IsJrJalrD, BranchD, CompD, NPCD, IsJBrD);
  StartCtrl StartCtrl(InstrD, BusyE, StartD);
  
  // EX
  RegE RegE(clk, rst, FlushE, PCPlus4D + 4, SrcA2D, SrcB2D, RsD, RtD, RdD, ShamtD, ImmD,
            RegWriteD, RegDstD, MemWriteD, MemToRegD, ALUControlD, ALUSrcD, StartD, IsJJalD,
            IsJrJalrD, IsLbSbD, IsLhShD, IsUnsignedD, HiLoWriteD, HiLoD, IsShamtD, MdOpD,
            PCPlus8E, SrcA2E, SrcB2E, RsE, RtE, RdE, ShamtE, ImmE, RegWriteE, RegDstE, MemWriteE, MemToRegE,
            ALUControlE, ALUSrcE, StartE, IsJJalE, IsJrJalrE, IsLbSbE, IsLhShE, IsUnsignedE,
            HiLoWriteE, HiLoE, IsShamtE, MdOpE);
  MUX3 #(32) ForwardAEMUX(SrcA2E, ALUOutM, ResultW, ForwardAE, SrcA3E);
  MUX2 #(32) ShamtMUX(SrcA3E, {27'b0, ShamtE}, IsShamtE, SrcA4E);
  MUX3 #(32) ForwardBEMUX(SrcB2E, ALUOutM, ResultW, ForwardBE, SrcB3E);
  MUX4 #(32) ALUSrcBMUX(SrcB3E, ImmE, Lo, Hi, ALUSrcE, SrcB4E);
  ALU ALU(SrcA4E, SrcB4E, ALUControlE, ALUOutE);
  MD MD(clk, rst, SrcA4E, SrcB4E, HiLoWriteE, HiLoE, StartE, MdOpE, BusyE, Hi, Lo);
  MUX2 #(5) WriteRegMUX(RdE, RtE, RegDstE, WriteRegE);
  MUX2 #(5) JJalMux(WriteRegE, 5'b11111, IsJJalE, WriteReg2E);
  
  // MEM
  RegM RegM(clk, rst, PCPlus8E, ALUOutE, SrcB3E, RtE, WriteReg2E, RegWriteE, MemWriteE, MemToRegE,
            IsJJalE, IsJrJalrE, IsLbSbE, IsLhShE, IsUnsignedE,
            PCPlus8M, ALUOutM, WriteDataM, RtM, WriteRegM, RegWriteM, MemWriteM, MemToRegM,
            IsJJalM, IsJrJalrM, IsLbSbM, IsLhShM, IsUnsignedM);
  BECtrl BECtrl(ALUOutM[1:0], IsLhShM, IsLbSbM, BEOutM);
  MUX2 #(32) ForwardMMUX(WriteDataM, ResultW, ForwardM, WriteData2M);
  DM_4k DM(ALUOutM[11:2], WriteData2M, clk, MemWriteM, BEOutM, ReadDataM);
  
  // WB
  RegW RegW(clk, rst, PCPlus8M, ALUOutM, ReadDataM, WriteRegM, RegWriteM, MemToRegM,
            IsJJalM, IsJrJalrM, IsUnsignedM, BEOutM,
            PCPlus8W, ALUOutW, ReadDataW, WriteRegW, RegWriteW, MemToRegW,
            IsJJalW, IsJrJalrW, IsUnsignedW, BEOutW);
  DMExt DMExt(ReadDataW, BEOutW, IsUnsignedW, ReadDataExtW);
  MUX2 #(32) MemToRegMUX(ALUOutW, ReadDataExtW, MemToRegW, Result1W);
  MUX2 #(32) IsJMUX(Result1W, PCPlus8W, IsJJalW || IsJrJalrW, ResultW);
  
  initial
  begin
    clk = 1'b0;
    rst = 1;
    #5 rst = 0;
  end
  
  always
  begin
    #2 clk = !clk;
	//#5 rst = ~rst;
  end
  
endmodule