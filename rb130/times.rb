def times(num)
  counter = 0
  until counter == num
    yield(counter) if block_given?
    counter += 1
  end
  num
end

times(5) do |num|
  puts num
end