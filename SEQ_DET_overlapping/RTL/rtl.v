`timescale 1ns / 1ps

module seq_det_01001_OL(input clk,rst,in,
output reg z);
reg [2:0]state, n_state;
localparam s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;

always @(posedge clk)begin
if (rst) state<=s0;
else state<=n_state;
end

always @(*)begin
case(state)
s0: n_state = in?s0:s1;
s1: n_state = in?s2:s1;
s2: n_state = in?s0:s3;
s3: n_state = in?s2:s4;
s4: n_state = in?s0:s1;
default : n_state = s0;
endcase
end

always @(*)begin
if (state==s4 && in==1) z=1;
else z=0;
end

endmodule

