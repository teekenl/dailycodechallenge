def match(regex, string)
  return !string if !regex

  first_match = string && [string[0], '.'].include?(regex[0])

  if regex.length >= 2 && regex[1] == '*'
    return match(regex[2..], string) || (
      first_match && match(regex, string[1..])
    )
  else
    return first_match && match(regex[1..], string[1..])
  end
end