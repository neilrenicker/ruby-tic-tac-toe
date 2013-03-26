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

  describe "win location descriptions" do

    it "should know if row1 is a winning row" do
      game = Game.new([1,1,1],[0,2,0],[2,0,2])
      game.row1_winner?.should be_true
    end

    it "should know if row2 is a winning row" do
      game = Game.new([0,2,0],[1,1,1],[2,0,2])
      game.row2_winner?.should be_true
    end

    it "should know if row3 is a winning row" do
      game = Game.new([2,0,2],[0,2,0],[1,1,1])
      game.row3_winner?.should be_true
    end

    it "should know column1 is a winning column" do
      game = Game.new([1,0,1],[1,2,0],[1,0,2])
      game.column1_winner?.should be_true
    end

    it "should know column2 is a winning column" do
      game = Game.new([0,2,0],[1,2,1],[1,2,0])
      game.column2_winner?.should be_true
    end

    it "should know column3 is a winning column" do
      game = Game.new([1,0,2],[0,1,2],[0,1,2])
      game.column3_winner?.should be_true
    end

    it "should know if diagonal_left is a winning diagonal" do
      game = Game.new([1,0,0],[2,1,0],[2,0,1])
      game.diagonal_left_winner?.should be_true
    end

    it "should know if diagonal_right is a winning diagonal" do
      game = Game.new([0,0,2],[1,2,0],[2,0,1])
      game.diagonal_right_winner?.should be_true
    end

  end

  it "should pinpoint row1 as the winning location if row1 wins" do
    game = Game.new([1,1,1],[0,2,0],[2,0,2])
    game.win_location.should == [1,1,1]
  end

  it "should pinpoint row2 as the winning location if row2 wins" do
    game = Game.new([0,1,0],[2,2,2],[1,0,1])
    game.win_location.should == [2,2,2]
  end

  it "should declare player1 as the winner if player1 wins" do
    game = Game.new([1,1,1],[0,2,0],[2,0,2])
    game.winner.should == "player1"
  end

end