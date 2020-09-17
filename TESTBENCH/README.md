<font size=4 face=宋体>&emsp;&emsp;有些汇编程序可能重复了（当时测试时就是从另一个文件复制到另一个重命名的文件），请注意甄别。<br>
&emsp;&emsp;除了``testbench-lhx.data``以为的``.data``文件都是使用``MARS 4.5``打开同名的``.s``汇编源程序，再导出对应的十六进制机器码再另存文件得来。<br>
&emsp;&emsp;在使用``MARS 4.5``对``testbench-lhx.s``进行编译时出现了错误（估计是目标机器[CPU型号]的问题），我先在Windows上借助《自己动手写CPU》配套的工具``CodeSourcery(Sourcery-CodeBench-Lite-for-MIPS-ELF)``生成了相应的``testbench-lhx.bin``文件，而后将``testbench-lhx.bin``复制到Ubuntu 18.04中，使用``Bin2Mem.exe``将其转换为``testbench-lhx.data``。<br>
&emsp;&emsp;``testbench-lhx.s``是我之前从室友那里要来的，他说他在使用Windows 10下的``CodeSourcery(Sourcery-CodeBench-Lite-for-MIPS-ELF)``配套工具生成汇编程序的机器码时，发现有两条指令的机器码是错的（具体是哪两条我忘了，如果回头问到了再补充）。个人建议：别直接用``testbench-lhx.data``来进行测试；可以使用其他工具将``testbench-lhx.s``一次性转换为对应的十六进制（或二进制）机器码，而不是像我这样投机取巧。
</font>