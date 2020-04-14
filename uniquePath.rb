def uniquePath(m, n)
  matrix = Array.new(m) {Array.new(n)}
  
  0.upto(m - 1).each do |i|
    matrix[i][0] = 1
  end

  0.upto(n - 1).each do |j|
    matrix[0][j] = 1
  end


  1.upto(m -1).each do |i|
    1.upto(n - 1).each do |j|
      matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1]
    end
  end

  matrix[m - 1][n - 1]
end


