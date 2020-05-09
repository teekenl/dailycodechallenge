class Node
  attr_accessor :val, :next
end

def second_largest_node(head)
  return if !head
  prev_max = nil
  max = head

  head = head.next
  while (head)
    if head.val > max.val
      max = head
      prev_max = max
    end
  
    head = head.next
  end

  prev_max
end