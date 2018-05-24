// 05/2018
// CS2102 Digital Logic Design
//
// HW06: Floating-Point Multiplication (FPMUL) Engine
// File: hw06_t.v
// Description: test stimulus design
//
// Chih-Tsun Huang
// cthuang@cs.nthu.edu.tw
// National Tsing Hua University
// Hsinchu Taiwan
//
`timescale 1ns/100ps
`define end_time 10000
module stimulus;
  parameter cyc = 10;
  parameter delay = 0;

  reg clk, rst_n, start;
  reg [7:0] a, b;
  wire done;
  wire [15:0] y;
  wire [4:0] e;

  FPMUL fpmul01 (
    .CLK(clk),
    .RST_N(rst_n),
    .B(b),
    .A(a),
    .START(start),
    .Y(y),
    .E(e),
    .DONE(done)
  );

  always #(cyc/2) clk = ~clk;

  integer check;
  always @(posedge clk) begin
    check = y * (2 ** e)/(2**7);
  end

  initial begin
    $fsdbDumpfile("fpmul.fsdb");
    $fsdbDumpvars;

    $monitor("%6d %b RST_N=%b START=%b A=%d B=%d | DONE=%b Y=%b E=%d | state=%b | [%6d] ",
      $time, clk, rst_n, start, a, b, done, y, e,
      fpmul01.state, check);

    #(`end_time)
		$display("#######################");
		$display("#    Run Time Error   #");
		$display("#######################");
		$finish;
  end

  initial begin
    clk = 1;
    rst_n = 1;
    start = 0;
    #(cyc);
    #(delay)
    rst_n = 0;
    #(cyc*2) rst_n = 1;

    // test pattern
    #(cyc) load; data_in(8'd128, 8'd128);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    #(cyc) load; data_in(8'd60, 8'd59);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    #(cyc) load; data_in(8'd4, 8'd2);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    #(cyc) load; data_in(8'd33, 8'd28);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    #(cyc) load; data_in(8'd100, 8'd18);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    #(cyc) load; data_in(8'd64, 8'd32);
    #(cyc) nop;
    @(done);
    #(cyc) nop;

    $finish;
  end

  // tasks
  task nop;
    begin
      start = 0;
    end
  endtask
  task load;
    begin
      start = 1;
    end
  endtask
  task data_in;
    input [7:0] data1, data2;
    begin
      a = data1;
      b = data2;
    end
  endtask

endmodule
