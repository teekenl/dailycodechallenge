class Node
  attr_accessor :val, :left, :right
end

# recursive
def postOrderRecur(root)
  results = []
  helper(root, results)

  results
end

def helper(node, results)
  return if !node

  helper(node.left, results)
  helper(node.right, results)

  results << node.val
end

# iterative
def postOrderIter(root)
  stack = []
  stack << [root, 'start']
  results = []

  while(stack)
    node, label = stack.pop
    if !node
      next
    elsif label != 'current'
      stack << [node, 'current']
      stack << [node.right, 'right']
      stack << [node.left, 'left']

    elsif label == 'current'
      results << node.val
    end
  end

  results
end