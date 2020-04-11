def iterative(nums)
  return 0 if !nums
  return nums[0] if nums.size <= 1
  
  prev_inclusive = prev_exclusive = 0

  nums.each do |num|
    temp = prev_inclusive

    prev_inclusive = [prev_exclusive + num, prev_inclusive].max
    prev_exclusive = temp
  end

  [prev_exclusive, prev_inclusive].max
end

def recursive_helper(inclusive, exclusive, arr)
  return [inclusive, exclusive].max if arr.empty?

  nInclusive = [inclusive, exclusive + arr[0]].max
  nExclusive = [inclusive, exclusive].max
  
  recursive_helper(nInclusive, nExclusive, arr[1..-1])
end

def recursive(nums)
  recursive_helper(nums[0], 0, nums[1..-1])
end