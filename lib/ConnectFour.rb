# Connect four game
require 'pry-byebug'

class ConnectFour
  attr_accessor :board, :current_player

  def initialize(args = {})
    black = "\u26ab".encode('utf-8')
    white = "\u26aa".encode('utf-8')

    case args[:current_player]

    when 'b'
      @current_player = black
    when 'w'
      @current_player = white
    when nil
      @current_player = white
    else
      @current_player = nil
    end

    args[:board].nil? ? @board = Array.new(4){Array.new(4)} : @board = args[:board]
  end


  def make_move(col)
    row = 3
    col = col[0].to_i
    if not valid_move?(col)
      return false
    end

    while not @board[row][col].nil?
      row -=1
    end
    if row == -1
      return false
    else
      @board[row][col] = @current_player
      @current_player == "\u26ab".encode('utf-8') ? @current_player = "\u26aa".encode('utf-8') : @current_player = "\u26ab".encode('utf-8')
    end
  end

  def check_win
    winner = nil
    # Check for vertical win
    @board.each do |row|
      winner = check_row(row)

      if winner != nil
        return winner
      end
    end
    # Check for vertical win
    for i in 0...4
      r = [@board[0][i], @board[1][i], @board[2][i], @board[3][i]]
      winner = check_row(r)
      if winner != nil
        return winner
      end
    end

    # Check diagonal win
    d1 = [@board[0][0], @board[1][1], @board[2][2], @board[3][3]]
    d2 = [@board[3][0], @board[2][1], @board[1][3], @board[0][3]]
    winner = check_row(d1)
    if winner != nil
      return winner
    end
    winner = check_row(d2)
    if winner != nil
      return winner
    end

    # Check tie
    @board.each do |row|
      row.each do |element|
        if element == nil
          return nil
        end
      end
    end
    winner = "T"

    return winner
    
  end


  def to_s
    outstr =
    "       0  1  2  3 |\n
    0 | #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} | \n
    1 | #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} |\n
    2 | #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} |\n
    4 | #{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} |\n
    
    Current Player: #{@current_player}"

    return outstr
  end

  private
  def check_row(row)
    black = "\u26ab".encode('utf-8')
    white = "\u26aa".encode('utf-8')

    counts = {black => 0, white => 0}

    row.each do |element|
      if(counts.keys.include? element)
        counts[element] += 1
      end
    end
    if counts[black] == 4
      return "b"

    end
    if counts[white] == 4
      return "w"
    end
    return nil
  end

  def valid_move?(move)
    if move < 0 or move > 3
      return false
    end
    return true
  end
end