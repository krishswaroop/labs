//design code for counter sequence 1,2,3,4...

module counter_design(count_out, rst, clk);

input clk, rst;
output [3:0] count_out;
reg [3:0] count_out;

always @ (posedge clk)
begin
	if(rst)
		count_out <= 4'b0;
	else
		count_out <= count_out + 1;
end

endmodule

/*code with parameter*/
/*
module counter_design(count_out, rst, clk);

input clk, rst;
output [COUNTER_SIZE_IN_BITS-1:0] count_out;
reg [COUNTER_SIZE_IN_BITS-1:0] count_out;

always @ (posedge clk)
begin
	if(rst)
		count_out <= 4'b0;
	else
		count_out <= count_out + 1;
end

endmodule*/
