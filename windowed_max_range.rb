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

class MyQueue
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
#enqueue is O(n)
#dequeue is O(1)
#all other methods are O(1)

class MyStack 
    def initialize
        @store = []
    end
    def peek
        @store[-1]
    end
    def size
        @store.length
    end
    def empty
        @store.empty?
    end
    def push(ele)
        @store.push(ele)
    end
    def pop
        @store.pop
    end
end

class StackQueue #[1,2,3,4,5] [1,2,3,4,5]
    #[]
    def initialize
        queue_stack = MyStack.new
        temp_stack = MyStack.new
    end

    def size(stack)
        stack.length
    end
    def empty?(stack)
        stack.empty?
    end
    def enqueue(big_ele)
        while !queue_stack.empty?
            ele = queue_stack.pop
            temp_stack.push(ele)
        end
        queue_stack.push(big_ele)
        while !temp_stack.empty?
            ele2 = temp_stack.pop
            queue_stack.push(ele2)
        end
    end
    def dequeue
        if queue_stack.empty?
            print "Queue is empty"
            return
        end
        queue_stack.pop
    end
end