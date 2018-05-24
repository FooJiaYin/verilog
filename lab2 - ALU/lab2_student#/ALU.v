module AND (a, b, out);
	input a, b;
	output out;


endmodule


module OR (a, b, out);
	input a, b;
	output out;


endmodule

module NOT (a, out);
	input a;
	output out;


endmodule

module NOR (a, b, out);
	input a, b;
	output out;


endmodule

module XOR (a, b, out);
	input a, b;
	output out;


endmodule


module AdderSubtractor (A, B, Cin, mode, Cout, Sum);
	input [31:0] A, B;
	input Cin, mode;
	output [31:0] Sum;
	output Cout;
	
	
endmodule



module ALU (A, B, sel, Cin, Y, Cout, Negative, Zero, Overflow);
	input [31:0] A, B;
	input [3:0] sel;
	input Cin;
	output [31:0] Y;
	output Cout, Negative, Zero, Overflow;


endmodule 