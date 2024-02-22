// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").


module tb_datapath();
		reg slow_clock, fast_clock, resetb,
		load_pcard1, load_pcard2, load_pcard3,
		load_dcard1, load_dcard2, load_dcard3;

		wire [3:0] pcard3_out, pscore_out,dscore_out;

		wire [6:0] HEX5,  HEX4, HEX3, HEX2,  HEX1,  HEX0;

		datapath dut(.slow_clock(slow_clock),
		.fast_clock(fast_clock),
		.resetb(resetb),
		.load_pcard1(load_pcard1),
		.load_pcard2(load_pcard2),
		.load_pcard3(load_pcard3),
		.load_dcard1(load_dcard1),
		.load_dcard2(load_dcard2),
		.load_dcard3(load_dcard3),
		.pcard3_out(pcard3_out),
		.pscore_out(pscore_out),
		.dscore_out(dscore_out),
		.HEX5(HEX5),
		.HEX4(HEX4),
		.HEX3(HEX3),
		.HEX2(HEX2),
		.HEX1(HEX1),
		.HEX0(HEX0));


		// the fast_clk happens on its own and you have no control over it once you put it on
		// the slow_clock is user input and connects to a button and everytime you hit the slow_clk, that is when you will start loading different values

		initial begin
		  fast_clock = 1'b0;
		  forever begin
		    #5 fast_clock=~fast_clock;
		// modify fast clock to every 10ns
		  end
		end

		initial begin

		// this part of the test checks whether or not we have loaded the registers properly. So we check in the waveform
		// if load_pcard1 has a value then whether or not hex0 has a value
		  resetb = 1'b0; // pressing the reset
			#10;
			resetb = 1'b1;
			#10;
			load_pcard1 = 1'b1;
			slow_clock = 1'b1;
			#10;
			load_pcard1 = 1'b0;
			slow_clock= 1'b0;
			#10;
			load_pcard2 = 1'b1;
			slow_clock = 1'b1;
			#10;
			load_pcard2 = 1'b0;
			slow_clock= 1'b0;
			#10;
			load_pcard3 = 1'd1;
			slow_clock = 1'b1;
			#10;
			load_pcard3 = 1'b0;
			slow_clock = 1'b0;
			#10;



			#10;
			load_dcard1 = 1'b1;
			slow_clock = 1'b1;
			#10;
			load_dcard1 = 1'b0;
			slow_clock= 1'b0;
			#10;
			load_dcard2 = 1'b1;
			slow_clock = 1'b1;
			#10;
			load_dcard2 = 1'b0;
			slow_clock= 1'b0;
			#10;
			load_dcard3 = 1'd1;
			slow_clock = 1'b1;
			#10;
			load_dcard3 = 1'b0;
			slow_clock = 1'b0;
			#10;

			
			$display ("HEX0: %b\n HEX1:%b\n HEX2:%b\n HEX3:%b\n HEX4:%b\n HEX5:%b\n", HEX0, HEX1,HEX2,HEX3,HEX4,HEX5);
			#5;
			$display("Player Score: %d \nDealer Score: %d\n", pscore_out, dscore_out);

			$stop;
		end



endmodule

