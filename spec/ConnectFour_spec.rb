# Tests for the functions of ConnectFour

require_relative "../lib/ConnectFour"

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

  # describe "make_move" do
  #   it "places piece at bottom of column" do
      
  #     expect(true).to eq(true)
  #   end

  #   it "properly stacks pieces" do
      
  #     expect(true).to eq(true)
  #   end
  # end

  # describe "check_win" do
  #   it "registers horizontal win" do
      
  #     expect(true).to eq(true)
  #   end

  #   it "registers vertical win" do
      
  #     expect(true).to eq(true)
  #   end

  #   it "registers diagonal win" do
      
  #     expect(true).to eq(true)
  #   end

  #   it "registers no win" do
      
  #     expect(true).to eq(true)
  #   end
  # end

  # describe "to_s" do
  #   it "Prints board content correctly" do
      
  #     expect(true).to eq(true)
  #   end
  # end
end
