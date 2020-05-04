def longest_valid_parentheses(s)
  return 0 if !s || s.empty?

  dp = [0] * s.length

  1.upto(s.length - 1).each do |i|
    if s[i] == ')'
      if s[i - 1] == '('
        dp[i] = dp[i-2] + 2
      elsif (i - dp[i -1] - 1) >= 0 && (s[i - dp[i -1] - 1] == '(')
        dp[i] = dp[i - dp[i - 1] - 2] + dp[i - 1] + 2
      end
    end
  end

  dp.max
end
