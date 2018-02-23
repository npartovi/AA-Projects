#time complexity O(n!) --permutation
#space complexity O(n!)
def first_anagram?(str1, str2)
  arr1 = str1.chars.permutation.to_a
  arr_str2 = str2.chars

  arr1.include?(arr_str2)
end

first_anagram?("elvis", "lives")
first_anagram?("gizmo", "sally")


#time complexity O()
#space complexity O(n)
def second_anagram?(str, str2)

  return true if str.empty? && str2.empty?

  str = str.chars.sort.join
  str2 = str2.chars.sort.join

  if str[0] == str2[0]
    second_anagram?(str[1..-1], str2[1..-1])
  else
    return false
  end

end

second_anagram?("elvis", "lives")
second_anagram?("gizmo", "sally")


#time complexity O(nlogn)
#space complexity O(n)
def third_anagram?(str,str2)
  str.chars.sort == str2.chars.sort
end

# p third_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")


#time complexity O(n)
#space complexity O(n)
def fourth_anagram?(str, str2)

  str_hash = hash_creator(str)
  str2_hash = hash_creator(str2)

  str_hash.each do |k,v|
    return false unless str2_hash.has_key?(k)
    if v != str2_hash[k]
      return false
    end
  end
  # true
  str2_hash.each do |k, v|
    return false unless str_hash.has_key?(k)
    if v != str_hash[k]
      return false
    end
  end

  return true
end



def hash_creator(str)

  hash = Hash.new(0)

  str.chars.each do |char|
    hash[char] += 1
  end

  hash
end


#time complexity O(n)
#space complexity O(n)
def fifth_anagram?(str, str2)
  return false unless str.length == str2.length
  str_hash = hash_creator(str)

  str_hash.each do |k,v|
    return false unless str.include?(k)
    if str2.count(k) != v
      return false
    end
  end

  true
end

fourth_anagram?("elvis", "lives")
fourth_anagram?("gizmo", "sally")
fourth_anagram?("ab", "abc")


p fifth_anagram?("elvis", "lives")
p fifth_anagram?("gizmo", "sally")
p fifth_anagram?("ab", "abc")
