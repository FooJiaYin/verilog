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

    reg [n-1:0] i, j, i_1, i_2_j_1, j_2, temp, row1, col1row2, col2, row1_next, col1row2_next, col2_next;
    reg signed [n-1:0] data, data_next;
    reg signed [2*n-1:0] total, write_data;
    reg [1:0] state, state_next;
    wire signed [n-1:0] read_data;

    always@(posedge clk)begin
        if(reset == 1'b1)begin
            state <= READROWCOL;
            i <= 20'd0;
            j <= 20'd0;
            temp <= 20'd0;
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
            temp <= (state_next==READM1)? j_2 : i_1;
            data <= data_next;
            total <= write_data;
            row1 <= row1_next;
            col1row2 <= col1row2_next;
            col2 <= col2_next;
        end
    end

    always@(*)begin
        case(state)
            READROWCOL:begin
                state_next = (i<20'd2)? state : READM1;
                i_1 = (reset == 1'b0 && i<20'd2)? i + 20'd1 : 20'd0;
                i_2_j_1 = 20'd0;
                j_2 = 20'd0;
                data_next = read_data;
                write_data = 40'd0;
                row1_next = (i==20'd0)? read_data : row1;
                col1row2_next = (i==20'd1)? read_data : col1row2;
                col2_next = (i==20'd2)? read_data : col2;
            end
            READM1:begin
                state_next = READM2;
                i_1 = i;
                i_2_j_1 = j;
                j_2 = temp;
                data_next = read_data;
                write_data = (j==0)? 40'd0 : total;
                row1_next = row1;
                col1row2_next = col1row2;
                col2_next = col2;
            end
            READM2:begin
                state_next = (i<col1row2)? READM1 : WRITE;
                i_1 = temp;
                i_2_j_1 = i + 20'd1;
                j_2 = j;
                data_next = data;
                write_data = (i<col1row2)? total + data*read_data : total;
                row1_next = row1;
                col1row2_next = col1row2;
                col2_next = col2;
            end
            WRITE:begin
                state_next = READM1;
                i_1 = (j<col2-1)? i : i + 20'd1;
                i_2_j_1 = 20'd0;
                j_2 = (j<col2-1)? j + 20'd1 : 20'd0;
                data_next = 20'd0;
                write_data = total;
                row1_next = row1;
                col1row2_next = col1row2;
                col2_next = col2;
            end
        endcase
    end

    assign read = (state==WRITE)? 1'b0 : 1'b1;
    assign write = (state==READM1 || state==READM2)? 1'b0 : 1'b1;
    assign index = (state==READM2)? 1'b1 : 1'b0;
    assign finish = (state==WRITE && i_1==row1 && clk==1'b0)? 1'b1 : 1'b0;
	
endmodule