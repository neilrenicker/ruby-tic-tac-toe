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