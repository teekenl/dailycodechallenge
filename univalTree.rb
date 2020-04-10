def count_unival(root)
  total_count, is_unival = helper(root)
  
  return total_count
end

def helper(root)
  return [0, true] if !root

  left_count, is_left_unival = helper(root)
  right_count, is_right_unival = helper(root)

  is_unival = true

  if !is_left_unival || !is_right_unival
    is_unival = false
  elsif root.left && root.left.value != root.value
    is_unival = false
  elsif root.right && root.right.value != root.value
    is_unival = false
  end

  if is_unival
    return [left_count + right_count + 1, true]
  else
    return [left_count + right_count, false]
  end
end