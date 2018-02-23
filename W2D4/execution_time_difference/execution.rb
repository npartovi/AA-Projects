
# time- complexity O(n**2)
# space-complexity = 1 => O(1)
def my_min_1(arr)
  arr.each_index do |i|
    min = true
    arr.each_index do |j|
      next if i == j
      if arr[j] < arr[i]
        min = false
      end
    end
    return arr[i] if min
  end
end

# time-complexity O(n)
# space-complexity O(1)
def my_min_2(arr)
  min = arr.first

  arr.each do |el|
    if el < min
      min = el
    end
  end

  min

end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_1(list)
# p my_min_2(list)


# time-complexity O(n ** 2)
# space-complexity O(n)

def largest_contiguous_subsum(list)
  max = nil

  list.each_index do |i|
    list.each_index do |j|
      next if j < i
      sum = list[i..j].reduce(:+)
      max = sum if max.nil? || sum > max
    end
  end
  max
end

arr = [5,3,-7]
arr2 = [2, 3, -6, 7, -6, 7]
arr3 = [-5, -1, -3]

# p largest_contiguous_subsum(arr)
# p largest_contiguous_subsum(arr2)
# p largest_contiguous_subsum(arr3)


#time-complexity O(n)
# space-complixty O(n)
def largest_contiguous_subsum_2(arr)
  localmax = arr[0]
  globalmax = arr[0]

  i = 1
  while i < arr.length
    localmax = [localmax + arr[i], arr[i]].max
    globalmax = [globalmax, localmax].max
    i += 1
  end
  globalmax
end

p largest_contiguous_subsum_2(arr)
p largest_contiguous_subsum_2(arr2)
p largest_contiguous_subsum_2(arr3)
