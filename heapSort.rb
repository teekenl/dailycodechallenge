def heapify(arr, n, i)
  largest = i
  l = 2 * i + 1
  r = 2 * i + 2

  if l < n && arr[largest] < arr[l]
    largest = l
  end

  if r < n && arr[largest] < arr[r]
    largest = r
  end

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]

    heapify(arr, n, largest)
  end
end

def heapSort(arr)
  n = arr.size

  # generate max heap first
  (((n - 2) / 2) - 1).downto(0) {|i| heapify(arr, n, i)}

  (n - 1).downto(1).each do |i|
    arr[i], arr[0] = arr[0], arr[i]
    heapify(arr, i, 0)
  end

  arr
end
