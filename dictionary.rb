
def dictionary(s, words)
  return if !s || !words

  sentence_words = []
  0.upto(s.size - 1).each do |i|
    if words.include?(s[0..i])
      sentence_words << s[0..i]
      words.delete(s[0..i])
      sentence_words += dictionary(s[i+1..-1], words)

      break
    end
  end

  sentence_words
end