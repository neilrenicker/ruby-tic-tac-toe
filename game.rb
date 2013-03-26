class Game

  attr_accessor :score

  def initialize(*score)
    @score = score
  end

  def row1
    score[0]
  end

  def row2
    score[1]
  end

  def row3
    score[2]
  end

end