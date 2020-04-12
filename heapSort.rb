def heapify(arr, n, i)
  largest = i
  l = 2 * i + 1
  r = l + 1

  if l < n && arr[i] < arr[l]
    largest = l
  end

  if r < n && arr[i] < arr[r]
    largest = r
  end

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]

    heapify(arr, n, largest)
  end
end

def heapSort(arr)
  n = arr.size
  i = n

  # generate max heap first
  ((n - 2) / 2).downto(0) {|i| heapify(arr, n - 1, i)}

  (n - 1).downto(1) do |i|
    arr[i], arr[0] = arr[0], arr[i]
    heapify(arr, i - 1, 0)
  end

  arr
end
