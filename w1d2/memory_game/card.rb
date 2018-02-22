class Card
# Card up/down value store it in hash(true/false)

  attr_reader :symbol, :value
  attr_accessor :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end



end
