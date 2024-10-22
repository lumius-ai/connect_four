require_relative "lib/ConnectFour"

def main()
  player = nil

  while player == nil
    puts("Choose b or w")
    p = gets.chomp.downcase()
    if p == "b" or p == "w"
      player = p
    end
  end

  game_board = ConnectFour.new({:current_player => player})
  
  while game_board.check_win() == nil
    puts(game_board)
    puts("#{game_board.current_player} current move. Enter (column) 0-3, q to quit")
    move = gets.chomp
    move = move.split(" ")
    if move.length != 1
      puts("Move: (column)")
      next
    elsif move == "q"
      return
    end

    if game_board.make_move(move) == false
      puts("Invalid move!")
      next
    end
    
  end
  puts(game_board)
  puts("#{game_board.check_win()} wins!")
end

main()