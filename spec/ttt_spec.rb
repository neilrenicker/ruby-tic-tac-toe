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

end