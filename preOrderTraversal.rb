class Node
  attr_accessor :val, :left, :right
end

# recursive
def preOrderRecur(root)
  results = []
  helper(root, results)

  results
end

def helper(node, results)
  return if !node

  results << node.val
  helper(node.left, results)
  helper(node.right, results)
end

# iterative
def preOrderIter(root)
  queue = []
  queue << [root, 'start']
  results = []

  while(queue.length > 0)
    node, label = queue.shift
    if !node
      next
    elsif label != 'current'
      queue << [node, 'current']
      queue << [node.left, 'left']
      queue << [node.right, 'right']

    elsif label == 'current'
      results << node.val
    end
  end

  results
end