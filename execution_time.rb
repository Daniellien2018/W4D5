def my_min1(arr)
    
    arr.each do |i|
        arr.each do |j|
            if j < i 
                min = j
            end
        end
    end
end

def my_min2(arr)
    min = arr[0]
    arr.each do |j|
        if j < min
            min = j
        end
    end
    min
end

def largest_contiguous_subsum(arr)
    new_arr = []
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if j >= i
                subset = arr[i..j]
                new_arr << subset
            end
        end
    end

    max = new_arr[0].sum
    new_arr.each do |subset|
        if subset.sum > max
            max = subset.sum
        end
    end
    return max
end
# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8

def largest_contiguous_subsum2(arr)
    current_max = arr[0]
    current_sum = 0
    arr.each_with_index do |ele, i|
        current_sum += ele
        current_max = current_sum if current_sum > current_max
        
        if current_sum < 0 
            current_sum = 0
        end
       
    end
    current_max
    
end

list = [2, 3, -6, 7, -6, 7]
list2 = [-2,-3,-1,-5]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
p largest_contiguous_subsum2(list2) 