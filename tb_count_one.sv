//testbench for count_one.sv design code

module tb_counter_design;

reg tb_clk, tb_rst;
wire [3:0] tb_count_out;

counter_design c(.count_out(tb_count_out), .rst(tb_rst), .clk(tb_clk)); 

initial 
begin
	tb_clk = 0;
	tb_rst = 0;	
	#45 tb_rst = 1;
	#85 tb_rst = 0;
	#500 $finish;
end

always #10 tb_clk = ~tb_clk;

endmodule

/*code with parameter*/
/*

parameter COUNTER_SIZE_IN_BITS = 10;

module tb_counter_design;

reg tb_clk, tb_rst;
wire [COUNTER_SIZE_IN_BITS-1:0] tb_count_out;

counter_design c(.count_out(tb_count_out), .rst(tb_rst), .clk(tb_clk)); 

initial 
begin
	tb_clk = 0;
	tb_rst = 0;	
	#45 tb_rst = 1;
	#85 tb_rst = 0;
	#500 $finish;
end

always #10 tb_clk = ~tb_clk;

endmodule*/
