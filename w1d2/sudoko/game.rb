require_relative "board"
require_relative "tile"

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play
    @board.render
    until #win?
      #take_turn


  end

  def gets_position
    puts 'Where would you like to go:'
    pos = gets.chomp.split(",").map(&:to_i)
    until #valid_pos?(pos)
      pos = gets.chomp.split(",").map(&:to_i)
    end
    pos
  end


  def valid_pos?(pos)
    p @board[pos]
  end

  def take_turn
    #Takes two inputs (grid location, value)
    pos = gets_position
    number = gets_number
    inputs_new_number(pos, number)
end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
