def selection_sort(nums)
  n = nums.size
  end_index = n - 1

  0.upto(end_index).each do |i|
    lowestIndex = i
    start_index = lowestIndex + 1

    start_index.upto(end_index).each do |j|
      if nums[lowestIndex] > nums[j]
        lowestIndex = j
      end
    end

    nums[lowestIndex], nums[i] = nums[i], nums[lowestIndex]
  end

  nums
end
