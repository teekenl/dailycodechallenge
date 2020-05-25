class Node
  attr_accessor :val, :left, :right
end

def solve_arithmetic(node)
  return node.val.to_f if is_numeric?(node.val)
  return eval("#{solve_arithmetic(node.left)} #{node.val} #{solve_arithmetic(node.right)}")
end

def is_numeric?(string)
  true if Float(string) rescue false
end

# node = [*, +, +, 3, 4, 5, 6]
# solve_arithemtic(node) => (3 + 4 ) * (5 + 6)

