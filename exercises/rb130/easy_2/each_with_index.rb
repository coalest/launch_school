def each_with_index(arr)
  0.upto(arr.size - 1) do |i|
    yield(arr[i], i)
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]