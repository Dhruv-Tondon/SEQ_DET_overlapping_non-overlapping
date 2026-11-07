`timescale 1ns / 1ps

module tb;
reg clk ,rst , in;
wire z; 
seq_det_01001_OL uut (.clk(clk),.rst(rst),.in(in),.z(z));

always #5 clk=~clk; 
initial begin 
$dumpfile ("wave.vcd");
$dumpvars (0,tb);
clk=0;
rst=0;
in=0;
#5;
rst=1;#10;rst=0;

@(negedge clk) in=0;
@(negedge clk) in=1;
@(negedge clk) in=0;
@(negedge clk) in=0;
@(negedge clk) in=1;
@(negedge clk) in=0;
@(negedge clk) in=0;
@(negedge clk) in=1;
@(negedge clk) in=0;
@(negedge clk) in=1;
@(negedge clk) in=0;
@(negedge clk) in=0;
@(negedge clk) in=1;
#10;

$finish ;




end
endmodule

