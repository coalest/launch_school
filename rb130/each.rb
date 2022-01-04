def each(arr)
  counter = 0
  until counter == arr.length
    yield(arr[counter]) if block_given?
    counter += 1
  end
  arr
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

p each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }  