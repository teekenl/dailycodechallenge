def merge_sort(lists, start, ends)
  return lists if lists.empty? || lists.size == 1
  return lists if start >= ends

  mid = start + (ends - start) / 2
  merge_sort(lists, start, mid)
  merge_sort(lists, mid + 1, ends)

  merge_halves(lists, start, ends)

  lists
end

def merge(lists)
  merge_sort(lists, 0, lists.size - 1)
end


def merge_halves(lists, leftStart, rightEnd)
  temp = []
  leftEnd = (rightEnd + leftStart) / 2
  rightStart = leftEnd + 1

  left = leftStart
  right = rightStart
  index = 0

  while (left <= leftEnd && right <= rightEnd) 
    if lists[left].to_i < lists[right].to_i
      temp[index] = lists[left]
      left += 1
    else
      temp[index] = lists[right]
      right += 1
    end

    index += 1
  end

  if left > leftEnd
    temp.concat(lists[right..rightEnd])
  else
    temp.concat(lists[left..leftEnd])
  end

  lists[leftStart..rightEnd] = temp
  
  lists
end



