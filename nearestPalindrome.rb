# check if it is palindrome
def helper(s)
  s == s.reverse
end

def get_nearest_palindrome(s)
  return s if helper(s)

  if s[0] == s[-1]
<<<<<<< HEAD
    return s[0] + s[1..-2] + s[1]
=======
    return s[0] + get_nearest_palindrome(s[1..-2]) + s[-1]
>>>>>>> 9c38206... fixup! nearest palindrome problem solved.
  else
    first_palindrome = s[0] + get_nearest_palindrome(s[1..-1]) + s[0]
    second_palindrome = s[-1] + get_nearest_palindrome(s[0..-2]) + s[-1]

    return first_palindrome.length > second_palindrome.length ? 
      second_palindrome :
      first_palindrome
  end
end
 
# get_nearest_palindrome("elgoog")  => "elgoogle"