def firstMissingPositive(nums)
  return 1 if !nums
  i = 0

  length = nums.size
  while i <= (length - 1)
    while (i + 1 != nums[i]) && (nums[i] > 0) && (nums[i] < length)
      n = nums[i]
      nums[i], nums[n - 1] = nums[n - 1], nums[i]

      if nums [i] == nums[n - 1]
        break;
      end
    end

    i += 1
  end

  nums.each.with_index do |num, index| 
    if index + 1 != num
      return index + 1
    end
  end

  length + 1
end







