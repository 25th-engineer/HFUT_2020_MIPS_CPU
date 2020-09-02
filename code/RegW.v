module RegW(									//MEM / WB 阶段的寄存器，根据 MEM 阶段时的状态改变 WB 阶段的状态信息
												//与RegE类似
  input               clk, rst,
  input       [31:0]  PCPlus8M,
  input       [31:0]  ALUOutM,
  input       [31:0]  ReadDataM,
  input       [4:0]   WriteRegM,
  input               RegWriteM,
  input               MemToRegM,
  input               IsJJalM,
  input               IsJrJalrM,
  input               IsUnsignedM,
  input       [3:0]   BEOutM,
  output  reg [31:0]  PCPlus8W,
  output  reg [31:0]  ALUOutW,
  output  reg [31:0]  ReadDataW,
  output  reg [4:0]   WriteRegW,
  output  reg         RegWriteW,
  output  reg         MemToRegW,
  output  reg         IsJJalW,
  output  reg         IsJrJalrW,
  output  reg         IsUnsignedW,
  output  reg [3:0]   BEOutW
  );
  
  initial
  begin
    PCPlus8W    <= 0;
    ALUOutW     <= 0;
    ReadDataW   <= 0;
    WriteRegW   <= 0;
    RegWriteW   <= 0;
    MemToRegW   <= 0;
    IsJJalW     <= 0;
    IsJrJalrW   <= 0;
    IsUnsignedW <= 0;
    BEOutW      <= 0;
  end
  
  always @(posedge clk)
  begin
    if (rst)
    begin
      PCPlus8W    <= 0;
      ALUOutW     <= 0;
      ReadDataW   <= 0;
      WriteRegW   <= 0;
      RegWriteW   <= 0;
      MemToRegW   <= 0;
      IsJJalW     <= 0;
      IsJrJalrW   <= 0;
      IsUnsignedW <= 0;
      BEOutW      <= 0;
    end
    else
    begin
      PCPlus8W    <= PCPlus8M;
      ALUOutW     <= ALUOutM;
      ReadDataW   <= ReadDataM;
      WriteRegW   <= WriteRegM;
      RegWriteW   <= RegWriteM;
      MemToRegW   <= MemToRegM;
      IsJJalW     <= IsJJalM;
      IsJrJalrW   <= IsJrJalrM;
      IsUnsignedW <= IsUnsignedM;
      BEOutW      <= BEOutM;
    end
  end
  
endmodule