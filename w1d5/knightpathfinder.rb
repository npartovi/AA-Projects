require_relative "00_tree_node"


class KnightPathFinder

  attr_reader :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def build_move_tree

  end

  def new_move_positions(pos)

    if KnightPathFinder.valid_move?(pos)
      visited_positions << pos
    end



  end


  def find_path(end_pos)

  end

  def self.valid_move?(pos)
    !visited_positions.include?(pos)
  end



end
