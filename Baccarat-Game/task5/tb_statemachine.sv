module tb_statemachine();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

`define zero 4'b0000  // Represents 0
`define one 4'b0001  // Represents 1
`define two 4'b0010  // Represents 2
`define three 4'b0011  // Represents 3
`define four 4'b0100  // Represents 4
`define five 4'b0101  // Represents 5
`define six 4'b0110  // Represents 6
`define seven 4'b0111  // Represents 7
`define eight 4'b1000  // Represents 8
`define nine 4'b1001

    reg slow_clock, resetb;
    reg [3:0] dscore, pscore, pcard3;

    wire load_pcard1, load_pcard2, load_pcard3, load_dcard1, load_dcard2, load_dcard3;
    wire player_win_light, dealer_win_light;

     
    statemachine dut(.slow_clock(slow_clock),
                .resetb(resetb),
                .dscore(dscore),
                .pscore(pscore),
                .pcard3(pcard3),
                .load_pcard1(load_pcard1),
                .load_pcard2(load_pcard2),
                .load_pcard3(load_pcard3),
                .load_dcard1(load_dcard1),
                .load_dcard2(load_dcard2),
                .load_dcard3(load_dcard3),
                .player_win_light(player_win_light),
                .dealer_win_light(dealer_win_light));


    initial begin //one cycle is 10
        slow_clock = 0 ;
    	forever begin
   	     #5 slow_clock = ~slow_clock;
 	   end
    end

    initial begin

	resetb = 1'b1;
	//$display (dut.current_state);
	#15;

 	if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000000 ) $display("CORRECT: INITIAL STATE");
        else $error ("Wrong State");

	#5;
   
	 //CASE A, player has score 0-5
 

        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b10000000) $display("CORRECT: Player Card 1 STATE");
        else $error ("Wrong State");

        #10;
        
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00010000) $display("CORRECT: Dealer Card 1 STATE");
        else $error ("Wrong State");

        #10;

        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b01000000 ) $display("CORRECT: Player Card 2 STATE");
        else $error ("Wrong State");

        #10;
     
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00001000 ) $display("CORRECT: Dealer Card 2 STATE");
        else $error ("Wrong State");

        #10;

        //player score =0-5 , player get 3rd card
        
        pscore = `one;
        dscore = `six;
        
        //wait one cycle to next stage
        #10;

        //check if player get third card, since pcard 3 is 6/7
        pcard3 = `seven;
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b00100000) $display("CORRECT: Player Card 3 STATE");
        else $error ("Wrong State");


        //check if dealer get third card
        #10;
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b00000100) $display("CORRECT: Dealer got third STATE");
        else $error ("Wrong State");

        //check who won the game
        dscore = pscore;
        #10;

        //draw situation
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000011) $display("CORRECT: ITS A DRAW");
        else $error ("Wrong State");

	///////////////////////////////////////////////////////////////////////////
	#10;

	resetb = 1'b0;
	
	#10;
	resetb = 1'b1;
	slow_clock = 1'b0;
	//$display (dut.current_state);
	#5;

 	if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000000 ) $display("CORRECT: INITIAL STATE");
        else $error ("Wrong State");

	#10;
   
	//CASE B, player has score 6/7,banker get third card
 
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b10000000) $display("CORRECT: Player Card 1 STATE");
        else $error ("Wrong State");

        #10;
        
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00010000) $display("CORRECT: Dealer Card 1 STATE");
        else $error ("Wrong State");

        #10;

        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b01000000 ) $display("CORRECT: Player Card 2 STATE");
        else $error ("Wrong State");

        #10;
     
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00001000 ) $display("CORRECT: Dealer Card 2 STATE");
        else $error ("Wrong State");

        #10;

	pscore = `seven;
	dscore = `two;

	#10; //`BCARDTHREE_A
		
	
	pscore = `nine;
	dscore = `one;
	#10;
	
	//player WIN
	if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000010) $display("CORRECT: PLAYER WIN");
        else $error ("Wrong RESULT");

	///////////////////////////////////////////////////////////////////////////////
	#10;

	resetb = 1'b0;
	
	#10;
	resetb = 1'b1;
	slow_clock = 1'b0;
	//$display (dut.current_state);
	#5;

 	if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000000 ) $display("CORRECT: INITIAL STATE");
        else $error ("Wrong State");

	#10;
   
	//CASE C, Dealer has score 8, Direct WIN
 
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b10000000) $display("CORRECT: Player Card 1 STATE");
        else $error ("Wrong State");

        #10;
        
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00010000) $display("CORRECT: Dealer Card 1 STATE");
        else $error ("Wrong State");

        #10;

        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b01000000 ) $display("CORRECT: Player Card 2 STATE");
        else $error ("Wrong State");

        #10;
     
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00001000 ) $display("CORRECT: Dealer Card 2 STATE");
        else $error ("Wrong State");

	pscore = `eight;
	dscore = `nine;

	#10; //`CHECKWIN
	#10;
	#10;
	//DEALER WIN
	if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000001) $display("CORRECT: DEALER WIN");
        else $error ("Wrong RESULT");

	///////////////////////////////////////////////////////////////////////////
	#10;

	resetb = 1'b0;
	
	#10;
	resetb = 1'b1;
	slow_clock = 1'b0;
	//$display (dut.current_state);
	#5;

 	if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000000 ) $display("CORRECT: INITIAL STATE");
        else $error ("Wrong State");

	#10;
   
	//CASE D, player score 6/7 and banker score 6/7
 
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b10000000) $display("CORRECT: Player Card 1 STATE");
        else $error ("Wrong State");

        #10;
        
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00010000) $display("CORRECT: Dealer Card 1 STATE");
        else $error ("Wrong State");

        #10;

        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b01000000 ) $display("CORRECT: Player Card 2 STATE");
        else $error ("Wrong State");

        #10;
     
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00001000 ) $display("CORRECT: Dealer Card 2 STATE");
        else $error ("Wrong State");
	
	pscore = `seven;
	dscore = `seven;

        #10; //CHECK SCORE STATE
	#10;//WHO WON STATE
	
	 //draw situation
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000011) $display("CORRECT: ITS A DRAW");
        else $error ("Wrong State");
	
	///////////////////////////////////////////////////////////////////////////
	#10;

	resetb = 1'b0;
	
	#10;
	resetb = 1'b1;
	slow_clock = 1'b0;
	//$display (dut.current_state);
	#5;

 	if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000000 ) $display("CORRECT: INITIAL STATE");
        else $error ("Wrong State");

	#10;
   
	//CASE E, player score 0 and banker score 0
 
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b10000000) $display("CORRECT: Player Card 1 STATE");
        else $error ("Wrong State");

        #10;
        
        if ( {load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00010000) $display("CORRECT: Dealer Card 1 STATE");
        else $error ("Wrong State");

        #10;

        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b01000000 ) $display("CORRECT: Player Card 2 STATE");
        else $error ("Wrong State");

        #10;
     
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00001000 ) $display("CORRECT: Dealer Card 2 STATE");
        else $error ("Wrong State");
	
	pscore = `zero;
	dscore = `zero;

	#10; //CHECK SCORE
	#10; //CHECK THIRD CARD
        #10; //PLAYER THIRD CARD STATE
	if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} ==  8'b00000100) $display("CORRECT: Dealer Card 3 STATE");
        else $error ("Wrong State");

	pscore = `zero;
	dscore = `nine;

	#10;//WHO WON STATE
	
	 //draw situation
        if ({load_pcard1 ,load_pcard2, load_pcard3 ,load_dcard1 , load_dcard2 , load_dcard3 ,player_win_light ,dealer_win_light} == 8'b00000001) $display("CORRECT: DEALER WON");
        else $error ("Wrong State");

        $stop;
        
    end		
endmodule
