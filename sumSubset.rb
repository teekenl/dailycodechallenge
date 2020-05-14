def subset_for_sum(nums, k)
  return if nums.size <= 0
  if nums[0] == k
    return [nums[0]]
  end
  
  result = 0 
  first = subset_for_sum(nums[1..-1], k - nums[0]) 

  if first 
    result = [nums[0]] + first
  else
    result = subset_for_sum(nums[1..-1], k)
  end

  result
end

# subset_for_sum([12, 1, 61, 5, 9, 2], 24) #=> [12, 1, 9, 2]