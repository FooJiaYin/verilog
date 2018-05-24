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
module stimulus;
  parameter cyc = 10;
  parameter delay = 0;

  reg clk, rst_n, start;
  reg [7:0] a, b;
  wire done;
  wire [7:0] y;
  wire [4:0] e;

  FPMUL fpmul01 (

    // Write your code here
 
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

    //
    // Write your code here:
    //   Add more test patterns
    //

    // Finish the simulation
    #(cyc) nop;
    #(cyc) nop;
    #(cyc) nop;
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
