def largestSum(nums)
  current = 0
  previous_max = 0
  start = stop = 0

  nums.each_with_index do |num, index|
    current = num + current
    if current < 0
      start = i + 1
    end

    if previous_max < current
      previous_max = current
      stop = index
    end
  end
end
