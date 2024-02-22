module tb_card7seg();


`define blank 7'b0000000
`define ace 7'b1110111
`define two   7'b1101101
`define three  7'b1111001
`define four  7'b0110011
`define five 7'b1011011
`define six 7'b1011111
`define seven 7'b1110000
`define eight  7'b1111111
`define nine  7'b1111011
`define ten 7'b1111110
`define jack  7'b0111100
`define queen 7'b1110011
`define king 7'b0110111
`define unused 7'b0000000

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

reg [3:0] SW;
wire [6:0] HEX0;

reg clk = 0;


card7seg dut(.SW(SW),.HEX0(HEX0));

// clock setup
	initial begin
    	clk = 0 ;
    	forever begin
   	     #5 clk = ~clk;
 	   end
	end
// test
initial begin

$display("Starting testbench...");


        SW = 4'b0000;
        #10;
        assert(HEX0 === `blank)  $display("Correct Blank");
	else $error("Blank failed");

        SW = 4'b0001;
        #10;
        assert(HEX0 === `ace)  $display("Correct ACE");
	else $error("ACE failed");

        SW = 4'b0010;
        #10;
        assert(HEX0 === `two)  $display("Correct TWO");
	else $error("TWO failed");

        SW = 4'b0011;
        #10;
        assert(HEX0 === `three)  $display("Correct THREE");
	else $error("THREE failed");

        SW = 4'b0100;
        #10;
        assert(HEX0 === `four)  $display("Correct FOUR");
	else $error("FOUR failed");

        SW = 4'b0101;
        #10;
        assert(HEX0 === `five)  $display("Correct FIVE");
	else $error("FIVE failed");

        SW = 4'b0110;
        #10;
        assert(HEX0 === `six)  $display("Correct SIX");
	else $error("SIX failed");

        SW = 4'b0111;
        #10;
        assert(HEX0 === `seven)  $display("Correct SEVEN");
	else $error("SEVEN failed");

        SW = 4'b1000;
        #10;
        assert(HEX0 === `eight)  $display("Correct EIGHT");
	else $error("EIGHT failed");

        SW = 4'b1001;
        #10;
        assert(HEX0 === `nine)  $display("Correct NINE");
	else $error("NINE failed");

        SW = 4'b1010;
        #10;
        assert(HEX0 === `ten)  $display("Correct TEN");
	else $error("TEN failed");

        SW = 4'b1011;
        #10;
        assert(HEX0 === `jack)  $display("Correct JACK");
	else $error("JACK failed");

        SW = 4'b1100;
        #10;
        assert(HEX0 === `queen)  $display("Correct QUEEN");
	else $error("QUEEN failed");

        SW = 4'b1101;
        #10;
        assert(HEX0 === `king)  $display("Correct KING");
	else $error("KING failed");

        SW = 4'b1110;
        #10;
        assert(HEX0 === `unused)  $display("Correct UNUSED");
	else $error("UNUSED failed");

        SW = 4'b1111;
        #10;
        assert(HEX0 === `unused)  $display("Correct UNUSED");
	else $error("UNUSED failed");


    #10

    $stop;
end
						
endmodule

