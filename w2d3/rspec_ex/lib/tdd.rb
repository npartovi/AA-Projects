class Array
  def my_uniq
    result = []

    self.each do |el|
      result << el unless result.include?(el)
    end

    result
  end

  def two_sum
    result = []

    self.each_index do |i|
      self.each_index do |j|
        next if j <= i
        if self[i] + self[j] == 0
          result.push([i,j])
        end
      end
    end

    result
  end
end

def my_transpose(arr)
  transposed  = []

  arr[0].each { |el| transposed.push([el]) }

  arr[1..-1].each_with_index do |row, i|
    row.each_index do |j|
      transposed[j].push(row[j])
    end
  end


  transposed
end

def stock_picker(arr)
  biggest_profit = arr[1] - arr[0]
  profit_days = [0,1]

  # arr.each_index do |i|
  #   arr.each_index do |j|
  #     if arr[j] - arr[i] > biggest_profit
  #       biggest_profit = arr[j] - arr[i]
  #       profit_days = [i,j]
  #     end
  #   end
  # end


  i = 0

  while i < arr.length
    j = i + 1

    while j < arr.length
      if arr[j] - arr[i] > biggest_profit
        biggest_profit = arr[j] - arr[i]
        profit_days = [i,j]
      end
      j += 1
    end

    i += 1
  end

profit_days
end
