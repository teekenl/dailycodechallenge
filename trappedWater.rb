def total_trapped_water(walls)
  return 0 if walls.size < 3

  total_volume = 0
  left = 0
  right = walls.size - 1
  left_max = 0
  right_max = 0
  
  while left <= right
    if walls[left] < walls[right]
      if walls[left] > left_max
        left_max = walls[left]
      else
        total_volume += left_max - walls[left]
      end
      left += 1
    else
      if walls[right] > right_max
        right_max = walls[right]
      else
        total_volume += right_max - walls[right]
      end
      
      right -= 1
    end
  end

  total_volume
end
