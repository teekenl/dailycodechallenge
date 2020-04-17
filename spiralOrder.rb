def spiral_order(matrix)
  rowEnd = matrix.size - 1
  colEnd = matrix[0].size - 1
  results = []
  rowBegin = colBegin = 0


  while(rowBegin <= rowEnd && colBegin <= colEnd)
    colBegin.upto(colEnd).each do |index|
      results << matrix[rowBegin][index]
    end
    
    rowBegin += 1
    
    rowBegin.upto(rowEnd).each do |index|
      results << matrix[index][colEnd]
    end
    
    colEnd -= 1
    
    if rowBegin <= rowEnd
      colEnd.downto(colBegin).each do |index|
        results << matrix[rowEnd][index]
      end
    end
    
    rowEnd -= 1
    
    if colBegin <= colEnd
      rowEnd.downto(rowBegin).each do |index|
        results << matrix[index][colBegin]
      end
    end
    
    colBegin += 1 
  end
  
  results
end