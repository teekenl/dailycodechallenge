# recursive
def reverseStringRecursive(s) 
  if s.size < 2
    return s 
  end

  return reverseString(s[1..-1]) + s[0]
end

# iterative
def reverseStringIterative(s) 
  i = s.size - 1
  reverseString = ""

  while(i >= 0)
    reverseString += s[i]
    i -= 1
  end  

  return reverseString
end