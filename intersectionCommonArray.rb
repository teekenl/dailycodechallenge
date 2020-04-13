def intersection(arr1, arr2, arr3)
  n1  = arr1.size
  n2 = arr2.size
  n3 = arr3.size

  i = j = k = 0

  intersections = []

  while(i < n1 && j < n2 && k < n3)
    if arr1[i] == arr2[j] && arr2[j] == arr3[k]
      intersections << arr1[i]
      i += 1
      j += 1
      k += 1
    elsif arr1[i] < arr2[j]
      i += 1
    elsif arr2[j] < arr3[k]
      j += 1
    else
      k += 1
    end
  end

  intersections
end