def searchMatrix(matrix, target)
  return false if matrix.size <= 0
  return false if matrix.size == 1 && matrix[0].size <= 0
  row = matrix.size - 1


  start = 0
  stop = matrix.size - 1

  while(start <= stop) do 
    mid = start + (stop - start) / 2

    if matrix[mid][0] == target
      return true # if we're lucky
    elsif matrix[mid][0] > target
      stop = mid - 1
    else
      start = mid + 1
    end
  end

  selected_matrix = matrix[stop]
  stop = selected_matrix.size - 1
  start = 0

  while(start <= stop) do 
    mid = start + (stop - start) / 2
    if selected_matrix[mid] == target
      return true
    elsif selected_matrix[mid] > target
      stop = mid - 1
    else
      start =  mid + 1
    end
  end

  return false
end

puts searchMatrix([[]], 1)