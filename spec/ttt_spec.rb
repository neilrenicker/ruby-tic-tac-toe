require 'spec_helper.rb'
require './game.rb'

describe Game do
  it "should begin a new game" do
    game = Game.new
  end

  it "should begin with an initial score of all zeros" do
    game = Game.new
    game.current_score.should == [[0,0,0],[0,0,0],[0,0,0]]
  end

  it "should detect if user's chosen piece is on row1" do
    game = Game.new
    game.row1_chosen?(1).should == true
  end

  it "should detect if user's chosen piece is on row2" do
    game = Game.new
    game.row2_chosen?(5).should == true
  end

  it "should detect if user's chosen piece is on row3" do
    game = Game.new
    game.row3_chosen?(9).should == true
  end

  it "should properly locate an input of '1'" do
    game = Game.new
    game.row_locator(1).should == 0
  end

  it "should properly locate an input of '4'" do
    game = Game.new
    game.row_locator(4).should == 1
  end

  it "should properly locate an input of '8'" do
    game = Game.new
    game.row_locator(8).should == 2
  end

  it "should update the first row score to [1,0,0] if a piece is placed at game block 1" do
    game = Game.new
    game.place_piece(1, 1)
    game.current_score.should == [[1,0,0],[0,0,0],[0,0,0]]
  end

  it "should update the second row score to [1,0,0] if a piece is placed at game block 4" do
    game = Game.new
    game.place_piece(4, 1)
    game.current_score.should == [[0,0,0],[1,0,0],[0,0,0]]
  end

  it "should update the third row score to [0,1,0] if a piece is placed at game block 8" do
    game = Game.new
    game.place_piece(8, 1)
    game.current_score.should == [[0,0,0],[0,0,0],[0,1,0]]
  end

  it "should detect if a piece chosen would be placed on an already chosen block" do
    game = Game.new
    game.place_piece(5, 1)
    game.already_chosen?(5).should be_true
  end

  it "should not allow a piece to be placed on an already chosen block" do
    game = Game.new
    game.place_piece(5, 1)
    game.place_piece(5, 2)
    game.current_score.should == [[0,0,0],[0,1,0],[0,0,0]]
  end

  it "should raise an error if a piece is placed on an already chosen block" do
    game = Game.new
    game.place_piece(5, 1)
    game.place_piece(5, 2)
    expect{game.place_piece}.to raise_error(InvalidMoveError)
  end
  
end

describe Scorer do
  it "should have a starting scorer" do
    score = Scorer.new
  end

  it "should accept a score" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.score.should == [[1,1,0],[0,2,0],[2,0,2]]
  end

  it "should label the row 1" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.row1.should == [1,1,0]
  end

  it "should label the row 2" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.row2.should == [0,2,0]
  end

  it "should label the row 3" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.row3.should == [2,0,2]
  end

  it "should label column 1" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.col1.should == [1,0,2]
  end

  it "should label column 2" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.col2.should == [1,2,0]
  end

  it "should label column 3" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.col3.should == [0,0,2]
  end

  it "should label the left diagonal" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.diag_left.should == [1,2,2]
  end

  it "should label the right diagonal" do
    score = Scorer.new([1,1,0],[0,2,0],[2,0,2])
    score.diag_right.should == [0,2,2]
  end

  it "should pinpoint row1 as the winning location if row1 wins" do
    score = Scorer.new([1,1,1],[0,2,0],[2,0,2])
    score.win_location.should == [1,1,1]
  end

  it "should pinpoint row2 as the winning location if row2 wins" do
    score = Scorer.new([0,1,0],[2,2,2],[1,0,1])
    score.win_location.should == [2,2,2]
  end

  it "should declare player1 as the winner if player1 wins" do
    score = Scorer.new([1,1,1],[0,2,0],[2,0,2])
    score.winner.should == "player1"
  end

  it "should know if there is not a winner" do
    score = Scorer.new([0,0,1],[2,0,0],[2,0,1])
    score.no_winner.should be_true
  end

  it "should declare 'no winner' if no winner exists" do
    score = Scorer.new([0,0,1],[2,0,0],[2,0,1])
    score.winner.should == "no winner"
  end

end