module DMExt(								//对load出数据扩展，从DM读一个32 bit数据，进行符号位扩展后写回rd
  input   [31:0]  ReadDataW,				//读取即将写的32位数据
  input   [3:0]   BEOutW,					//指定读取数据
  input           IsUnsignedW,				//是否无符号数
  output  [31:0]  DMExtOutW					//扩展后的32位数
  );
  
  assign DMExtOutW = (IsUnsignedW) ?
                     (
                       (BEOutW == 4'b0001) ? {24'b0, ReadDataW[7:0]}   :
                       (BEOutW == 4'b0010) ? {24'b0, ReadDataW[15:8]}  :
                       (BEOutW == 4'b0100) ? {24'b0, ReadDataW[23:16]} :
                       (BEOutW == 4'b1000) ? {24'b0, ReadDataW[31:24]} :
                       (BEOutW == 4'b0011) ? {16'b0, ReadDataW[15:0]}  :
                       (BEOutW == 4'b1100) ? {16'b0, ReadDataW[31:16]} :
                       (BEOutW == 4'b1111) ? ReadDataW                 : 32'b0
                     ) :
                     (
                       (BEOutW == 4'b0001) ? {{24{ReadDataW[7]}}, ReadDataW[7:0]}    :		//非无符号数，符号扩展
                       (BEOutW == 4'b0010) ? {{24{ReadDataW[15]}}, ReadDataW[15:8]}  :
                       (BEOutW == 4'b0100) ? {{24{ReadDataW[23]}}, ReadDataW[23:16]} :
                       (BEOutW == 4'b1000) ? {{24{ReadDataW[31]}}, ReadDataW[31:24]} :
                       (BEOutW == 4'b0011) ? {{24{ReadDataW[15]}}, ReadDataW[15:0]}  :
                       (BEOutW == 4'b1100) ? {{24{ReadDataW[31]}}, ReadDataW[31:16]} :
                       (BEOutW == 4'b1111) ? ReadDataW                               : 32'b0
                     );
  
endmodule