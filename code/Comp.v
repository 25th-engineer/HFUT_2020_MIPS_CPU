module Comp(														//比较两个操作数
  input [31:0] A, B,												//操作数A、B
  input [2:0]  CompOpD,												//比较运算符，比较的类型
  output       CompD												//比较结果
  );
  
  assign CompD = (CompOpD == 3'b000 && A == B)          ? 1 :
                 (CompOpD == 3'b001 && A != B)          ? 1 :
                 (CompOpD == 3'b010 && $signed(A) >= 0) ? 1 :
                 (CompOpD == 3'b011 && $signed(A) > 0)  ? 1 :
                 (CompOpD == 3'b100 && $signed(A) <= 0) ? 1 :
                 (CompOpD == 3'b101 && $signed(A) < 0)  ? 1 : 0;
  
endmodule