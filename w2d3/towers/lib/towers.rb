class TowersOfHanoi

  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start_tower, end_tower)

    if valid_play?(start_tower, end_tower)
      @towers[end_tower] << @towers[start_tower].pop
    end


  end

  def valid_play?(start_tower, end_tower)
    return false if @towers[start_tower].empty?
    return false if !@towers[end_tower].empty? && @towers[start_tower].last > @towers[end_tower].last
    true
  end

  def won?
    @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
  end


end
