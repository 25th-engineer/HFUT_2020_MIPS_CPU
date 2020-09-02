module BECtrl(													//位扩展，根据当前指令自行判断数据类型，
																//通过设置对应的 BEOutM 控制对 DM 的读写
  input   [1:0] ByteOffset,										//DM低二位地址
  input         IsLhShM, IsLbSbM,								//IsLhShM：LH（从存储器中读取半个字的数据到寄存器中）、SH（把半个字节的数据从寄存器存储到存储器中）
																//IsLbSbM：是否逻辑LB（从存储器中读取一个字节的数据到寄存器中）、SB（把一个字节的数据从寄存器存储到存储器中）
  output  [3:0] BEOutM											//DM字节写入控制信号
  );
  
  assign BEOutM = (!IsLhShM && !IsLbSbM) ? 4'b1111:
                  (IsLbSbM) ?
                    (
                      (ByteOffset == 2'b00) ? 4'b0001 :
                      (ByteOffset == 2'b01) ? 4'b0010 :
                      (ByteOffset == 2'b10) ? 4'b0100 :
                      (ByteOffset == 2'b11) ? 4'b1000 : 4'b0
                    ) :
                  (IsLhShM) ?
                    (
                      (ByteOffset == 2'b00) ? 4'b0011 :
                      (ByteOffset == 2'b10) ? 4'b1100 : 4'b0
                    ) : 4'b0;
  
endmodule