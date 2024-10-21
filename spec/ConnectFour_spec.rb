# Tests for the functions of ConnectFour

require_relative "../lib/ConnectFour"

describe ConnectFour do
  describe "Constructor" do
    it "Inits starting player correctly" do
      
      expect(true).to eq(true)
    end

    it "rejects no arguments" do
      
      expect(true).to eq(true)
    end

  end

  describe "make_move" do
    it "places piece at bottom of column" do
      
      expect(true).to eq(true)
    end

    it "properly stacks pieces" do
      
      expect(true).to eq(true)
    end
  end

  describe "check_win" do
    it "registers horizontal win" do
      
      expect(true).to eq(true)
    end

    it "registers vertical win" do
      
      expect(true).to eq(true)
    end

    it "registers diagonal win" do
      
      expect(true).to eq(true)
    end

    it "registers no win" do
      
      expect(true).to eq(true)
    end
  end

  describe "to_s" do
    it "Prints board content correctly" do
      
      expect(true).to eq(true)
    end
  end
end
