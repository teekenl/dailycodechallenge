def coin_change(coins, amount)
  results = Array.new(amount + 1) 
  results[0] = 0

  1.upto(amount).each do |value|
    temp = []
    coins.each do |coin|
      if coin > value || !results[value - coin]
        next
      end
      temp << results[value - coin] + 1
    end
    
    results[value] = temp.min
  end

  results[amount] || -1
end
