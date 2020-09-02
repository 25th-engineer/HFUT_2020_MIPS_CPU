module RegD(								//IF/ID阶段的寄存器，根据IF的指令与PC确定ID时其对应值
  input               clk, rst, En,
  input       [31:0]  InstrF, PCPlus4F,		//IF（取指令）周期 时的指令 / 下一条指令的PC处
  output  reg [31:0]  InstrD, PCPlus4D		//ID（指令译码）周期 时的指令 / 下一条指令的PC处
  );
  
  initial
  begin
    InstrD <= 0;
    PCPlus4D <= 0;
  end
  
  always @(posedge clk)
    if (rst)
    begin
      InstrD <= 0;
      PCPlus4D <= 0;
    end
    else if (En)
    begin
      InstrD <= InstrF;
      PCPlus4D <= PCPlus4F;
    end
    else
    begin
      InstrD <= InstrD;
      PCPlus4D <= PCPlus4D;
    end
  
endmodule