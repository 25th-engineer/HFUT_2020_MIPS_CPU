module RegM(							//EX / MEM 阶段的寄存器，根据 EX 阶段时的状态改变 MEM 阶段的状态信息
										//与RegE类似
  input               clk, rst,
  input       [31:0]  PCPlus8E,
  input       [31:0]  ALUOutE,
  input       [31:0]  WriteDataE,
  input       [4:0]   RtE, WriteRegE,
  input               RegWriteE,
  input               MemWriteE,
  input               MemToRegE,
  input               IsJJalE,
  input               IsJrJalrE,
  input               IsLbSbE,
  input               IsLhShE,
  input               IsUnsignedE,
  output  reg [31:0]  PCPlus8M,
  output  reg [31:0]  ALUOutM,
  output  reg [31:0]  WriteDataM,
  output  reg [4:0]   RtM, WriteRegM,
  output  reg         RegWriteM,
  output  reg         MemWriteM,
  output  reg         MemToRegM,
  output  reg         IsJJalM,
  output  reg         IsJrJalrM,
  output  reg         IsLbSbM,
  output  reg         IsLhShM,
  output  reg         IsUnsignedM
  );
  
  initial
  begin
    PCPlus8M    <= 0;
    ALUOutM     <= 0;
    WriteDataM  <= 0;
    RtM         <= 0;
    WriteRegM   <= 0;
    RegWriteM   <= 0;
    MemWriteM   <= 0;
    MemToRegM   <= 0;
    IsJJalM     <= 0;
    IsJrJalrM   <= 0;
    IsLbSbM     <= 0;
    IsLhShM     <= 0;
    IsUnsignedM <= 0;
  end
  
  always @(posedge clk)
  begin
    if (rst)
    begin
      PCPlus8M    <= 0;
      ALUOutM     <= 0;
      WriteDataM  <= 0;
      RtM         <= 0;
      WriteRegM   <= 0;
      RegWriteM   <= 0;
      MemWriteM   <= 0;
      MemToRegM   <= 0;
      IsJJalM     <= 0;
      IsJrJalrM   <= 0;
      IsLbSbM     <= 0;
      IsLhShM     <= 0;
      IsUnsignedM <= 0;
    end
    else
    begin
      PCPlus8M    <= PCPlus8E;
      ALUOutM     <= ALUOutE;
      WriteDataM  <= WriteDataE;
      WriteRegM   <= WriteRegE;
      RegWriteM   <= RegWriteE;
      MemWriteM   <= MemWriteE;
      MemToRegM   <= MemToRegE;
      RtM         <= RtE;
      IsJJalM     <= IsJJalE;
      IsJrJalrM   <= IsJrJalrE;
      IsLbSbM     <= IsLbSbE;
      IsLhShM     <= IsLhShE;
      IsUnsignedM <= IsUnsignedE;
    end
  end
  
endmodule