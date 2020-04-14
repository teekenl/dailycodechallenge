def num_ways_recursive(n)
  return 0 if n < 0
  return 1 if n == 0 || n == 1

  num_ways_recursive(n - 1) + num_ways_recursive(n - 2)
end

def num_ways_iterative(n)
  return 0 if n < 0
  return 1 if n == 0 || n == 1
  nums = []
  nums[0] = 1
  nums[1] = 1
  
  2.upto(n).each do |f|
    nums[f] = nums[f - 1] + nums[f - 2]
  end

  return nums[n]
end


def num_ways_X_iterative(n, x)
  nums = Array.new(n, 0)
  nums[0] = 1 

  1.upto(n - 1).each do |f|
    nums[f] += x.map{|xs| ((f - xs) >= 0) ? nums[f - xs] : 0 }.sum
  end

  nums[-1]
end

def num_ways_X_recursive(n, x)
  return 0 if n < 0
  return 1 if n == 0 || n == 1
  total = 0

  x.each do |xs|
    if xs < n
      total += num_ways_X_recursive(n - xs, x)
    end
  end

  total
end

