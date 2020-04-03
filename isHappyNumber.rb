def isHappyNumber(num)
  if num  == 1
    return true
  elsif num == 4
    return false
  end

  sums = 0
    
  while(num > 0) 
      remainder = num % 10 
      sums = sums + (remainder * remainder)
      num = num / 10
  end

  isHappyNumber(sums)
end

