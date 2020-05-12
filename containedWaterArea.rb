def contained_water(height)
  return 0 if height.size <= 1
    
  min = 0
  max = 0
  i = 0
  j = height.size - 1
  while( i < j)
      min = [height[i], height[j]].min
      current = min * (j - i)
      max = [max, current].max
      if height[i] < height[j]
          i += 1
      else
          j -= 1
      end
  end    
  max
end

# contained_water([1,8,6,2,5,4,8,3,7]) #=> 49 