require_relative "tile"
require "colorize"

class Board

  attr_reader :inputted_board
  attr_accessor :grid

  def initialize
    # @inputted_board = Board.file_parse
    @grid = Board.board_creator
  end

  def self.board_creator
    inputted_board = Board.file_parse

    new_arr = Array.new(9) {Array.new(9)}
    (0..8).each do |idx|
      (0..8).each do |idx2|
        input = inputted_board[idx][idx2]
        new_arr[idx][idx2] = Tile.new_tile(input.to_i)
      end
    end
    new_arr
  end


  def self.file_parse
    input = File.readlines("sudoko_1.txt").map(&:chomp)
    input.map {|row| row.chars}
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def render
    @grid.each {|row| display(row)}
  end

  def display(row)

    row_symbols = row.map do |el|
      if el.number == nil
        " "
      else
        el.number.to_s.colorize(:blue)
      end
    end

    puts row_symbols.join(" | ")
    puts "----------------------------------"

  end


  # def populate_board
  #   (0..8).each do |idx|
  #     (0..8).each do |idx2|
  #       pos = [idx, idx2]
  #       input = @inputted_board[idx][idx2]
  #       self[pos] = Tile.new_tile(input.to_i)
  #     end
  #   end
  # end

end

if __FILE__ == $PROGRAM_NAME

  board = Board.new
  board.render
end
