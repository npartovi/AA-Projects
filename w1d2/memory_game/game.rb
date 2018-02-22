require_relative "board"
# require_relative "card"

class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    # @card = Card.new
  end

  def play
    board.fill_board

    until board.won?
      take_turn
    end

      puts "Congratz you won!!!!!!!"

  end

  def cards_not_equal?(pos1, pos2)

    return true if board.pull_card(pos1).value != board.pull_card(pos2).value
    false

  end


  def take_turn
    puts "Please enter first position"
    pos1 = gets.chomp.split(',').map(&:to_i)
    board.reveal(pos1)
    board.render
    puts "Please enter second position"
    pos2 = gets.chomp.split(",").map(&:to_i)
    board.reveal(pos2)
    board.render

    if cards_not_equal?(pos1, pos2)
      board.hide(pos1)
      board.hide(pos2)
      puts "You did not get a match"
    else
      puts "You got a match"
    end





  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
