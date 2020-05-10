class Node
  attr_accessor :val, :left, :right
end

# recursive
def inOrderRecur(root)
  results = []
  helper(root, results)

  results
end

def helper(node, results)
  return if !node

  helper(node.left, results)
  results << node.val
  helper(node.right, results)
end

# iterative
def inOrderIter(root)
  stack = []
  stack << [root, 'start']
  results = []

  while(stack.length > 0)
    node, label = stack.pop
    if !node
      next
    elsif label != 'current'

      stack << [node.right, 'right']
      stack << [node, 'current']
      stack << [node.left, 'left']

    elsif label == 'current'
      results << node.val
    end
  end

  results
end