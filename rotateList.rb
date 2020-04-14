
class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  def elements
    curr = self
    results = []
    results << curr.val

    while(curr.next != nil)
      curr = curr.next
      results << curr.val
    end

    results
  end
end

def rotate_right(head, k)
  return nil if !head

  tail = head
  length = 1

  while(tail.next != nil)
    length += 1
    tail = tail.next
  end

  tail.next = head
  step = k % length

  prev = nil
  res = head

  if step > 0
    step.upto(length - 1).each do |i|
      prev = res
      res = res.next
    end
  end

  prev.next = nil
  res.elements
end