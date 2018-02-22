class Player
  attr_reader :pot
  
  def initialize(name, pot=1_000)
    @name = name
    @pot = pot
    @current_hand = []
  end

  def discard_cards
  end

  def prompt
    puts "What do you want to do."
    action = gets.chomp
  end

  def process(action)
  end
end
