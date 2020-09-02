module MUX2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] d0, d1, 					//双路选择器
              input              s, 
              output [WIDTH-1:0] y);

  assign y = s ? d1 : d0; 
  
endmodule

module MUX3 #(parameter WIDTH = 32)							//三路选择器
             (input  [WIDTH-1:0] d0, d1, d2,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

  assign y = s[1] ? d2 : (s[0] ? d1 : d0); 
  
endmodule

module MUX4 #(parameter WIDTH = 32)							//四路选择器
             (input  [WIDTH-1:0] d0, d1, d2, d3,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

  assign y = s[1] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0); 
  
endmodule