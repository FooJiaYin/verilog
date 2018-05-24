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

    wire not_a, not_b;

    nand n1(not_a, a, a);
    nand n2(not_b, b, b);
    nand n3(out, not_a, not_b);

endmodule

module NOT (a, out);
	input a;
	output out;

    nand n1(out, a, a);

endmodule

module NOR (a, b, out);
	input a, b;
	output out;

    wire not_a, not_b, or_ab;

    nand n1(not_a, a, a);
    nand n2(not_b, b, b);
    nand n3(or_ab, not_a, not_b);
    nand n4(out, or_ab, or_ab);

endmodule

module XOR (a, b, out);
	input a, b;
	output out;

    wire not_a, nand_ab, not_b, or_ab, xnor_ab;

    nand n1(not_a, a, a);
    nand n2(not_b, b, b);
    nand n3(or_ab, not_a, not_b);
    nand n4(nand_ab, a, b);
    nand n5(xnor_ab, or_ab, nand_ab);
    nand n6(out, xnor_ab, xnor_ab);

endmodule

/*
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
    
    wire [30:0] Xor = a ^ b;
    wire [30:0] ab = a & b;
    wire [31:0] carry = {(ab | Xor & carry[30:0]), cin};
    wire [30:0] s = Xor ^ carry[30:0];
    assign cout = carry[31];

endmodule
*/
module AdderSubtractor (A, B, Cin, mode, Cout, Sum);
	input [31:0] A, B;
	input Cin, mode;
	output [31:0] Sum;
	output Cout;
    //assign {Cout, Sum[31]} = A[31] + (B[31]^mode) + carry[31];
    wire [31:0] carry = {(A[30:0] & (B[30:0]^{31{mode}})) | (A[30:0] & carry[30:0]) | ((B[30:0]^{31{mode}}) & carry[30:0]), Cin};
    assign Sum[31:0] =  A[31:0] ^ (B[31:0]^{32{mode}}) ^ carry[31:0];
    assign Cout = (A[31] & (B[31]^mode)) | ((B[31]^mode) & carry[31]) | (carry[31] & A[31]);
    //assign Sum[31] = A[31] ^ (B[31]^mode) ^ carry[31];
    // Adder ai(A[30:0], B[30:0]^mode, Cin, c1, Sum[30:0]);
    //Adder as(A[31], B[31]^mode, c1, c2, Sum[31]);

endmodule

/*
module Multiplier (A, B, Cout, Product);
    input [15:0] A, B;
    output [32:0] Product;
    output Cout;

    //assign Product = (A[15:0] & {16{B[0]}}) + 
    assign Product = A * B;    
    assign Cout = 1'b0;
    
endmodule
*/

module ALU (A, B, sel, Cin, Y, Cout, Negative, Zero, Overflow);
	input [31:0] A, B;
	input [3:0] sel;
	input Cin;
	output [31:0] Y;
	output Cout, Negative, Zero, Overflow;
    reg [31:0] Y;
    reg Cout, Negative, Zero, Overflow;
    wire [31:0] Sum;
    wire out_AND, out_OR, out_NOT, out_NOR, out_XOR, out_NAND, Cout_add;

    always @(*) begin
        case(sel)
            4'b0000:begin 
                Y = {31'b0, out_AND}; 
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];	//
            end
            4'b0001:begin
                Y = {31'b0, out_OR};
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];		
            end
            4'b0010:begin
                Y = {31'b0, out_NOT};
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];		
            end
            4'b0011:begin
                Y = {31'b0, out_NOR};
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];		
            end
            4'b0100:begin
                Y = {31'b0, out_XOR};
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];		
            end
            4'b0101:begin
                Y = {31'b0, out_NAND};
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = ~Y[0];		
            end
            4'b0110:begin
                Y = Sum;
                Negative = Y[31];
                Cout = Cout_add;
                Overflow = (!(B[31]^A[31])) & (A[31]^Y[31]);
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;	
            end
            4'b0111:begin
                Y = Sum;
                Negative = Y[31];
                Cout = 1'b0;
                Overflow = (!(!B[31]^A[31])) & (A[31]^Y[31]);
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1000:begin
                Y = (Sum[31] == 0) ? Sum: ~Sum + 1;
                Negative = Y[31];
                Cout = 1'b0;
                Overflow = (!(!B[31]^A[31])) & (A[31]^Sum[31]);
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1001:begin
                Y = A * B;
                Negative = Y[31];
                Cout = 1'b0;
                Overflow = A[15] ^ B[15] ^ Y[31];
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1010:begin
                Y = A << 1'b1;
                //Y = {A[30:0], 1'b0};
                Negative = Y[31];
                Cout = A[31];
                Overflow = Y[31] ^ A[31];
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1011:begin
                Y = A <<< 1'b1;
                //Y = {A[30:0], 1'b0};
                Negative = Y[31];
                Cout = A[31];
                Overflow = Y[31] ^ A[31];
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1100:begin
                Y = A >> 1'b1;
                //Y = {1'b0, A[31:1]};
                Negative = Y[31];
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            4'b1101:begin
                Y = $signed(A) >>> 1'b1;
                //Y = {A[31], A[31:1]};
                Negative = Y[31];
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = (Y == 32'b0) ? 1'b1 : 1'b0;
            end
            default:begin
                Y =32'b0;
                Negative = 1'b0;
                Cout = 1'b0;
                Overflow = 1'b0;
                Zero = 1'b0;
            end
        endcase
    end

    AND AandB   (.a(A[0]), .b(B[0]), .out(out_AND));
    OR  AorB    (.a(A[0]), .b(B[0]), .out(out_OR));
    NOT notA    (.a(A[0]), .out(out_NOT));
    NOR AnorB   (.a(A[0]), .b(B[0]), .out(out_NOR));
    XOR AxorB   (.a(A[0]), .b(B[0]), .out(out_XOR));
    nand AnandB (out_NAND, A[0], B[0]);
    //NAND AnandB (.a(A[0]), .b(B[0]), .out(out_NAND));
    AdderSubtractor Add (.A(A[31:0]), .B(B[31:0]), .Cin(sel[0]|sel[3]|Cin), .mode(sel[0]|sel[3]), .Cout(Cout_add), .Sum(Sum));
    //Multiplier Multiply (.A(A[15:0]), .B(B[15:0]), .Product(Product));

endmodule 