module tb_task5();

reg CLOCK_50;
reg  [3:0] KEY;
wire [9:0] LEDR;
wire [6:0] HEX5;
wire [6:0] HEX4;
wire [6:0] HEX3;
wire [6:0] HEX2;
wire [6:0] HEX1;
wire [6:0] HEX0;

task5 dut(.CLOCK_50(CLOCK_50), .KEY(KEY), .LEDR(LEDR), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2),
.HEX3(HEX3), .HEX4(HEX4), . HEX5(HEX5));


initial begin
	CLOCK_50=1;
	#10
	forever begin
		CLOCK_50=~CLOCK_50;
		#10;
	end
end

//game 1
initial begin
KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes



KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes



KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes

$display("LED8:%d\nLED9: %d\n",LEDR[8],LEDR[9]);

KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes

$display("LED8:%d\nLED9: %d\n",LEDR[8],LEDR[9]);

KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes

$display("LED8:%d\nLED9: %d\n",LEDR[8],LEDR[9]);

KEY[3] = 4'b0;
KEY[0] = 4'b0;
#10;
KEY[3] = 4'b1;
KEY[0] = 4'b1;
#10;
// pressing and releasing the clock to allow the game to go through all the states
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;
KEY[0] = 4'b0;
#10;
KEY[0] = 4'b1;
#10;   // end of game 1 - long pause on wave guide - slow clk no longer changes

$display("LED8:%d\nLED9: %d\n",LEDR[8],LEDR[9]);

$stop;
end
endmodule

