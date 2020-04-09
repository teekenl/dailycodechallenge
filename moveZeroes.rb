def moveZeroes(nums)
  lastNonZeroFoundAt = 0

  nums.each.with_index do |num, index|
    if num != 0 
      nums[lastNonZeroFoundAt] = nums[index]
      lastNonZeroFoundAt += 1
    end
  end

  while(lastNonZeroFoundAt <= (nums.size - 1)) 
    nums[lastNonZeroFoundAt] = 0

    lastNonZeroFoundAt += 1
  end

  nums
end