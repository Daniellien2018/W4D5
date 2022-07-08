def windowed_max_range(arr, w)
    current_max_range = nil

    i = 0 
    while i < arr.length - w + 1
        window = arr[i...i+w]
        # p window
        range = window.max - window.min
        # p range
        if current_max_range.nil?
            current_max_range = range
        end
        if range > current_max_range 
            current_max_range = range
        end
        i += 1
    end
    current_max_range

end
#O(n^2) in time 
#O(n^2) in space

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class myQueue
    # attr_reader :store
    def initialize
        @store = []
    end
    def peek
        @store[0]
    end
    def size
        @store.length
    end
    def empty
        @store.empty?
    end
    def enqueue(ele)
        @store.push(ele)
    end
    def dequeue
        @store.unshift
    end
end

def windowed_max_range(arr, w)
    queue = myQueue.new
    i = 0
    while i < w
        enqueue(arr[i])
        i += 1
    end
    while i < arr.length - w + 1

end
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
#O(n^2) in time 
#O(n) in space