
def shift_to_front(arr, start, stop, letter)
  shifted = -1

  while(start <= stop)
    if arr[start] == letter
      shifted = start
      start += 1
    elsif arr[stop] != letter
      stop -= 1
    else
      shifted = start
      arr[start], arr[stop] = arr[stop], arr[start]
    end
  end

  shifted
end

def reorder_array(arr)
  shifted = shift_to_front(arr, 0, arr.length - 1, 'R')
  shift_to_front(arr, shifted + 1, arr.length - 1, 'G')
end

# arr = ['G', 'B', 'R']
# reorder_array(arr) #=> ['R', 'G', 'B']