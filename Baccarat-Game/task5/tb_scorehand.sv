module tb_scorehand();

// target: takes the values of three cards and computes the score of that hand
    `define zero 4'b0000
    `define ace 4'b0001
    `define two  4'b0010
    `define three 4'b0011
    `define four 4'b0100
    `define five 4'b0101
    `define six 4'b0110
    `define seven 4'b0111
    `define eight 4'b1000
    `define nine 4'b1001
    `define ten 4'b1010
    `define jack 4'b1011
    `define queen 4'b1101
    `define king 4'b1101


    reg [3:0] card1;
    reg [3:0] card2;
    reg [3:0] card3;
    reg [3:0] total;
    
    scorehand dut(.card1(card1), .card2(card2), .card3(card3), .total(total));

 
// test

    initial begin

    // case 1: (1+3+9)log 10 = 3
    $display("Scorehand Testbench... ...");
    #10;

    card1 = `ace;
    card2 = `three;
    card3 = `nine;

    #10;

    if (total == `three) 
	$display("Correct Score:  %d", total);
    else $error ("Wrong Result");

    #10;

    //case 2: (queen+king+eight)log 10 = 8
    card1 = `queen;
    card2 = `king;
    card3 = `eight;

    #10;

    if (total == `eight) 
	$display("Correct Score:  %d", total);
    //else $error ("Wrong Result");

    #10;

    //case 3: (ten+jack+king)log 10 = 0
    card1 = `ten;
    card2 = `jack;
    card3 = `king;

    #10;

    if (total == `zero) 
	$display("Correct Score:  %d", total);
    //else $error ("Wrong Result");

    #10;
	repeat (10) begin
        card1 = $urandom_range(13);
        card2 = $urandom_range(13);
        card3 = $urandom_range(13);
        #10; $display("card1 = %d, card2 = %d, card3 = %d  total = %d", card1, card2, card3, total);
        end
    $stop;

    end
						
endmodule

