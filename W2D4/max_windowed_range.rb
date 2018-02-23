def windowed_max_range(arr, window_size)

  current_max_range = nil

  i = 0

  while i < arr.length - (window_size - 1)
    min = arr[i..(window_size - 1) + i].min
    max = arr[i..(window_size - 1) + i].max
    sum = max - min

    if current_max_range.nil? || sum > current_max_range
      current_max_range = sum
    end
    i += 1
  end

  current_max_range

end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
    el
  end

  def dequeue
    @store.shift(el)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  attr_accessor :max

  def initialize
    @store = []
    @max = nil
  end

  def push(el)
    # @store << el
    # el
    if @max.nil? || el > max
      @store.push(max)
      @max = el
      @store.push(el)
    else
      @store.push(el)
    end
    el
  end

  def pop

    # @store.pop
    el = @store.pop
    if el == @max
      @max = @store.pop
    end
    el
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
    el
  end

  def dequeue
    until @stack1.empty?
      @stack2.push( @stack1.pop)
    end

    el = @stack2.pop

    until @stack2.empty?
      @stack1.push( @stack2.pop)
    end

    el
  end

  def size
    @stack1.size
  end

  def empty?
    @stack1.empty?
  end
end
