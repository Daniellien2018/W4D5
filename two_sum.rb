def bad_two_sum?(arr,target)
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j > i     
                if ele1 + ele2 == target
                    return true
                end
            end
        end
    end
    return false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false
#O(n^2) in time
#O(1) in space

def okay_two_sum?(arr, target)
    sorted = arr.sort

end
# arr = [0, 1, 5, 7]
#lowerbound is O(nlogn) due to sort method (quicksort)

def two_sum?(arr, target)
    hash = {}
    arr.each do |ele|
        look = target - ele
        if hash.has_key?(look)
            return true
        end

        if !hash.has_key?(ele) 
            hash[ele] = true
        end

    end
    return false
end
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
#O(n) in time
#O(n) in space 