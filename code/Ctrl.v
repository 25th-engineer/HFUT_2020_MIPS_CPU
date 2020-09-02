//			控制RF,DM,PC之间的数据流动
//          ALU控制单元的顶层控制信号
//          ALU的数据来源
//          包含状态机来在多周期的不同阶段之间跳转

module Ctrl(							//主控制单元，根据操作码生成控制信号。
  input   [5:0] OpD,					//输入指令的OPCode，指定是哪种寄存器运算
  input   [5:0] FunctD,					//输入指令的FunctCode，32位指令的FunctD段
  input   [4:0] RtD,					//写回寄存器的数据流的选择信号
  output        RegWriteD,				//指令译码阶段（ID）寄存器写输出
  output        MemWriteD,				//指令译码（ID）存储器写
  output        MemToRegD,				//指令译码阶段（ID）存储器向寄存器
  output        RegDstD,				//指令译码阶段（ID）写回寄存器的地址的选择信号
  output        BranchD,				//分支指令
  output        IsJJalD,				//跳转指令
  output        IsJrJalrD,				//寄存器跳转指令
  output        IsLbSbD,
  output        IsLhShD,
  output        IsUnsignedD,
  output        HiLoWriteD,
  output        HiLoD,
  output        IsMdD,
  output        IsShamtD,
  output  [1:0] MdOpD,
  output  [3:0] ALUControlD,
  output  [1:0] ALUSrcD,
  output  [1:0] ExtOpD,
  output  [2:0] CompOpD
  );
  
  parameter 
    RType  = 6'b000000,
    LB     = 6'b100000,
    LBU    = 6'b100100,
    LH     = 6'b100001,
    LHU    = 6'b100101,
    LUI    = 6'b001111,
    LW     = 6'b100011,
    SB     = 6'b101000,
    SH     = 6'b101001,
    SW     = 6'b101011,
    BEQ    = 6'b000100,
    BNE    = 6'b000101,
    BGTZ   = 6'b000111,
    BLEZ   = 6'b000110,
    BB     = 6'b000001,
    BGEZ   = 5'b00001,
    BLTZ   = 5'b00000,
    J      = 6'b000010,
    JAL    = 6'b000011,
    JALR   = 6'b001001,
    JR     = 6'b001000,
    MFHI   = 6'b010000,
    MFLO   = 6'b010010,
    MTHI   = 6'b010001,
    MTLO   = 6'b010011,
    ADDI   = 6'b001000,
    ADDIU  = 6'b001001,
    ANDI   = 6'b001100,
    ORI    = 6'b001101,
    XORI   = 6'b001110,
    SLTI   = 6'b001010,
    SLTIU  = 6'b001011,
  
    ADD    = 6'b100000,
    ADDU   = 6'b100001,
    SUB    = 6'b100010,
    SUBU   = 6'b100011,
    SLT    = 6'b101010,
    SLTU   = 6'b101011,
    SLL    = 6'b000000,
    SLLV   = 6'b000100,
    SRL    = 6'b000010,
    SRLV   = 6'b000110,
    SRA    = 6'b000011,
    SRAV   = 6'b000111,
    AND    = 6'b100100,
    OR     = 6'b100101,
    XOR    = 6'b100110,
    NOR    = 6'b100111,
    MULT   = 6'b011000,
    MULTU  = 6'b011001,
    DIV    = 6'b011010,
    DIVU   = 6'b011011;
  
  reg [26:0] CtrlCode;
  assign {RegDstD, RegWriteD, ALUSrcD, BranchD, MemWriteD, ALUControlD, MemToRegD,   // 1, 1, 2, 1, 1, 4, 1
          ExtOpD, IsJJalD, IsJrJalrD, CompOpD, IsLbSbD, IsLhShD, IsUnsignedD,        // 2, 1, 1, 3, 1, 1, 1
          MdOpD, HiLoWriteD, HiLoD, IsMdD, IsShamtD} = CtrlCode;                     // 2, 1, 1, 1, 1
  
  always @(*)
  begin
    casex(OpD)
      LB:    CtrlCode <= 27'b1_1_01_0_0_0000_1_00_0_0_000_1_0_0_00_0_0_0_0;
      LBU:   CtrlCode <= 27'b1_1_01_0_0_0000_1_00_0_0_000_1_0_1_00_0_0_0_0;
      LH:    CtrlCode <= 27'b1_1_01_0_0_0000_1_00_0_0_000_0_1_0_00_0_0_0_0;
      LHU:   CtrlCode <= 27'b1_1_01_0_0_0000_1_00_0_0_000_0_1_1_00_0_0_0_0;
      LUI:   CtrlCode <= 27'b1_1_01_0_0_0000_0_10_0_0_000_0_0_0_00_0_0_0_0;
      LW:    CtrlCode <= 27'b1_1_01_0_0_0000_1_00_0_0_000_0_0_0_00_0_0_0_0;
      SB:    CtrlCode <= 27'b0_0_01_0_1_0000_0_00_0_0_000_1_0_0_00_0_0_0_0;
      SH:    CtrlCode <= 27'b0_0_01_0_1_0000_0_00_0_0_000_0_1_0_00_0_0_0_0;
      SW:    CtrlCode <= 27'b0_0_01_0_1_0000_0_00_0_0_000_0_0_0_00_0_0_0_0;
      BEQ:   CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_000_0_0_0_00_0_0_0_0;
      BNE:   CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_001_0_0_0_00_0_0_0_0;
      BGTZ:  CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_011_0_0_0_00_0_0_0_0;
      BLEZ:  CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_100_0_0_0_00_0_0_0_0;
      BB:
      begin
          casex(RtD)
              BGEZ:    CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_010_0_0_0_00_0_0_0_0;
              BLTZ:    CtrlCode <= 27'b0_0_00_1_0_0000_0_00_0_0_101_0_0_0_00_0_0_0_0;
              default: CtrlCode <= 27'b0;
          endcase
      end
      J:     CtrlCode <= 27'b0_0_00_0_0_0000_0_00_1_0_000_0_0_0_00_0_0_0_0;
      JAL:   CtrlCode <= 27'b0_1_00_0_0_0000_0_00_1_0_000_0_0_0_00_0_0_0_0;
      
      ADDI:  CtrlCode <= 27'b1_1_01_0_0_0001_0_00_0_0_000_0_0_0_00_0_0_0_0;
      ADDIU: CtrlCode <= 27'b1_1_01_0_0_0000_0_01_0_0_000_0_0_0_00_0_0_0_0;
      ANDI:  CtrlCode <= 27'b1_1_01_0_0_1100_0_01_0_0_000_0_0_0_00_0_0_0_0;
      ORI:   CtrlCode <= 27'b1_1_01_0_0_1101_0_01_0_0_000_0_0_0_00_0_0_0_0;
      XORI:  CtrlCode <= 27'b1_1_01_0_0_1110_0_01_0_0_000_0_0_0_00_0_0_0_0;
      SLTI:  CtrlCode <= 27'b1_1_01_0_0_0101_0_00_0_0_000_0_0_0_00_0_0_0_0;
      SLTIU: CtrlCode <= 27'b1_1_01_0_0_0100_0_01_0_0_000_0_0_0_00_0_0_0_0;

      RType:
      begin
          casex(FunctD)
              ADD:   CtrlCode <= 27'b0_1_00_0_0_0001_0_00_0_0_000_0_0_0_00_0_0_0_0;
              ADDU:  CtrlCode <= 27'b0_1_00_0_0_0000_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SUB:   CtrlCode <= 27'b0_1_00_0_0_0011_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SUBU:  CtrlCode <= 27'b0_1_00_0_0_0010_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SLT:   CtrlCode <= 27'b0_1_00_0_0_0101_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SLTU:  CtrlCode <= 27'b0_1_00_0_0_0100_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SLL:   CtrlCode <= 27'b0_1_00_0_0_0110_0_00_0_0_000_0_0_0_00_0_0_0_1;
              SLLV:  CtrlCode <= 27'b0_1_00_0_0_0111_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SRL:   CtrlCode <= 27'b0_1_00_0_0_1000_0_00_0_0_000_0_0_0_00_0_0_0_1;
              SRLV:  CtrlCode <= 27'b0_1_00_0_0_1001_0_00_0_0_000_0_0_0_00_0_0_0_0;
              SRA:   CtrlCode <= 27'b0_1_00_0_0_1010_0_00_0_0_000_0_0_0_00_0_0_0_1;
              SRAV:  CtrlCode <= 27'b0_1_00_0_0_1011_0_00_0_0_000_0_0_0_00_0_0_0_0;
              AND:   CtrlCode <= 27'b0_1_00_0_0_1100_0_00_0_0_000_0_0_0_00_0_0_0_0;
              OR:    CtrlCode <= 27'b0_1_00_0_0_1101_0_00_0_0_000_0_0_0_00_0_0_0_0;
              XOR:   CtrlCode <= 27'b0_1_00_0_0_1110_0_00_0_0_000_0_0_0_00_0_0_0_0;
              NOR:   CtrlCode <= 27'b0_1_00_0_0_1111_0_00_0_0_000_0_0_0_00_0_0_0_0;
              MULT:  CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_01_0_0_1_0;
              MULTU: CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_00_0_0_1_0;
              DIV:   CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_11_0_0_1_0;
              DIVU:  CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_10_0_0_1_0;
    
              JALR:  CtrlCode <= 27'b0_1_00_0_0_0000_0_00_0_1_000_0_0_0_00_0_0_0_0;
              JR:    CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_1_000_0_0_0_00_0_0_0_0;
              MFHI:  CtrlCode <= 27'b0_1_11_0_0_0000_0_00_0_0_000_0_0_0_00_0_0_1_0;
              MFLO:  CtrlCode <= 27'b0_1_10_0_0_0000_0_00_0_0_000_0_0_0_00_0_0_1_0;
              MTHI:  CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_00_1_1_1_0;
              MTLO:  CtrlCode <= 27'b0_0_00_0_0_0000_0_00_0_0_000_0_0_0_00_1_0_1_0;
              default:CtrlCode <= 27'b0;
          endcase
      end
      default:CtrlCode <= 27'b0;
        endcase
    end
    
endmodule