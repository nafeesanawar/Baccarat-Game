// registers from datapath
module register(input [3:0] reg_input, output reg [3:0] reg_output, input load_enable, input reset, input clk);

	always_ff @(posedge clk) begin
	if (~reset)
		reg_output <= 4'b0000;
	else
		if(load_enable == 1'b1)
   	   	reg_output <=  reg_input;
		else
		reg_output <= reg_output;
	end


endmodule: register




module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output  [3:0] pcard3_out,
                output  [3:0] pscore_out, output [3:0] dscore_out,
                output  [6:0] HEX5, output  [6:0] HEX4, output  [6:0] HEX3,
                output  [6:0] HEX2, output  [6:0] HEX1, output [6:0] HEX0);	
						
wire [3:0] w1,w2,w3,w4,w5,w6;
wire [3:0] big_wire;

	//comment : where is pcard3_out


//registers x 6
	register pcard1(.reg_input(big_wire),.reg_output(w1),.load_enable(load_pcard1),.reset(resetb),.clk(slow_clock));

	register pcard2(.reg_input(big_wire),.reg_output(w2),.load_enable(load_pcard2),.reset(resetb),.clk(slow_clock));

	register pcard3(.reg_input(big_wire),.reg_output(w3),.load_enable(load_pcard3),.reset(resetb),.clk(slow_clock));

	register dcard1(.reg_input(big_wire),.reg_output(w4),.load_enable(load_dcard1),.reset(resetb),.clk(slow_clock));

	register dcard2(.reg_input(big_wire),.reg_output(w5),.load_enable(load_dcard2),.reset(resetb),.clk(slow_clock));

	register Dcard3(.reg_input(big_wire),.reg_output(w6),.load_enable(load_dcard3),.reset(resetb),.clk(slow_clock));

// card7seg instantiation

	card7seg a(.card(w1),.seg7(HEX0));

	card7seg b(.card(w2),.seg7(HEX1));

	card7seg c(.card(w3),.seg7(HEX2));

	card7seg d(.card(w4),.seg7(HEX3));

	card7seg e(.card(w5),.seg7(HEX4));

	card7seg f(.card(w6),.seg7(HEX5));

// Scoring
	dealcard dealcard(.clock(fast_clock), .resetb(resetb), .new_card(big_wire));

	scorehand pcard_scorehand(.card1(w1),.card2(w2),.card3(w3),.total(pscore_out));

	scorehand dcard_scorehand(.card1(w4),.card2(w5),.card3(w6),.total(dscore_out));

	assign pcard3_out = w3;

// not need FSM, its in task 5
endmodule: datapath




