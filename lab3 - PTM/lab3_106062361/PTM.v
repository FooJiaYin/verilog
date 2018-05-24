`define IDLE 3'd0

module PTM(clk , rst , start , data , en , addr , flag , fin , result);

    parameter datawidth = 10;
    parameter memwidth = 10;

    input clk , rst , start;
    input [datawidth - 1 : 0] data;
    output en , fin, flag;
    output [memwidth - 1 : 0] addr;
    output [datawidth - 1 : 0] result;

    reg [2 : 0] state , next_state;
    reg [memwidth - 1 : 0] idx , next_idx;
    reg [memwidth - 1 : 0] leng , next_leng;
    reg flag;
    reg [datawidth - 1 : 0] ans , next_ans;

    always@(posedge rst or posedge clk)begin
        if(rst == 1'b1)begin
            state <= `IDLE;
            idx <= 10'd0;
            leng <= 10'd0;
            ans <= 10'd0;
        end
        else begin
            state <= next_state;
            idx <= next_idx;
            leng <= next_leng;
            ans <= next_ans;
        end
    end

    always@(*)begin
        next_idx = idx + 10'd1;
        next_leng = leng;
        next_ans = ans;
        flag = 1'b0;
        next_state = state;
        case(state)
            3'd0:begin
                next_state = (start == 1'b1)? 3'd1 : `IDLE;
                next_idx = (start == 1'b1)? 10'd0 : 10'd1023;
                next_leng = (start == 1'b1)? data : leng;
                //next_ans = ans;
            end
            3'd1:begin
                next_state = (data[0] == 1'b1)? state + 3'd1 : state;
                next_idx = (idx == 10'd1023)? 10'd0 : idx + 10'd1;
                /*next_leng = leng;
                next_ans = ans;*/
            end
            3'd2:begin
                next_state = (data[0] == 1'b0)? state + 3'd1 : state;
                /*next_idx = idx + 10'd1;
                next_leng = leng;
                next_ans = ans;*/
            end
            3'd3:begin
                next_state = (data[0] == 1'b1)? state + 3'd1 : 3'd1;
                /*next_idx = idx + 10'd1;
                next_leng = leng;
                next_ans = ans;*/
            end
            3'd4:begin
                next_state = (data[0] == 1'b0)? state + 3'd1 : 3'd2;
                /*next_idx = idx + 10'd1;
                next_leng = leng;
                next_ans = ans;*/
            end
            3'd5:begin
                next_state = (data[0] == 1'b0)? state + 3'd1 : 3'd4;
                /*next_idx = idx + 10'd1;
                next_leng = leng;
                next_ans = ans;*/
            end
            3'd6:begin
                next_state = (data[0] == 1'b1)? state + 3'd1 : 3'd1;
                /*next_idx = idx + 10'd1;
                next_leng = leng;
                next_ans = ans;*/
            end
            3'd7:begin
                next_state = (data[0] == 1'b1)? 3'd2 : 3'd5;
                /*next_idx = idx + 10'd1;
                next_leng = leng;*/
                flag = (data[0] == 1'b1)? 1'b1 : 1'b0;
                next_ans = (data[0] == 1'b1)? ans + 10'd1 : ans;
            end
        endcase
    end

    assign en = 1'b1;
    assign addr = idx;
    assign fin = (start == 1'b1 && idx == leng)? 1'b1 : 1'b0;
    assign result = (fin == 1'b1)? ans : 10'd0;

endmodule
