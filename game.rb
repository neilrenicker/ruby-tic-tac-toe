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

  def col1
    [row1[0],row2[0],row3[0]]
  end

  def col2
    [row1[1],row2[1],row3[1]]
  end

  def col3
    [row1[2],row2[2],row3[2]]
  end

  def diagonal_left
    [row1[0],row2[1],row3[2]]
  end

  def diagonal_right
    [row1[2],row2[1],row3[0]]
  end

  def row_winner?
    row1.uniq.count == 1 ||
    row2.uniq.count == 1 ||
    row3.uniq.count == 1
  end

  def column_winner?
    col1.uniq.count == 1 ||
    col2.uniq.count == 1 ||
    col3.uniq.count == 1
  end

  def diagonal_winner?
    diagonal_left.uniq.count == 1 ||
    diagonal_right.uniq.count == 1
  end

  def winner_exists?
    row_winner? ||
    column_winner? ||
    diagonal_winner?
  end

  def player1_wins
    row1.uniq.count == 1 && row1.include?(1) ||
    row2.uniq.count == 1 && row2.include?(1) ||
    row3.uniq.count == 1 && row3.include?(1) ||
    col1.uniq.count == 1 && col1.include?(1) ||
    col2.uniq.count == 1 && col2.include?(1) ||
    col3.uniq.count == 1 && col3.include?(1) ||
    diagonal_left.uniq.count == 1 && diagonal_left.include?(1) ||
    diagonal_right.uniq.count == 1 && diagonal_right.include?(1)
  end

  def winner
    if player1_wins
      "player1"
    else
      "player2"
    end
  end

end

