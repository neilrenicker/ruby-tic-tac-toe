class Game

  attr_accessor :current_score

  def initialize
    @current_score = [[0,0,0],[0,0,0],[0,0,0]]
  end

  def row1_chosen?(piece)
    (piece / 3.0 <= 1)
  end

  def row2_chosen?(piece)
    (piece / 3.0 <= 2)
  end

  def row3_chosen?(piece)
    (piece / 3.0 <= 3)
  end

  def row_locator(piece)
    case
      when row1_chosen?(piece) then 0
      when row2_chosen?(piece) then 1
      when row3_chosen?(piece) then 2
    end
  end

  def column_locator(piece)
    case
      when row1_chosen?(piece) then piece - 1
      when row2_chosen?(piece) then piece - 4
      when row3_chosen?(piece) then piece - 7
    end
  end

  def already_chosen?(piece)
    row = row_locator(piece)
    column = column_locator(piece)
    @current_score[row][column] != 0
  end

  def place_piece(piece, player)
    row = row_locator(piece)
    column = column_locator(piece)
    if already_chosen?(piece)
      raise "What are you thinking?! You can't move there!"
    else
      @current_score[row][column] = player
    end
  end

end

class Scorer < Game

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

  def diag_left
    [row1[0],row2[1],row3[2]]
  end

  def diag_right
    [row1[2],row2[1],row3[0]]
  end

  def win_location
    possible_wins = [row1, row2, row3, col1, col2, col3, diag_left, diag_right]
    possible_wins.detect do |location|
      unless location.include?(0)
        location if location.uniq.count == 1
      end
    end
  end

  def no_winner
    win_location == nil
  end

  def winner
    if no_winner
      "no winner"
    elsif win_location.include?(1)
      "player1"
    else
      "player2"
    end
  end

end