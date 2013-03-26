require 'spec_helper.rb'
require './game.rb'

describe Game do
  it "should have a game board" do
    game = Game.new
  end

  it "should accept a score" do
    game = Game.new([1,1,0],[0,2,0],[2,0,2])
    game.score.should == [[1,1,0],[0,2,0],[2,0,2]]
  end

  it "should label the three rows" do
    game = Game.new([1,1,0],[0,2,0],[2,0,2])
    game.row1.should == [1,1,0]
    game.row2.should == [0,2,0]
    game.row3.should == [2,0,2]
  end

  it "should label the three columns" do
    game = Game.new([1,1,0],[0,2,0],[2,0,2])
    game.col1.should == [1,0,2]
    game.col2.should == [1,2,0]
    game.col3.should == [0,0,2]
  end

  it "should label the two diagonals" do
    game = Game.new([1,1,0],[0,2,0],[2,0,2])
    game.diagonal_left.should == [1,2,2]
    game.diagonal_right.should == [0,2,2]
  end

  it "should check for a winning top row" do
    game = Game.new([1,1,1],[0,2,0],[2,0,2])
    game.row_win.should be_true
  end

end