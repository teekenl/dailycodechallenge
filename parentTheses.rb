def parentTheses(sequences)
  brackets = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
  stack = []

  sequences.each_char do |seq|
    if !brackets[seq]
      stack << seq
    else
      open_seq  = stack.pop
      return false if open_seq != brackets[seq]
    end
  end

  return stack.empty?
end