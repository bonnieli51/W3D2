require_relative "card.rb"
require "byebug"

class Board

  def initialize(size = 4)
    @board = Array.new(size) {Array.new(size)}


    
  end

  def populate
    ['A','B','C','D','E','F','G','H'].each do |value|
      2.times do
        card_1 = Card.new(value)
        pos_1 = [[0,1,2,3].sample,[0,1,2,3].sample]
        while self[pos_1] != nil
          pos_1 = [[0,1,2,3].sample,[0,1,2,3].sample]
        end
        self[pos_1] = card_1
      end
      
      # card_2 = Card.new(value)
      # pos_2 = [[0..3].sample,[0..3].sample]
      # while self[pos_2] != nil
      #   pos_2 = [[0..3].sample,[0..3].sample]
      # end
      # @board[pos_2] = card_2
    end
  end

  def render
    puts "  0 1 2 3"
    @board.each_with_index do |row,i|
      new_row = [i]
      row.each do |el| 
        if el.facedown
          new_row << ' '
        else
          new_row << el.value
        end
      end
      puts new_row.join(" ") 
    end
  end
    
  def won?
    flattened = @board.flatten
    flattened.all? { |el| !el.facedown }
  end

  def reveal(guessed_pos)
    @board[guessed_pos[0]][guessed_pos[1]].reveal
  end

  def [](pos)
    @board[pos[0]][pos[1]]
  end

  def []=(pos,value)
    @board[pos[0]][pos[1]] = value
  end
end

# board_1 = Board.new
# board_1.populate
# board_1.render
# p board_1.won?