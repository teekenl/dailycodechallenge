
def insert(intervals, new_interval)
  return [] if !intervals

  current_interval = new_interval
  outputs_intervals = [] << current_interval

  intervals.each do |interval|
    if current_interval[1] < interval[0] || interval[1] < current_interval[0]
      outputs_intervals << interval
    else
      current_interval[0] = [interval[0], current_interval[0]].min
      current_interval[1] = [interval[1], current_interval[1]].max
    end
  end

  outputs_intervals
end