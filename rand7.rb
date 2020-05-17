def rand7()
  i = 5 * rand(5) + rand(5) - 5
  if i < 22
    return i % 7 + 1
  end

  return rand7()
end

# rand7() => generate random integer from 0 to 7