
class PriorityQueue
  def initialize(elements = nil, &block)
    @queue = []
    @comparison = block || lambda{|a, b|  a <=> b }

    replace(elements) if elements
  end

  def replace(elements)
    @queue.replace(elements)
    sort!

    self
  end

  def size
    @queue.size
  end

  def clear
    @queue.clear
  end
  
  def empty?
    @queue.size <= 0 
  end

  def remove
    return nil if @queue.empty?

    @queue.shift
  end
  
  def elements
    @queue
  end

  def peek
    return nil if empty?
    @queue.last
  end

  def reheap(k)
    return self if size <= 1

    que = @queue.dup

    v = que.delete_at(k)
    i = binary_index(que, v)

    que.insert(i, v)
    @queue = que

    return self
  end

  def binary_index(que, target)
    upper = que.size - 1
    lower = 0

    while(upper >= lower) do 
      idx = lower + (upper - lower) / 2
      comparison = @comparison.call(target, que[idx])

      case comparison
      when 0, nil
        return idx
      when 1, true
        lower = idx + 1
      when -1, false
        upper = idx - 1
      end
    end

    lower
  end

  def sort!
    @queue.sort! do |a, b|
      case @comparison.call(a, b)
      when 0 , nil then 0 
      when 1, true then 1 
      when -1, false then -1
      else 
        raise "invalid comparison value"
      end
    end

    self
  end

  def insert(v)
    @queue << v
    reheap(@queue.size - 1)

    self
  end
end

def kthLargest(nums, k)
  minHeap = PriorityQueue.new

  nums.each do |num|
    minHeap.insert(num)
    if minHeap.size > k
      minHeap.remove
    end
  end

  minHeap.remove
end
