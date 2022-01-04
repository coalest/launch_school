=begin
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

4 - 1
3
0 1 2 3

4 - 2
2
0 1 2

4 - 3
1
0 1
yield(arr[i], arr[i + 1], arr[i + 2])


[1,2]
arr[i + j]

=end

def each_cons(arr, n)
  0.upto(arr.size - n) do |i|
    yield(arr[i], arr[i + 1])
  end
  nil
end

def each_cons(arr, n)
  j = []
  1.upto(n - 1) { |num| j << num }
  arr.each_with_index do |el, i|
    break if i + n - 1 == arr.size
    yield(el)
  end
  nil
end

def each_cons(arr, n)
  arrays = []
  0.upto(arr.size - n) do |i|
    arrays << arr[i..-1].first(n)
  end
  arrays.each do |sub_arr|
    yield(*sub_arr)
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}