def nQueens(n)
  boards = []
  results = []

  solveQueens(boards, 0, n, results)

  results
end

def solveQueens(boards, row, n, results)
  if row == n
    results << boards.dup
  else
    0.upto(n - 1).each do |i|
      boards << '.' * n
      boards[row][i] = 'Q'

      if isValid(boards) 
        solveQueens(boards, row + 1, n, results)
      end
      boards.pop
    end
  end
end

def isValid(boards)
  row = boards.size() - 1

  0.upto(row - 1).each do |r|
    diff = (boards[r].index('Q') - boards[row].index('Q')).abs
    if diff == 0 || diff == row - r # diagonal or same col
      return false
    end
  end

  return true
end