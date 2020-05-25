class Node
  attr_accessor :val, :left, :right
end

def get_tree(preorder, inorder)
  return if !preorder || !inorder

  root_val = preorder[0]
  if preorder.size == 1
    return root_val
  end

  root_node = Node.new
  root_node.val = root_val

  inorder.each.with_index do |val, index|
    if val == root_val
      root_node.left = get_tree(
        preorder[1..(index + 1)], inorder[0..index]
      )

      root_node.right = get_tree(
        preorder[(index + 1)..-1], inorder[(index + 1)..-1]
      )
    end
  end

  root_node
end

#preorder = [a, b, d, e, c, f, g]
# inorder =[d, b, e, a, f, c, g]
# get_tree(preorder, inorder)
# result :
#     a
#    / \
#   b   c
#  / \ / \
# d  e f  g