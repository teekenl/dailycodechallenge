def three_sum(nums)
  output = []

  nums.sort!
  0.upto(nums.length - 3).each do |i|
    if i == 0 || (i > 0 && nums[i] != nums[i - 1])
      low = i + 1
      high = nums.length - 1
      sum = 0 - nums[i]
      
      while(low < high)
        current_total = nums[low] + nums[high]
        if (current_total == sum)
          output << [nums[i], nums[low], nums[high]]
          while(low < high && nums[low] == nums[low] + 1) 
            low += 1
          end

          while(low < high && nums[high] == nums[high - 1])
            high -= 1
          end
          low += 1
          high -= 1
        elsif (current_total > sum)
          high -= 1
        else
          low += 1 
        end
      end
    end
   
  end

  output 
end

# three_sum([-1, 0, 1, 2, -1, -4]) # => [[-1, 0, 1], [-1, -1, 2]]