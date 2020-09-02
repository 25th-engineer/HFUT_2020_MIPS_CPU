module RegE(										//ID / EX阶段的寄存器，根据ID阶段时的状态改变EX阶段的状态信息
  input               clk, rst,
  input               FlushE,						//ID阶段后EX阶段是否清除流水线信号
  input       [31:0]  PCPlus4D,						//ID阶段PC的下一值
  input       [31:0]  SrcA2D, SrcB2D,				//ID阶段的操作数
  input       [4:0]   RsD, RtD, RdD, ShamtD,		//
  input       [31:0]  ImmD,							//ID阶段的立即数
  input               RegWriteD, RegDstD,			//ID阶段寄存器写输入，写入寄存器的地址的选择信号
  input               MemWriteD, MemToRegD,			//ID阶段寄存器写输入，ID阶段存储器向寄存器写入的信号
  input       [3:0]   ALUControlD,					//ID阶段算术或逻辑指令操作符
  input       [1:0]   ALUSrcD,
  input               StartD,
  input               IsJJalD,						//ID阶段是否J跳转、JAL跳转
  input               IsJrJalrD,					//ID阶段是否JR、JALR跳转
  input               IsLbSbD,
  input               IsLhShD,
  input               IsUnsignedD,
  input               HiLoWriteD,					//ID阶段写入HI/LO寄存器的信息
  input               HiLoD,
  input               IsShamtD,
  input       [1:0]   MdOpD,
  output  reg [31:0]  PCPlus8E,
  output  reg [31:0]  SrcA2E, SrcB2E,
  output  reg [4:0]   RsE, RtE, RdE, ShamtE,
  output  reg [31:0]  ImmE,
  output  reg         RegWriteE, RegDstE,
  output  reg         MemWriteE, MemToRegE,
  output  reg [3:0]   ALUControlE,
  output  reg [1:0]   ALUSrcE,
  output  reg         StartE,
  output  reg         IsJJalE,
  output  reg         IsJrJalrE,
  output  reg         IsLbSbE,
  output  reg         IsLhShE,
  output  reg         IsUnsignedE,
  output  reg         HiLoWriteE,
  output  reg         HiLoE,
  output  reg         IsShamtE,
  output  reg [1:0]   MdOpE
  );
  
  initial
  begin
    PCPlus8E    <= 0;
    SrcA2E       <= 0;
    SrcB2E       <= 0;
    RsE         <= 0;
    RtE         <= 0;
    RdE         <= 0;
    ShamtE      <= 0;
    ImmE        <= 0;
    RegWriteE   <= 0;
    RegDstE     <= 0;
    MemWriteE   <= 0;
    MemToRegE   <= 0;
    ALUControlE <= 0;
    ALUSrcE     <= 0;
    StartE      <= 0;
    IsJJalE     <= 0;
    IsJrJalrE   <= 0;
    IsLbSbE     <= 0;
    IsLhShE     <= 0;
    IsUnsignedE <= 0;
    HiLoWriteE  <= 0;
    HiLoE       <= 0;
    IsShamtE    <= 0;
    MdOpE       <= 0;
  end
  
  always @(posedge clk)
  begin
    if (FlushE || rst)
    begin
      PCPlus8E    <= 0;
      SrcA2E       <= 0;
      SrcB2E       <= 0;
      RsE         <= 0;
      RtE         <= 0;
      RdE         <= 0;
      ShamtE      <= 0;
      ImmE        <= 0;
      RegWriteE   <= 0;
      RegDstE     <= 0;
      MemWriteE   <= 0;
      MemToRegE   <= 0;
      ALUControlE <= 0;
      ALUSrcE     <= 0;
      StartE      <= 0;
      IsJJalE     <= 0;
      IsJrJalrE   <= 0;
      IsLbSbE     <= 0;
      IsLhShE     <= 0;
      IsUnsignedE <= 0;
      HiLoWriteE  <= 0;
      HiLoE       <= 0;
      IsShamtE    <= 0;
      MdOpE       <= 0;
    end
    else
    begin
      PCPlus8E    <= PCPlus4D;
      SrcA2E       <= SrcA2D;
      SrcB2E       <= SrcB2D;
      RsE         <= RsD;
      RtE         <= RtD;
      RdE         <= RdD;
      ShamtE      <= ShamtD;
      ImmE        <= ImmD;
      RegWriteE   <= RegWriteD;
      RegDstE     <= RegDstD;
      MemWriteE   <= MemWriteD;
      MemToRegE   <= MemToRegD;
      ALUControlE <= ALUControlD;
      ALUSrcE     <= ALUSrcD;
      StartE      <= StartD;
      IsJJalE     <= IsJJalD;
      IsJrJalrE   <= IsJrJalrD;
      IsLbSbE     <= IsLbSbD;
      IsLhShE     <= IsLhShD;
      IsUnsignedE <= IsUnsignedD;
      HiLoWriteE  <= HiLoWriteD;
      HiLoE       <= HiLoD;
      IsShamtE    <= IsShamtD;
      MdOpE       <= MdOpD;
    end
  end
  
endmodule