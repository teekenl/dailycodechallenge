def max_profit(k, prices)
  return 0 if k <= 0 || prices.size <= 0 || !prices
  
  dp = Array.new(k + 1) {Array.new(prices.size, 0) }
  1.upto(k).each do |i|
    tmpMax = -prices[0]
    1.upto(prices.size - 1).each do |j|
      dp[i][j] = [dp[i][j - 1], prices[j] + tmpMax].max
      tmpMax = [tmpMax, dp[i - 1][j] - prices[j]].max
    end
  end

  dp[k][prices.size - 1]
end
