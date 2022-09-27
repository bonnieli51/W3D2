require_relative "board.rb"

class Board

  def initialize(size = 4)
    @board = Array.new(size) {Array.new(size)}
  end

  def populate
    ['A','B','C','D','E','F','G','H'].each do |value|
      card_1 = Card.new(value)
      pos_1 = [[0..3].sample,[0..3].sample]
      while board[pos] != []
        pos_1 = [[0..3].sample,[0..3].sample]
      end
      @board[pos_1] = card_1
      
      card_2 = Card.new(value)
      pos_2 = [[0..3].sample,[0..3].sample]
      while board[pos] != []
        pos_2 = [[0..3].sample,[0..3].sample]
      end
      @board[pos_2] = card_2
    end
  end

  def [](pos)
    @board[pos[0]][pos[1]]
  end

  def []=(pos,value)
    @board[pos[0]][pos[1]] = value
  end
end
