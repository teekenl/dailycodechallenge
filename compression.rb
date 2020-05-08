def compress(string)
  count = 0
  prev_char = nil

  results = []

  string.each_char do |s|
    if prev_char == s || !prev_char
      count += 1
    else
      results << count.to_s
      results << prev_char
      count = 1
    end

    prev_char = s
  end

  if count
    results << count.to_s
    results << prev_char
  end

  results.join
end

def decompress(string)
  index = 0
  results = []
  while index < string.length - 1
    result = [string[index + 1]] * string[index].to_i
    results.concat(result)

    index += 2
  end

  results.join
end

# compress('AAAB') #=> 3A1B
# decompress('3C2A2B') #=> CCCAABB