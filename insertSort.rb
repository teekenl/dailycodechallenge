def insertSort(nums)
  pivot = 0
  start = 0

  while (pivot < nums.count)
    value = nums[pivot]

    start = pivot - 1
    while(start >= 0 && nums[start] > value)
      nums[start + 1] = nums[start] 
      start -= 1
    end

    nums[start + 1] = value
    pivot += 1
  end

  nums
end