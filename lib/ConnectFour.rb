# Connect four game

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

  end

  def check_win

  end


  def to_s

  end

  private
  def check_row(row)

  end
end