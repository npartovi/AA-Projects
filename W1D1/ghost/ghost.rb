require "byebug"

class Game

  GHOST_HASH = {
    0 => "",
    1 => "G",
    2 => "GH",
    3 => "GHO",
    4 => "GHOS",
    5 => "GHOST"
  }

  attr_accessor :player1, :player2, :fragment, :dictionary, :current_player, :player1_record, :player2_record

   def initialize (player1,player2)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    @dictionary = Game.dictionary_parse
    @current_player = @player1
    @player1_record = 0
    @player2_record = 0
  end

  def record
    ghost = 'GHOST'.chars


  end

  def self.dictionary_parse

    File.readlines('dictionary.txt').map {|word| word.chomp}

  end

  def play_round

    until over?
      puts "******************"
      puts "#{@player1}"
      p GHOST_HASH[@player1_record]

      puts "#{@player2}"
      p GHOST_HASH[@player2_record]
      puts "******************"
      puts "Current Fragment word #{@fragment} "
      puts "******************"
      take_turn
      if valid_play?
        switch_player
      else
        puts "That was not a valid word. You lose"
        break
      end
      system("clear")
    end

    puts "#{current_player} is the smartest person alive. Losers gets a letter"

    if current_player == player1
      @player2_record += 1
    else
      @player1_record += 1
    end



  end


  def valid_play?


    @dictionary.each do |word|
      return true if word.start_with?(@fragment)
    end

    false

  end


  def over?


    @dictionary.each do |word|
      return true if word == @fragment
    end

    false

  end

  def switch_player

    if @current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end

  end

  def take_turn

    puts "#{@current_player} please enter in a letter"
    letter = gets.chomp

    @fragment << letter
  end

end


if __FILE__ == $PROGRAM_NAME

  game = Game.new('Nima', 'Lena')

  game.play_round


end
