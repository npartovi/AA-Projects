require_relative "card"

class Board

  CARD_VALUES = [
    :P,
    :A,
    :B,
    :T,
    :O,
    :E,
    :Z,
    :N
  ]

attr_accessor :symbols, :grid

  def initialize
    @grid = Board.board_creator
    @symbols = CARD_VALUES
  end


  def self.board_creator
    Array.new(4) {Array.new(4)}
  end

  def random_sym
    @symbols = @symbols.shuffle
    @symbols.pop
  end

  def populate
    symbol = random_sym
    pos1 = random_pos
    pos2 = random_pos
    until empty?(pos1, pos2) && pos1 != pos2
      pos1 = random_pos
      pos2 = random_pos
    end


    self[pos1] = Card.new(symbol)
    self[pos2] = Card.new(symbol)
  end

  def render
    @grid.each do |row|
      display_row(row)
    end
  end

  def won?
    grid.all? do |row|
      row.all? {|card| card.face_up == true}
    end
  end

  def display_row(row)
    chars = row.map do |char|
      if char.face_up == false
        "X"
      else
        char.value
      end
    end

    puts "#{chars.join(" ")}"
  end

  def empty?(pos1, pos2)
    if self[pos1] == nil && self[pos2] == nil
      return true
    else
      return false
    end
  end

  def fill_board

    until full?
      populate
    end
  end

  def full?
    @grid.none? {|el| el.include?(nil)}
  end

  def random_pos

    row = rand(0...@grid.length)
    col = rand(0...@grid.length)

    [row, col]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end


  def pull_card(pos)
    self[pos]
  end

  def reveal(pos)
    self[pos].face_up = true
  end

  def hide(pos)
    self[pos].face_up = false
  end






end

# if __FILE__ == $PROGRAM_NAME
#   board = Board.new
#   board.fill_board
#   board.render
#   p board.won?
#
# end
