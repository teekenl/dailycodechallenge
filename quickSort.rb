

def partition(arr, low, high)
  i = low - 1
  j = low
  pivot = arr[high]

  while(j <= high)
    if pivot > arr[j]
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end

    j += 1
  end

  i += 1
  arr[i], arr[high] = arr[high], arr[i]
  
  i
end

def quickSort(arr, low, high)
  if low < high 
    middle = partition(arr, low, high)
  
    quickSort(arr, low, middle - 1)
    quickSort(arr, middle + 1, high)
  else 
    arr
  end
end