def full_justify(words, max_width)
  lines = []
  cumulative_length = -1
  current_words = []
  line_lengths = []
  
  words.each do |word|
    current_length = cumulative_length + word.length + 1
    if current_length > max_width
      lines.append(current_words)
      line_lengths.append(cumulative_length)
      cumulative_length = -1
      current_words = []
    end

    cumulative_length += word.length + 1
    current_words.append(word)
  end

  # if there are words left append them to a new line.
  if current_words
    lines.append(current_words)
    line_lengths.append(cumulative_length)
  end

  justified_lines = []
  lines.zip(line_lengths).each do |(words, length)|
    missing_spaces = max_width - length

    line = ""
    if words.length > 1
      required_spaces = 1 + (missing_spaces / (words.length - 1))
      bonus_space = missing_spaces % (words.length - 1)

      words[0..-2].each.with_index do |word, index|
        line += word
        line += " " * required_spaces 
        if index < bonus_space
          line += " "
        end
      end

      line += words[-1]
    else
      line += words[-1]
      line += " " * missing_spaces
    end

    justified_lines.append(line)
  end

  justified_lines
end