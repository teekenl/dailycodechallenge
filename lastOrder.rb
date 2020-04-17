class Log
  def initialize(n)
    @current_index = 0 
    @saved_logs = Array.new(n, nil)
    @max_size = n
  end

  def record(order_id)
    @saved_logs[@current_index] = order_id
    @current_index = (@current_index + 1 ) % @max_size
  end

  def getLast(i)
    last_index = (@max_size - i + @current_index) % @max_size
    @saved_logs[last_index] 
  end
end