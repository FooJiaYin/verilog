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

    wire nand_aa, nand_ab, nand_bb, aorb, axnorb;

    nand n1(nand_aa, a, a);
    nand n2(nand_bb, b, b);
    nand n3(aorb, nand_aa, nand_bb);
    nand n4(nand_ab, a, b);
    nand n5(axnorb, aorb, nand_ab);
    nand n6(out, axnorb, axnorb);

endmodule

module NAND (a, b, out);
    input a, b;
    output out;
    nand n0(out, a, b);

endmodule

module fullAdder(a, b, cin, cout, s);
    input a, b, cin;
    output cout, s;

    assign {cout,s} = a + b + cin;

endmodule

module Adder (a, b, cin, cout, s);
    input [30:0] a, b;
    input cin;
    output [30:0] s;
    output cout;
    
    assign {cout,s} = a + b + cin;
endmodule
/*
module AdderSubtractor (A, B, Cin, mode, Cout, Sum);
	input [31:0] A, B;
	input Cin, mode;
	output [31:0] Sum;
	output Cout;
    /*wire [31:0] carry;

    assign carry[0] = Cin;
	
	always@(*)begin
        case(mode)
            1'b0:begin
                //assign Sum = (A + B) >> 1;
                //assign Cin = (A[31] + B[31]) >> 1;
                for(i=0; i<31; i=i+1) begin
                    fullAdder #(n) addBit (..a(A[i], .b(B[i]), .cin(carry[i]), .cout(carry[i+1]), .s(Sum[i]));
                end
                fullAdder addBit(..a(A[31]), .b(B[31]), .cin(carry[31]), .cout(Cout), .s(Sum[31]));
            end
            1'b1:begin
                assign notB = ~B +1;
                fullAdder subtractBit (..a(A[i]), .b(notB[i]), .cin(carry[i-1]), .cout(carry[i]), .s(Sum[i]))
            
            end
        endcase
    end*/
/*
    wire c1, c2;
    wire ovf  = c1 ^ c2;
    Adder #(31) ai(A[30:0], B[30:0]^mode, mode, c1, Sum[30:0]);
    Adder #(1) as(A[31], B[31]^mode, c1, c2, Sum[31]);

endmodule
*/
        /*for(i=0; i<16; i=i+1)begin
            #delay
            $display("time=%4d,in=%b,out_G=%b,out_D=%b,out_B=%b",$time,in,out_G,out_D,out_B);
            if((out_G!=out_D) || (out_D!=out_B) || ((in==0 || in==1 || in==2 || in==3 || in==5 || in==7 || in==8 || in==11 || in==13) && (out_G&out_D&out_B)==0) || ((in!=0 && in!=1 && in!=2 && in!=3 && in!=5 && in!=7 && in!=8 && in!=11 && in!=13) && (out_G|out_D|out_B)==1))
            begin
                $display("You got wrong answer!!");
                $finish;
            end
            in = in+1;
        end
*/



module ALU (A, B, sel, Cin, Y, Cout, Negative, Zero, Overflow);
	input [31:0] A, B;
	input [3:0] sel;
	input Cin;
	output [31:0] Y;
	output Cout, Negative, Zero, Overflow;
    reg [31:0] Y;
    wire out_AND, out_OR, out_NOT, out_NOR, out_XOR, out_NAND;

    always @(*) begin
        case(sel)
            4'b0000: 
                Y[0] = out_AND;
                Overflow = 1'b0;
            4'b0001: 
                Y[0] = out_OR;
                Overflow = 1'b0;
            4'b0010: 
                Y[0] = out_NOT;
                Overflow = 1'b0;
            4'b0011: 
                Y[0] = out_NOR;
                Overflow = 1'b0;
            4'b0100: 
                Y[0] = out_XOR;
                Overflow = 1'b0;
            4'b0101: 
                Y[0] = out_NAND;
                Overflow = 1'b0;
        endcase
    end

    AND AandB(.a(A[0]), .b(B[0]), .out(out_AND));
    OR AorB(.a(A[0]), .b(B[0]), .out(out_OR));
    NOT notA(.a(A[0]), .out(out_NOT));
    NOR AnorB(.a(A[0]), .b(B[0]), .out(out_NOR));
    XOR AxorB (.a(A[0]), .b(B[0]), .out(out_XOR));
    NAND AnandB (.a(A[0]), .b(B[0]), .out(out_NAND));
endmodule 