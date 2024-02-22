module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output [3:0] total);

// The code describing scorehand will go here.  Remember this is a combinational
// block. The function is described in the handout.  Be sure to review the section
// on representing numbers in the lecture notes.

reg [3:0] card1val, card2val, card3val;

  always_comb begin
    if (card1 >= 1 && card1 <= 9) begin
      card1val = card1;
    end else begin
      card1val = 0;
    end

    if (card2 >= 1 && card2 <= 9) begin
      card2val = card2;
    end else begin
      card2val = 0;
    end

    if (card3 >= 1 && card3 <= 9) begin
      card3val = card3;
    end else begin
      card3val = 0;
    end
  end

assign total = (card1val + card2val + card3val) % 10;

endmodule
