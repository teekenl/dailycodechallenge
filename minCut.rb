def min_cut(s)
  return 0 if !s || s.length <= 1
  return 0 if s == s.reverse

  cut = (-1..(s.length - 1)).to_a
  0.upto(s.length - 1).each do |i|
    i.upto(s.length - 1).each do |j|
      if s[i..j] == s[i..j].reverse
        cut[j + 1] = [cut[j + 1], cut[i] + 1].min
      end
    end
  end

  cut[-1]
end


# min_cut("bba")
# answers: 2, the minimum cut for palindrom partition