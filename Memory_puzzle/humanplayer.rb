require_relative "card.rb"
require_relative "board.rb"

class HumanPlayer

  def initialize
 
  end

  def make_guess
    guessed_pos = self.prompt
    @board.reveal(guessed_pos)
    @board[guessed_pos]
  end

  def prompt
    p 'Enter the position, separated by spaces'
    input = gets.chomp
    nums = ['0','1','2','3']
    if nums.include?(input[0]) && input[1] == ' ' && nums.include?(input[2])
      pos = [input[0].to_i,input[2].to_i]
    else
      raise 'Enter something correctly, you idiot!'
    end
  end
end