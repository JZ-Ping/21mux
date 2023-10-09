// Top-Level design module

module my21mux(sel, in0, in1, y);
input sel, in0, in1;
output y;

and inst1(o1, sel,in0);
not negat(cond,sel);
and inst2(o2, cond, in1);
or inst3(y,o1, o2);

// structural verilog 21mux //
//go back to tutorial for tips on connecting and creating gates//
endmodule

module my7bit21mux(sel, in0, in1, y);
input sel;
input [6:0] in0, in1;
output [6:0] y;
my21mux inst1[6:0](sel, in0, in1, y);
endmodule

module SEL(sel, in0, in1,LEDR, HEX0 );
input [3:0] sel;
input [6:0] in0, in1;
output [6:0] LEDR;
output [6:0] HEX0;
wire [6:0]temp;

my7bit21mux inst1(~sel[3], in0, in1, temp); //compensate for active low KEY3
assign LEDR = temp;
assign HEX0 = ~temp;


endmodule

module Lab1(KEY, SW, LEDR, HEX0);
input [3:0] KEY;
input [17:0] SW;
output [6:0] LEDR;
output [6:0] HEX0;
SEL inst1(KEY, SW[16:10], SW[6:0], LEDR, HEX0);
endmodule

