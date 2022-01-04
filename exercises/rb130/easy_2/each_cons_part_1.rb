def each_cons(arr)
  0.upto(arr.size - 2) do |i|
    yield(arr[i], arr[i + 1])
  end
  nil
end

# def each_cons(arr)
#   arr.each_with_index do |el, i|
#     break if i + 1 == arr.size
#     yield(el, arr[i + 1])
#   end
#   nil
# end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
hash == {'a' => 'b'}
p result == nil