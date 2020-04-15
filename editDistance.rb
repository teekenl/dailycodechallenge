def minDistance(words1, words2)
  results = Array.new(words2.size + 1) { Array.new(words1.size + 1, 0) }
  w1 = words1.size - 1
  w2 = words2.size - 1

  0.upto(results.size - 1).each do |i|
    results[i][0] = i
  end

  0.upto(results[0].size - 1).each do |j|
    results[0][j] = j
  end

  r1, r2 = 1

  0.upto(w2).each do |i|
    r2 = 1
    0.upto(w1).each do |j|
      if words1[j] == words2[i]
        results[r1][r2] = results[r1 - 1][r2 - 1]
      else
        results[r1][r2] = [results[r1 - 1][r2], results[r1][r2 - 1],results[r1 - 1][r2 - 1]].min + 1
      end

      r2 += 1 
    end


    r1 += 1
  end

  results[-1][-1]
end





