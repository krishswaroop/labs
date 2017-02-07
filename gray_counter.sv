//4 bit gray_counter
module gray_counter(input bit clk, 
                    input bit rst,
                    output logic[3:0] bcd_value,
                    output logic[3:0] gray_count);

always@(posedge clk)
begin
  if(rst)
  begin
    bcd_value <= 4'b0;
    gray_count <= 4'b0;
  end
  else
  begin
    bcd_value <=  bcd_value + 1;
    assign gray_count = {bcd_value[3], bcd_value[3]^bcd_value[2], bcd_value[2]^bcd_value[1], bcd_value[1]^bcd_value[0]};
    //adding display for reference
    $display("%0t | BCD - %b -> GRAY - %b",$time,bcd_value,gray_count);
  end
end
endmodule

//testbench
module tb;
bit clk;
bit rst;
wire [3:0] bcd_value;
wire [3:0] gray_count;

gray_counter gc(clk, rst, bcd_value, gray_count);

initial begin
  $monitor("%0t | Reset -> %b",$time,rst);
  clk = 1'b0;
  rst = 1'b0;
  #10;
  rst = 1'b1;
  #50;
  rst = 1'b0;
  #500 $finish;
  end

always begin
  #10 clk = ~clk;
end
endmodule
