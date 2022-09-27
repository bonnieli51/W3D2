require_relative "card.rb"
require_relative "board.rb"
require_relative "humanplayer.rb"
require_relative "computerclass.rb"
require "byebug"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @board.populate
    @player_1 = HumanPlayer.new
    @computer = ComputerClass.new
    @current_player = @player_1
  end

  def switch_players!
    if @current_player == @player_1
      @current_player = @computer
    else
      @current_player = @player_1
    end
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
      previous_guess = make_guess
      @board.render
      sleep(1)
      this_guess = make_guess#make_guess wil return card instace at pos
      #while previous_guess == this_guess
        # debugger
      #  this_guess = make_guess
      #end
      @board.render
      sleep(1)
      if previous_guess.value == this_guess.value
        p "you got a match YAY"
        @computer.delete(this_guess.value)
        @current_player.score += 1  
      else 
        p "Boooooooo"
        previous_guess.hide
        this_guess.hide
      end
      system("clear")
      switch_players!
      #p @computer.known_cards
    end
    p "Game over!"
    p "Player 1 got #{@player_1.score} points!"
    p "Computer got #{@computer.score} points!"
  end


  def make_guess
    guessed_pos = @current_player.prompt
    while !@board[guessed_pos].facedown
      p 'Enter a valid position'
      guessed_pos = @current_player.prompt
    end
    letter = @board.reveal(guessed_pos)
    @computer.add(guessed_pos,letter)
    @board[guessed_pos]
  end
  
end

game_1 = Game.new
game_1.play