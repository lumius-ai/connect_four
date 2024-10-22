# Tests for the functions of ConnectFour

require_relative "../lib/ConnectFour"

require 'pry-byebug'

describe ConnectFour do
  black = "\u26ab".encode('utf-8')
  white = "\u26aa".encode('utf-8')

  describe "Constructor" do
    b1 = ConnectFour.new({:current_player =>'b'})
    b2 = ConnectFour.new({:current_player => "2"})
    b3 = ConnectFour.new()

    board = Array.new(4){Array.new(4)}
    b4 = ConnectFour.new({:board => board})

    it "Inits starting player correctly" do
      
      expect(b1.current_player).to eq(black)
    end

    it "rejects bad arguments" do
      
      expect(b2.current_player).to eq(nil)
    end

    it "takes default arguments" do
      
      expect(b3.current_player).to eq(white)
    end

    it "takes custom board" do

      expect(b4.board).to eq(board)
    end
  end

  describe "make_move" do
    b1 = ConnectFour.new()


    it "places piece at bottom of column" do
      b1.make_move(0)
      expect(b1.board[0][3]).to eq(white)
    end

    it "properly stacks pieces" do
      b1.make_move(0)
      b1.make_move(0)
      expect(b1.board[0][1]).to eq(white)
    end

    it "swaps player after move" do

      expect(b1.current_player).to eq(black)
    end
  end

  describe "check_win" do
    vwin = ConnectFour.new(:board => [[nil, nil, nil, "⚪"], [nil, nil, nil, "⚪"], [nil, nil, nil, "⚪"], [nil, nil, nil, "⚪"]])
    hwin = ConnectFour.new(:board => [["⚪", "⚪", "⚪", "⚪"], [nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil]])
    dwin = ConnectFour.new(:board => [["⚪", nil, nil, nil], [nil, "⚪", nil, nil], [nil, nil, "⚪", nil], [nil, nil, nil, "⚪"]])
    no_win = ConnectFour.new(:board => [[nil, nil, nil, "⚪"], [nil, nil, nil, nil], [nil, nil, nil, nil], [nil, nil, nil, nil]])

    it "registers horizontal win" do
      
      expect(hwin.check_win).to eq("w")
    end

    it "registers vertical win" do
      
      expect(vwin.check_win).to eq("w")
    end

    it "registers diagonal win" do
      
      expect(dwin.check_win).to eq("w")
    end

    it "registers no win" do
      
      expect(no_win.check_win).to eq(nil)
    end
  end

end
