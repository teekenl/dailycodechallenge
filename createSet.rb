require 'set'
def get_power_set(numbers)
  return [Set.new] if numbers.size == 0

  result = []
  current_set = Set.new.add(numbers[0])

  child_power_set = get_power_set(numbers[1..-1])
  result.concat(child_power_set)

  child_power_set.each do |child_set|
    new_set = current_set + child_set
    result << new_set
  end

  result
end

# get_power_set([1,2,3]).inspect
#=> [[3], [2],[ 1], [2,3], [1,3], [1,2], [1,2,3]]
