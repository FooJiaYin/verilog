module MM(clk,i,j,reset,read,write,index,read_data,write_data,finish);
	parameter n=20;
    parameter READROWCOL = 2'd0;
    parameter READM1 = 2'd1;
    parameter READM2 = 2'd2;
    parameter WRITE = 2'd3;

	input reset, clk;
	input [n-1:0] read_data;
	
	output [n-1:0] i, j;
	output read, write, index, finish;
	output [2*n-1:0] write_data;

    reg [n-1:0] i, j, i_1, i_2_j_1, j_2, row1, col1row2, col2;
    reg signed [n-1:0] data;
    reg signed [2*n-1:0] total;
    reg [1:0] state, state_next;
    wire signed [n-1:0] read_data;
    wire signed [2*n-1:0] write_data;

    always@(posedge clk)begin
        if(reset == 1'b1)begin
            state <= READROWCOL;
            i <= 20'd0;
            j <= 20'd0;
            i_1 <= 20'd0;
            i_2_j_1 <= 20'd0;
            j_2 <= 20'd0;
            data <= 20'd0;
            total <= 40'd0;
            row1 <= 20'd0;
            col1row2 <= 20'd0;
            col2 <= 20'd0;

        end
        else begin
            state <= state_next;
            i <= (state_next==READM2)? i_2_j_1 : i_1;
            j <= (state_next==READM1)? i_2_j_1 : j_2;
        end
    end

    always@(*)begin
        case(state)
            READROWCOL:begin
                state_next = (i<20'd2)? state : READM1;
                i_1 = (reset == 1'b0 && i<20'd2)? i + 20'd1 : 20'd0;
                i_2_j_1 = 20'd0;
                j_2 = 20'd0;
                data = read_data;
                total = 40'd0;
                row1 = (i==20'd0)? read_data : row1;
                col1row2 = (i==20'd1)? read_data : col1row2;
                col2 = (i==20'd2)? read_data : col2;
            end
            READM1:begin
                state_next = READM2;
                i_1 = i_1;
                i_2_j_1 = i_2_j_1;
                j_2 = j_2;
                data = (clk==0 )? read_data : data;
                total = (j==0)? 40'd0 : total;
                row1 = row1;
                col1row2 = col1row2;
                col2 = col2;
            end
            READM2:begin
                state_next = (i<col1row2)? READM1 : WRITE;
                i_1 = i_1;
                i_2_j_1 = i + 20'd1;
                j_2 = j_2;
                data = data;
                total = (clk==0 && i<col1row2)? total + data*read_data : total;
                row1 = row1;
                col1row2 = col1row2;
                col2 = col2;
            end
            WRITE:begin
                state_next = READM1;
                i_1 = (j<col2-1 || clk==1)? i_1 : i_1 + 20'd1;
                i_2_j_1 = 20'd0;
                j_2 = (j<col2-1)? j + 20'd1 : 20'd0;
                data = 20'd0;
                total = total;
                row1 = row1;
                col1row2 = col1row2;
                col2 = col2;
            end
        endcase
    end

    assign read = (state==WRITE)? 1'b0 : 1'b1;
    assign write = (state==READM1 || state==READM2)? 1'b0 : 1'b1;
    assign index = (state==READM2)? 1'b1 : 1'b0;
    assign write_data = total;
    assign finish = (state==WRITE && i_1==row1)? 1'b1 : 1'b0;
	
endmodule