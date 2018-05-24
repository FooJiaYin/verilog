module AND (a, b, out);
	input a, b;
	output out;
    
    wire nand_ab;

    nand n1(nand_ab, a, b);
    nand n2(out, nand_ab, nand_ab);

endmodule


module OR (a, b, out);
	input a, b;
	output out;

    wire nand_aa, nand_bb;

    nand n1(nand_aa, a, a);
    nand n2(nand_bb, b, b);
    nand n3(out, nand_aa, nand_bb);

endmodule

module NOT (a, out);
	input a;
	output out;

    nand n1(out, a, a);

endmodule

module NOR (a, b, out);
	input a, b;
	output out;

    wire nand_aa, nand_bb, aorb;

    nand n1(nand_aa, a, a);
    nand n2(nand_bb, b, b);
    nand n3(aorb, nand_aa, nand_bb);
    nand n4(out, aorb, aorb);

endmodule

module XOR (a, b, out);
	input a, b;
	output out;

    wire nand_aa, nand_bb, nand_bb, aorb, axnorb;

    nand n1(nand_aa, a, a);
    nand n2(nand_bb, b, b);
    nand n3(aorb, nand_aa, nand_bb);
    nand n4(nand_ab, a, b);
    nand n5(axnorb, aorb, nand_ab);
    nand n6(out, xnor, xnor);

endmodule

module fullAdder (a, b, cin, cout, s);
    input a, b, cin;
    output cout, s;

    assign s = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


module AdderSubtractor (A, B, Cin, mode, Cout, Sum);
	input [31:0] A, B;
	input Cin, mode;
	output [31:0] Sum;
	output Cout;
    wire [31:0]carry, notB;
    integer i;

    assign carry[0] = 1'b0;
	
	always@(*)begin
        for(i=0; i<32; i=i+1)begin
            case(mode)
                1'b0:begin
                    fullAdder(.a(A[i]), .b(B[i]), .cin(carry[i-1]), .cout(carry[i]), .s(Sum[i]))
                end
                1'b1:begin
                    assign notB = ~B +1;
                    fullAdder(.a(A[i]), .b(notB[i]), .cin(carry[i-1]), .cout(carry[i]), .s(Sum[i]))
                
                end
            endcase
        end
    end
endmodule



module ALU (A, B, sel, Cin, Y, Cout, Negative, Zero, Overflow);
	input [31:0] A, B;
	input [3:0] sel;
	input Cin;
	output [31:0] Y;
	output Cout, Negative, Zero, Overflow;


endmodule 