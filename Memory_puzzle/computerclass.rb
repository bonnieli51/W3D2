require_relative "card.rb"
require_relative "board.rb"
require_relative "humanplayer.rb"
require_relative "computerclass.rb"


class ComputerClass
  attr_reader :known_cards

  def initialize
    @known_cards = Hash.new {|h,k| h[k] = []}
  end

  def add(pos, letter)
    @known_cards[letter] << pos if !@known_cards[letter].include?(pos)
  end

  def prompt
    if !has_match?
      rand_pos = [[0,1,2,3].sample,[0,1,2,3].sample]
    else
      positions = @known_cards[has_match?] #array with two positions
      debugger
      positions.each do |pos|
        return pos if @board[pos].facedown
      end
      # positions[[0,1].sample]
    end
  end

  def delete(letter)
    @known_cards.delete(letter)
  end


  def has_match?
    @known_cards.each { |k,v| return k if v.length == 2 }
    false
  end

end

