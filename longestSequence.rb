def longest_sequences(nums)
  max_sequence_length = 0

  num_sets = nums.each_with_object(Hash.new) do |num, hash|
    hash[num] = 1
  end

  nums.each do |num|
    current_num = num
    current_sequence_length = 0

    if !num_sets[current_num - 1]
      while(num_sets[current_num]) do
        current_sequence_length += 1
        current_num += 1
      end

      max_sequence_length = [current_sequence_length, max_sequence_length].max
    end
  end

  max_sequence_length
end
