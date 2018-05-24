module fop_G(in, out);
    parameter n = 4;

    input[n-1:0]in;
    output out;

    wire and0, and1, and2, and3, and4;
    wire not0_2, not0_1, not0_0, not1_1, not2_2, not3_3, not3_2, not4_3;

    not not_0_1(not0_1,in[1]);
    not not_0_2(not0_2,in[2]);
    not not_0_0(not0_0,in[0]);
    not not_1_1(not1_1,in[1]);
    not not_2_2(not2_2,in[2]);
    not not_3_3(not3_3,in[3]);
    not not_3_2(not3_2,in[2]);
    not not_4_3(not4_3,in[3]);

    and and_0(and0,not0_2,not0_1,not0_0);
    and and_1(and1,in[2],not1_1,in[0]);
    and and_2(and2,not2_2,in[1],in[0]);
    and and_3(and3,not3_3,not3_2);
    and and_4(and4,not4_3,in[0]);

    or or_0(out,and0,and1,and2,and3,and4);

endmodule

module fop_D(in,out);
    parameter n = 4;

    input[n-1:0]in;
    output out;

    assign out = (!in[2]&!in[1]&!in[0]) | (in[2]&!in[1]&in[0]) | (!in[2]&in[1]&in[0]) | (!in[3]&!in[2]) | (!in[3]&in[0]);

endmodule

module fop_B(in,out);
    parameter n = 4;

    input[n-1:0]in;
    output out;
    reg out;

    always@(*)begin
        case(in)
            0,1,2,3,5,7,8,11,13:begin
                out=1'b1;
            end
            default:begin
                out=1'b0;
            end
        endcase
    end
endmodule