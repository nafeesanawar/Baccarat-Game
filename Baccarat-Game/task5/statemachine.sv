module statemachine(
  input slow_clock,
  input resetb,
  input [3:0] dscore,
  input [3:0] pscore,
  input [3:0] pcard3,
  output logic load_pcard1,
  output logic load_pcard2,
  output logic load_pcard3,
  output logic load_dcard1,
  output logic load_dcard2,
  output logic load_dcard3,
  output logic player_win_light,
  output logic dealer_win_light);

// # of states 2^4 states -> ability to have 16 states
logic [3:0] state;

parameter start = 4'd0;
parameter pc1 = 4'd1;
parameter pc2 = 4'd2;
parameter dc1 = 4'd3;
parameter dc2 = 4'd4;
parameter check_score = 4'd5;
parameter natural = 4'd6;
parameter dc3 = 4'd7;
parameter pc3 = 4'd10;
parameter who_won = 4'd12;

// key0 and key3 are active high (1) when they are not pressed. Active low when they presessed (0)

//sychronous -> depend on clock
// asynchronous -> dont depend on clock



always_ff @(posedge slow_clock) begin
  if (~resetb) begin  //if resetb is pressed go to start state
    state <= start;
  end else begin

    case(state)

    start:begin
    state <= pc1;
    end

    pc1: begin
    state <= dc1;
    end

    dc1:begin
    state <= pc2;
    end

    pc2:begin
    state <= dc2;
    end

    dc2:begin
    state <= check_score;
    end

    check_score:begin

    	if ((dscore == 4'd8) || (dscore == 4'd9) || (pscore == 4'd8) || (pscore == 4'd9))
	state <= natural;

	
	else if (pscore == 4'd0 || pscore == 4'd1 || pscore == 4'd2 || pscore == 4'd3 || pscore == 4'd4 || pscore == 4'd5)
	state <= pc3;
	  
	else 
	state <= (dscore <= 4'd5) ? dc3 : who_won;
    end

    natural:begin
    state <= who_won;
    end

    dc3:begin
    state <= who_won;
    end


    pc3:begin
    if (dscore == 4'd6 && (pcard3 == 4'd6 || pcard3 == 4'd7) )
      state <= dc3;
    else if (dscore == 4'd5 && (pcard3 == 4'd4 || pcard3 == 4'd5 || pcard3 == 4'd6 || pcard3 == 4'd7))
        state <= dc3;
    else if (dscore == 4'd4 && (pcard3 == 4'd2 || pcard3 == 4'd3 || pcard3 == 4'd4 || pcard3 == 4'd5 || pcard3 == 4'd6 || pcard3 == 'd7))
        state <= dc3;
    else if(dscore == 4'd3 && (pcard3 != 4'd8))
        state <= dc3;
    else if (dscore == 4'd0 || dscore ==  4'd1 || dscore == 4'd2)
      state <= dc3;
    else
      state <= who_won;
    end


    who_won:begin
    state <= who_won;
    end
    default: state <= start;
    endcase


end
end

always_comb begin
case(state)
    start: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    pc1: begin
    load_pcard1 = 1'b1;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    dc1: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b1;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    pc2: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b1;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    dc2:begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b1;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    check_score: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    natural: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    pc3: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b1;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end

    dc3: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b1;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end


    who_won: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b0;
    player_win_light = (pscore == dscore) ? 1'b1 : ((pscore < dscore) ? 1'b0 : 1'b1);
    dealer_win_light = (pscore == dscore) ? 1'b1 : ((pscore < dscore) ? 1'b1 : 1'b0);
    end

    default: begin
    load_pcard1 = 1'b0;
    load_pcard2 = 1'b0;
    load_pcard3 = 1'b0;
    load_dcard1 = 1'b0;
    load_dcard2 = 1'b0;
    load_dcard3 = 1'b1;
    player_win_light = 1'b0;
    dealer_win_light = 1'b0;
    end
endcase
end
endmodule:statemachine

