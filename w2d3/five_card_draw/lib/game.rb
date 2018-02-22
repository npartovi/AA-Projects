require 'deck'
require 'player'

class Game
  def initialize(*players)
    @players = players
  end

  def play
    until won?
      play_round
    end

    puts "Game over."
  end

  def play_round
    @deck = Deck.new
    @deck.shuffle!

    self.deal_hands
    # players bet
    # prompt for action
    # process actions
    # bet again
    # process wins (which hand won?)
    # award pot to winning hand
  end

  def deal_hands
  end

  def won?
    pot_max = 0
    @players.each { |player| pot_max += player.pot }
    
    @players.any? { |player| player.pot == pot_max }
  end
end
