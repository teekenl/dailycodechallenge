def productOtherNumbers(nums)
  products = [1] * nums.count
  p = 1
  nums.each.with_index do |num, index|
    products[index] = products[index] * p;
    p = p * num
  end

  p = 1
  nums.reverse_each.with_index do |num, i|
    index = nums.count - i - 1
    products[index] = products[index] * p;
    p = p * num
  end

  products
end

1,2,3,4,5
