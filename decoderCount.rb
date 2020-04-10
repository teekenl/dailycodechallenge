def decoderCount(nums, memo)
  return 0 if nums[0] == "0"
  return 1 if nums.size <= 1

  nums = nums.to_s

  if memo[nums.size]
    return memo[nums.size]
  end

  result = decoderCount(nums[1..-1], memo)
  if nums[2..-1].to_i <= 26
    result += decoderCount(nums[2..-1], memo)
  end

  memo[nums.size] = result

  result
end