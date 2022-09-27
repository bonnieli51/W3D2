require_relative "card.rb"
require_relative "board.rb"
require_relative "humanplayer.rb"
require "byebug"

class Game

  def initialize
    @board = Board.new
    @board.populate
    @player_1 = HumanPlayer.new
  end

  def over?
    # debugger
    @board.won?
  end

  def play
    turns = 0
    while !self.over?
      @board.render
      turns += 1
      previous_guess = @player_1.make_guess
      @board.render
      this_guess = @player_1.make_guess#make_guess wil return card instace at pos
      @board.render
      sleep(1)
      if previous_guess.value == this_guess.value
        p "you got a match YAY"
      else 
        p "Boooooooo"
        previous_guess.hide
        this_guess.hide
      end
      system("clear")
    end
    p "You win!  It only took you #{turns} turns!"
  end
  
end

game_1 = Game.new
game_1.play