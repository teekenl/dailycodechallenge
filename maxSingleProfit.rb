def maximum_profit(prices)
  return if !prices || prices.size < 2

  min_price = prices[0]
  max_profit = -100000 # MAX NEGATIVE INTEGER

  prices[1..-1].each do |price|
    if price - min_price > max_profit
      max_profit = price - min_price
    elsif price < min_price
      min_price = price
    end
  end
end

# maximum_profit([9, 11, 8, 5, 7, 10]) #=> 5