module card7seg(input [3:0] SW, output reg [6:0] HEX0);
		
	
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



	always_comb begin
	case (SW[3:0])
	4'b0000: HEX0 = `blank;
	4'b0001: HEX0 = `ace;
	4'b0010: HEX0= `two;
	4'b0011: HEX0 =`three;
	4'b0100: HEX0 = `four;
	4'b0101: HEX0 = `five;
	4'b0110: HEX0 = `six;
	4'b0111: HEX0 = `seven;
	4'b1000: HEX0 = `eight;
	4'b1001: HEX0 = `nine;
	4'b1010: HEX0 = `ten;
	4'b1011: HEX0 = `jack;
	4'b1100: HEX0 = `queen;
	4'b1101: HEX0 = `king;
	4'b1110: HEX0 = `unused;
	4'b1111: HEX0 = `unused;
	endcase
	end

endmodule

