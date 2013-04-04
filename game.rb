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

  # Begin untested gameplay ---

  def print_board
    score = @current_score
    a = score[0][0]
    b = score[0][1]
    c = score[0][2]
    d = score[1][0]
    e = score[1][1]
    f = score[1][2]
    g = score[2][0]
    h = score[2][1]
    i = score[2][2]
    row1 = "#{a} #{b} #{c}"
    row2 = "#{d} #{e} #{f}"
    row3 = "#{g} #{h} #{i}"
    puts "\n--------"
    puts row1
    puts row2
    puts row3
    puts "\n--------"
  end

  def player1_gameplay
    player1 = 1
    print_board
    puts "Player 1, place your piece."
    piece = gets.chomp().to_i
    place_piece(piece, player1)
  end

  def player2_gameplay
    player2 = 2
    print_board
    puts "\n--------"
    puts "Player 2, place your piece."
    piece = gets.chomp().to_i
    place_piece(piece, player2)
  end

  def play
    until game_over
      player1_gameplay
      player2_gameplay
    end
  end

# End untested gameplay ---

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