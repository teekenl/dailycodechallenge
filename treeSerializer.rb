class Node
  attr_accessor :key, :left, :right
end

def newNode(key)
  temp = Node.new
  temp.key = key 

  temp
end

def serialize(tree) 
  return if !tree

  left_serializer = serialize(tree.left)
  right_serializer = serialize(tree.right)

  serializer = []
  serializer << tree.key.to_s

  if left_serializer
    serializer << left_serializer.to_s
  end

  if right_serializer
    serializer << right_serializer.to_s
  end

  serializer.join(',')
end

def deserialize(strings)
  return if !strings || strings.size <= 0
  root = newNode(strings[0])

  root.left = deserialize(strings[1..-1])
  root.right = deserialize(strings[2..-1])

  root
end

def deserializer(string)
  strings = string.split(',')
  root = deserialize(strings)
end
