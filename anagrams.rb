#permutations of str 1, if str1.include?str2
def anagram1(str1, str2)
    str1_to_a = str1.chars
    strings = str1_to_a.permutation.to_a
    strings.map! {|str| str.join("")}
    strings.include?(str2)
end

# p anagram1("gizmo", "sally")
# p anagram1("elvis", "lives")    #=> true

# time complexity of #anagram1 is O(n!)
# time complexity is still O(n!) if you increase the size of the strings
# space complexity is also O(n!)

#iter str1, find index, find idx2, delete at that index
def anagram2(str1,str2)
    str1.each_char.with_index do |char, i|
        index = str2.index(char)
        if index != nil
            str2.slice!(index)
        end
    end
    str2.empty?
end
# p anagram2("gizmo", "sally")    #=> false
# p anagram2("elvis", "lives")    #=> true
#O(n) in time
#O(1) in space

def anagram3(str1,str2)
    str1.sort == str2.sort
end
# p anagram3("gizmo", "sally")    #=> false
# p anagram3("elvis", "lives")    #=> true

#O(nlogn) in time
#O(1) in space
# #anagram3 is worse than #anagram2 because sorting the strings are done in O(nlogn) time


def anagram4(str1,str2)
    hash1 = Hash.new(0)
    str1.each_char do |char|
        hash1[char] += 1
    end
    hash2 = Hash.new(0)
    str2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2
end

p anagram4("gizmo", "sally")    #=> false
p anagram4("elvis", "lives")    #=> true
#O(n) in time
#O(n) in space

def anagram5(str1,str2)
    hash1 = Hash.new(0)
    str1.each_char do |char|
        hash1[char] += 1
    end
    hash2 = Hash.new(0)
    str2.each_char do |char|
        hash1[char] += 1
    end

    hash1.keys.length == str1.length && hash1.values.all? {|val| val.even?}
end
p anagram5("gizmo", "sally")    #=> false
p anagram5("elvis", "lives")    #=> true