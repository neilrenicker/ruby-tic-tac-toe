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

  def row1_winner?
    row1.uniq.count == 1
  end

  def row2_winner?
    row2.uniq.count == 1
  end

  def row3_winner?
    row3.uniq.count == 1
  end

  def column1_winner?
    col1.uniq.count == 1
  end

  def column2_winner?
    col2.uniq.count == 1
  end

  def column3_winner?
    col3.uniq.count == 1
  end

  def diagonal_left_winner?
    diagonal_left.uniq.count == 1
  end

  def diagonal_right_winner?
    diagonal_right.uniq.count == 1
  end

  def win_location
    if row1_winner?
      row1
    elsif row2_winner?
      row2
    elsif row3_winner?
      row3
    elsif column1_winner?
      col1
    elsif column2_winner?
      col2
    elsif column3_winner?
      col3
    elsif diagonal_left_winner?
      diagonal_left
    elsif diagonal_right_winner?
      diagonal_right                                  
    end
  end

  def winner
    if win_location.include?(1)
      "player1"
    elsif
      "player2"
    end
  end

end

