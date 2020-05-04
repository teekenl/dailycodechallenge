def word_break(s, word_dict)
  results = []

  helper(results, s, word_dict, [])
  results
end

def helper(results, s, word_dict, match)  
  if s.empty?
    results << match.join(' ')
    return
  else
    word_dict.each do |word|
      if s[0..(word.length - 1)] == word
        match << word_break
        helper(results, s[word.length..-1], word_dict, match)
        match.pop
      end
    end
  end
end