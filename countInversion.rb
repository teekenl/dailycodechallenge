
def count_inversion(nums)
  arr, inversions = merge_sort(nums)

  inversions
end

def merge_sort(nums)
  return [nums, 0] if !nums || nums.size == 1

  mid = nums.size / 2
  arr, inversions = merge(merge_sort(nums[0..(mid - 1)]), merge_sort(nums[mid..-1]))
  
  [arr, inversions]
end

def merge(inversion_a, inversion_b)
  i, k = 0, 0
  a, a_inv = inversion_a
  b, b_inv = inversion_b
  result = []
  inversions = a_inv + b_inv
  

  while i < a.size && k < b.length
    if a[i] < b[k]
      result.append(a[i])
      i += 1
    else
      result.append(b[k])
      inversions += a[i..-1].size
      k += 1
    end
  end

  while i < a.length
    result.append(a[i])
    i += 1
  end

  while k < b.length
    result.append(b[k])
    k += 1
  end

  [result, inversions]
end