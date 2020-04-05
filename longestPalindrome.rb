def longestPalindrome(strings)  
  if strings.size == 0 || strings.size == 1
    strings
  end

  palindrome = ""
  stop = 0

  while(stop <= strings.size) 
    start = 0
    while(start <= stop)
      if isPalindrome(strings[start..stop]) && strings[start..stop].size > palindrome.size
        palindrome = strings[start..stop]
      end
      
      start += 1
    end

    stop += 1
  end

  palindrome
end

def isPalindrome(strings)
    size = strings.size
    mid = size / 2
    i = 0

    while (i < mid)
      if strings[i] != strings[size - 1 - i]
        return false
      end
      i += 1
    end

    return true
end