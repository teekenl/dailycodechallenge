def min_path_sum(grid)
  dp = Array.new(grid.size) { Array.new(grid[0].size, 0) }

  0.upto(dp.size - 1).each do |i|
    0.upto(dp[i].size - 1).each do |j|
      dp[i][j] += grid[i][j]
      if i > 0 && j > 0
        dp[i][j] += [dp[i - 1][j], dp[i][j - 1]].min
      elsif i > 0
        dp[i][j] += dp[i - 1][j]
      elsif j > 0
        dp[i][j] += dp[i][j - 1]
      end
    end
  end

  dp[-1][-1]
end