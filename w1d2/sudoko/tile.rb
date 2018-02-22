class Tile

  attr_reader :number
  attr_accessor :given

  def initialize(value, given)
    @number = value
    @given = given
  end

  def self.new_tile(value)
    if value == 0
      Tile.new(nil, false)
    else
      Tile.new(value, true)
    end
  end

  def to_s
    self.number
  end

end
