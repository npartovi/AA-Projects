require 'byebug'

def range(start, stop)
  (start...stop).map {|num|  num}
end

def range(start, stop)

  return [] if stop < start
  return [start] if stop == start + 1

  start_arr = [start]

  start_arr + range(start + 1,stop)
end

def prime_factorization(num)

   return [] if num == 1

  (2..Math.sqrt(num).ceil).each do |i|
    if num % i == 0
      return [i] + prime_factorization(num/i)
    end
  end

  return [num]



end


# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
def exponent(b, n)
  return 1 if n == 0

  if n > 0
    b * exponent(b, n - 1)
  else
    1.0/b * exponent(b, n + 1)
  end
end


def exp(b,n)
  return 1 if n == 0

  b * exp(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0

  if n.even?
    exp(b, n/2) * exp(b, n/2)
  else
    b * (exp(b, (n-1) / 2) * (exp(b, (n-1) / 2)))
  end
end

# p exp(0, 1)
# p exp2(2, 256)

class Array

  def deep_dup

    results = []

    self.each do |el|
      if el.is_a?(Array)
        results << el.deep_dup
      else
        results << el
      end
    end

    results
  end

end


def fibonacci(n)
  return [1, 1] if n == 1
  sum = fibonacci(n-1)[-1] + fibonacci(n-1)[-2]
  fibonacci(n-1) << sum
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)
# p fibonacci(7)
# p fibonacci(8)


def subsets(arr)
  return [[]] if arr.empty?

  last_el = arr.last
  results = []


  subsets(arr[0..-2]).each do |el|
    sub_arr = el << last_el
    results << sub_arr
  end

  subsets(arr[0..-2]) + results
end

# p subsets([]) # => [[]]
subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])

def permutations(arr)
  arr = arr.dup
  return [arr] if arr.length == 1

  last_el = arr.pop
  base = permutations(arr) # [[1]]

  results = []
  base.each do |perm|
    (perm.length + 1).times do |i|
      result = perm[0...i] + [last_el] + perm[i..-1]
      results << result
    end
  end

  results
end

#
# p permutations([1]) ## this will output [[1]]
# p permutations([1,2]) ## [[1,2], [2,1]]
# p permutations([1,2, 3]) ## [[1,2], [2,1]]

class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target, &prc)

    prc ||= Proc.new {|x,y| x <=> y}

    if self.length == 1 && prc.call(self[0], target) != 0
      return nil
    end

    mid = self.length / 2

    if prc.call(self[mid], target) == 0
      return mid
    elsif prc.call(self[mid], target) == 1
      self[0...mid].my_bsearch(target, &prc)
    else
      bsearch = self[mid + 1..-1].my_bsearch(target, &prc)
      if !bsearch.nil?
        mid + 1 + bsearch
      end
    end


    
  end
end

def binary_search(arr, target)

  mid_idx = arr.length / 2
  mid_el = arr[mid_idx]

  return nil if arr.empty?
  return mid_idx if mid_el == target
  return nil if arr.length == 1 && mid_el != target


  if target > mid_el
    sub_arr = arr[(mid_idx + 1)..-1]
    right = binary_search(sub_arr, target)
    return nil if right.nil?
    mid_idx + 1 + right
  else
    sub_arr = arr[0...mid_idx]
    binary_search(sub_arr, target)
  end

end

class Array
  def merge_sort

    return self if self.length <= 1

    mid_idx = self.length / 2

    left = self[0...mid_idx].merge_sort
    right = self[mid_idx..-1].merge_sort

    merge(left,right)
    
  end

  def merge(left, right)

    result = []

    until left.empty? || right.empty?
      case left.first <=> right.first
      when -1
        result << left.shift
      when 0
        result << left.shift
        result << right.shift
      when 1
        result << right.shift
      end
    end

    result + left + right
   
  end
end


p [3,7,1,9,4,6].merge_sort

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
