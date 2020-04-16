def minimum_window_string(strings, target)
  return target if target.length == 1 and strings.include?(target)

  s = strings.length - 1
  i = 0
  j = 0

  targets = {}
  target.each_char do |t|
    targets[t] ||= 0
    targets[t] += 1
  end

  unmatches = targets.length
  len = strings.length + 1
  answers = ""

  while(j <= s)
    endChar = strings[j]
    if targets[endChar] 
      targets[endChar] -= 1
      unmatches -=1 if targets[endChar] == 0
    end

    while unmatches == 0
      if j - i < len
        len = j - i
        answers = strings[i..j]
      end

      startChar = strings[i]
      if targets[startChar] 
        targets[startChar] += 1
        unmatches += 1 if targets[startChar] > 0
      end

      i += 1
    end

    j += 1
  end

  answers
end