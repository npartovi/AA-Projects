require_relative "card"

class Deck
  attr_reader :deck

  SUITS = [:heart, :diamond, :spade, :club]
  VALUES = [2,3,4,5,6,7,8,9,10,:jack,:queen,:king,:ace]

  def initialize
    @deck = self.create_deck
  end

  def create_deck

    result = []

    SUITS.each do |symbol|
      VALUES.each do |value|
        result << Card.new(symbol, value)
      end
    end

    result
  end

  def shuffle!
    @deck.shuffle!
  end

  def draw
    @deck.pop
  end
end
