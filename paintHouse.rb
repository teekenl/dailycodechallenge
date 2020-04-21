def paint(costs)
  return 0 if !costs  || costs.size <= 0

  left = 1
  right = costs.size - 1

  left.upto(right).each do |i|
    costs[i][0] += [costs[i-1][1], costs[i-1][2]].min
    costs[i][1] += [costs[i-1][0], costs[i-1][2]].min
    costs[i][2] += [costs[i-1][0], costs[i-1][1]].min 
  end

  costs[right].min
end