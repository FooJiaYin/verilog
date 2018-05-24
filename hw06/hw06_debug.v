module FPMUL (
  input wire CLK,
  input wire RST_N,
  input wire [7:0] A,
  input wire [7:0] B,
  input wire START,
  output reg [15:0] Y,
  output reg signed [4:0] E, next_E,
  output reg DONE
);
parameter IDLE=2'b00;
parameter MULT=2'b01;
parameter SHIFT=2'b10;
parameter FINISH=2'b11;
reg [15:0] tmp_y,next_tmp_y;
reg [1:0] state, next_state;
wire flag_zero;
wire flag_leadz;
assign flag_zero=(A*B==0)? 1:0;
assign flag_leadz=!tmp_y[15];

always @(posedge CLK)begin
 tmp_y=next_tmp_y;
 state=next_state;
 E=next_E;
  if(RST_N==0)
   state=IDLE;
end

always @* begin
 case(state)
  IDLE:begin
   next_E=4'd15;
   next_state=IDLE;
   DONE=1'b0;
   Y=16'b0;
   if(START && flag_zero) begin
    next_E=4'd0;
    next_state=FINISH;
   end
   else if(START && !flag_zero)
    next_state=MULT;
    next_tmp_y=A*B;
    Y=A*B;
  end

  MULT:begin
   next_state=FINISH;
   Y=tmp_y;
   if(flag_leadz)
    next_state=SHIFT;
  end
  SHIFT:begin
   next_state=FINISH;
   next_tmp_y=tmp_y;
   next_E=E;
   if(flag_leadz)begin
    next_E=E-1;
    next_state=SHIFT;
    Y=tmp_y;
    next_tmp_y=tmp_y<<1;
   end
  end
  FINISH:begin
   next_state=IDLE;
   DONE=1'b1;
   Y=tmp_y;
  end
 endcase
end


endmodule