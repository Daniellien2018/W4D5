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
    sorted.each_with_index do |ele, i|
        look = target - ele
        look_index = binary_search(sorted, look) 
        if look_index != i && !look_index.nil?
            return true
        end 
    end
    false
end

def binary_search(array, target)
    return nil if array.length == 0
    mid = array.length / 2

    case array[mid] <=> target
    when 0
        return mid
    when 1
        left = array.take(mid)
        binary_search(left,target)
    when -1
        right = array.drop(mid + 1)
        res = binary_search(right, target)
        if res.nil?
            nil
        else
            mid + 1 + res
        end
    end
end

arr = [0, 1, 5, 7]
p binary_search(arr, 7) # => should be true
p binary_search(arr, 8) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
#
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
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false
#O(n) in time
#O(n) in space 