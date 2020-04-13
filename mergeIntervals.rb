
def merge(intervals)
  # sort interval first to be in ascending order.
  intervals = intervals.sort_by {|interval| interval[0] }

  current_interval = intervals[0]
  output_intervals = []
  output_intervals << current_interval
  
  intervals.each do |interval|
    current_begin = current_interval[0]
    current_end = current_interval[1]
    next_begin = interval[0]
    next_end = interval[1]

    if current_end >= next_begin
      current_interval[1] = [next_end, current_end].max
    else
      current_interval = interval
      output_intervals << current_interval
    end
  end

  output_intervals
end 