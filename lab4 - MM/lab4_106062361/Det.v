
module Det(clk,i,j,reset,read,write,read_data,write_data,finish);
	parameter MAX=20;
    parameter READROWCOL = 1'b0;
    parameter READMATRIX = 1'b1;

	input reset, clk;
	input [MAX-1:0] read_data;
	
	output [MAX-1:0] i, j;
	output read, write, finish;
	output [2*MAX-1:0] write_data;

    reg [3:0] idx, idx_next;
    reg [2:0] n, n_next;
    reg state, state_next, neg, neg_next;
    wire [1:0] col;
    reg signed [MAX-1:0] product, product_next;
    reg signed [2*MAX-1:0] total, write_data;
    wire signed [MAX-1:0] read_data;

    always@(posedge clk)begin
        if(reset == 1'b1)begin
            state <= READROWCOL;
            idx <= 4'd0;
            product <= 40'd1;
            total <= 40'd0;
            neg <= 1'b0;
            n <= 3'd0;
        end
        else begin
            state <= state_next;
            idx <= idx_next;
            product <= product_next;
            total <= write_data;
            neg <= neg_next;
            n <= n_next;
        end
    end

    always@(*)begin 
        state_next = READMATRIX;
        case(state)
            READROWCOL:begin
                idx_next = 4'd0;
                product_next = 40'd1;
                write_data = 40'd0;
                neg_next = 1'b0;
                n_next = read_data[2:0];
            end
            READMATRIX:begin
                if(col<n-1) begin
                    idx_next = idx + 1;
                    product_next = product*read_data;
                    write_data = total;
                    neg_next = neg;
                    n_next = n;
                end
                else begin
                    idx_next = (neg==1'b0)? idx-(n-1) : idx + 1;
                    product_next = 40'd1;
                    write_data = (neg==1'b0)? total + product*read_data : total - product*read_data;
                    neg_next = (neg==1'b0)? 1'b1 : 1'b0;
                    n_next = n;
                end
            end
        endcase
    end

    assign col = idx%n;
	assign i = (neg==1'b0)? col : n-1-col;
	assign j = ((idx-col)/n + col)%n;
    assign finish = ((n==3'd2 && idx==4'd2 && neg==1'b0 && clk==1'b1) || (idx==n*n-1 && neg==1'b1 && clk==1'b0))? 1'b1 : 1'b0;
    assign read = (finish==1'b0)? 1'b1 : 1'b0;
    assign write = (state==READMATRIX && finish==1'b0)? 1'b0 : 1'b1;
	
endmodule