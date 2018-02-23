#time complexity O(n**2)
#space complexity O(n)
def two_sum?(arr, target)
  arr.each_index do |i|
    arr.each_index do |j|
      if i != j && arr[i] + arr[j] == target
        return true
      end
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

#time complexity O(n)
#space complexity O(n)
def okay_two_sum?(arr, target)

  arr = arr.sort!

  i = 0
  j = arr.length - 1

  while i < j
    sum = arr[i] + arr[j]
    if sum < target
      i += 1
    elsif sum > target
      j -=1
    else
      return true
    end
  end
  false
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false




def two_sum_hash?(arr, target)

  hash = Hash.new(0)

  arr.each do |el|
    value = target - el
    if hash.has_key?(value)
      return true
    else
      hash[el] = true
    end
  end

  false

end

p two_sum_hash?(arr, 6)
p two_sum_hash?(arr, 10)
