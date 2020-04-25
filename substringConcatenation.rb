def find_substring(s, words)
  return [] if words.count == 0 || s.length < words.join.length

  total_words = words.join.length
  step = words[0].length
  last_s = s.length - total_words
  hash_words = words.inject(Hash.new(0)) do |h, word| 
    h[word] += 1
    h
  end
  results = []

  0.upto(last_s).each do |i|
    hash = hash_words.dup

    (i..total_words - 1).step(step) do |j|
      sub_str = s[j..(j + step - 1)]
      if hash[sub_str] > 0
        hash[sub_str] -= 1
      else
        break
      end
    end

    results << i if !hash.values.any?{|h| h > 0} # matched
  end

  results
end