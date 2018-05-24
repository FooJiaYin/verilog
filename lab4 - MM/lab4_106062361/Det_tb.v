`define SDFFILE "./Det.sdf"
`define end_time 1000000
module test;
	
	parameter cycle=50;
	parameter n=20;
	
	reg clk,reset;
	reg [n-1:0]read_data;
	reg [n-1:0]mem[0:1023];
	reg signed[2*n-1:0]ans[0:1];
	reg [n-1:0]column;
	always #(cycle/2)clk = ~clk;
	
	wire read,write,finish;
	wire [n-1:0]i,j;
	wire signed[2*n-1:0]write_data;
	Det dddd(	.clk(clk),
				.i(i),
				.j(j),
				.reset(reset),//input
				.read(read),
				.write(write),
				.read_data(read_data),//input
				.write_data(write_data),
				.finish(finish)
	);

	initial begin
		`ifdef SDF
			$sdf_annotate(`SDFFILE,dddd);
			$fsdbDumpfile("Det_syn.fsdb");
		`else
			$fsdbDumpfile("Det.fsdb");
		`endif
		$fsdbDumpvars;
	end
	
	initial begin
		clk=1'b0;
		reset=1'b1;
		read_data='hz;
		$readmemb("memory_bonus.dat",mem);
		$readmemb("ans_bonus.dat",ans);
		@(negedge clk)reset=1;
		#(cycle)reset=0;
		
		#(`end_time)
		$display("#######################");
		$display("#Oh,something wrong!!!#");
		$display("#######################");
		$finish;
	end
	initial begin
		#(cycle/2)
			column=mem[0];
	end
	always@(negedge clk)begin
		if(read&!reset)begin
			if(!write)begin
				read_data=mem[(i*column)+j+1];
			end
			else begin
				read_data=mem[0];
			end
		end
		else begin
			read_data='hz;
		end
	end
	
	always@(posedge finish)begin
		#(cycle/2)
		if(write_data==ans[0])begin
			if(write)begin
				$display("###################");
				$display("#Congratulation!!!#");
				$display("###################");
			end
			else begin
				$display("#######################");
				$display("#Can't write answer!!!#");
				$display("#######################");
			end
		end
		else begin
			if(write)begin
				$display("You got wrong answer!!!");
				$display("Your answer is %d !!!",write_data);
				$display("The correct answer is %d !!!",ans[0]);
			end
			else begin
				$display("#######################");
				$display("#Can't write answer!!!#");
				$display("#######################");
			end
		end
		$finish;
	end
endmodule