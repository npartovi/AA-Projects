class Array

  def my_each(&prc)

    i = 0

    while i < self.length
        prc.call(self[i])
        i += 1
    end

    self

  end

  def my_select(&prc)

    new_arr = []

    self.my_each do |num|
      new_arr << num if prc.call(num)
    end

    new_arr

  end

  def my_reject(&prc)

    new_arr = []

    self.my_each do |num|
      new_arr << num unless prc.call(num)
    end

    new_arr

  end

  def my_any?(&prc)



    self.my_each do |num|
      return true if prc.call(num)
    end

    false
  end

  def my_all?(&blk)
    self.my_each do |num|
      return false unless blk.call(num)
    end
    true
  end

  def my_flatten(new_array =[])

    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten(new_array)
      else
        new_array << el
      end

    end
      new_array
  end

  def my_zip(*args)

    new_array = []

    self.length.times do |time|
      sub_arr = [self[time]]

      args.my_each do |arg|
        sub_arr << arg[time]
      end

      new_array << sub_arr
    end

    new_array

  end

  def my_rotate(rotate = 1)
    new_rotate = rotate % self.length
    self.drop(new_rotate) + self.take(new_rotate)



  end

  def my_join(sep = '')
    new_str = ''
    self.each_with_index do |letter, idx|
      if idx == self.length - 1
        new_str << letter
      else
        new_str << letter + sep
      end
    end
    new_str
  end

  def my_reverse
    results = []
    self.each do |letter|
      results.unshift(letter)
    end
    results
  end

  def bubble_sort(&prc)

    sorted = false
    until sorted
      sorted = true
      self.each_index do |i|
        break if self[i+1].nil?
        if prc
          if prc.call(self[i],self[i +1]) == 1
            self[i], self[i + 1] = self[i + 1], self[i]
            sorted = false
          end

        else self[i] > self[i + 1]
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end




end

def substrings(string)
   new_arr = []
   string_array = string.chars
   string_array.each_index do |i|
     string_array.each_index do |j|
       new_arr << string[i..j]
     end
   end
   new_arr
end

def subwords(word, dictionary)

  combinations = substrings(word)
  combinations.select {|el| dictionary.include?(el)}
end
p subwords('cat', ['cat','dog','tiger'])



  def factors(num)
    (1..num).select {|digit| num % digit == 0}
  end
  # p factors(10)

#
# p [1, 3, 5].bubble_sort { |num1, num2| num1 <=> num2 } #sort ascending
# p [1, 3, 5].bubble_sort { |num1, num2| num2 <=> num1 } #sort descending

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
# p a = [ "a", "b", "c", "d"]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
# p a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
#
# p c = [10, 11, 12]
# p d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
