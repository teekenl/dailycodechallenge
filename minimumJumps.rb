
# iterative
# Time: O(n) complexity
def minimumJumps(nums)
  return 0 if nums.count <= 0
  maxReach = step = nums[0]
  jump = 1
  end_index = nums.size - 1
  
  (1..end_index).each do |index|
    return jump if index == end_index # if we reached the end.

    maxReach = [maxReach, nums[index] + index].max
    step -= 1; 

    if (step == 0)
      jump += 1
        
      if(index >= maxReach)
        return -1
      end
 
      step = maxReach - index
    end
  end

  jump
end