factorial = Enumerator.new do |arr|
  x, y = 1, 1
  2.times { arr << 1 }
  loop do
    x = x + 1
    y = y * x
    arr << y
  end
end

7.times do 
  print "#{factorial.next} "
end
puts
7.times do 
  print "#{factorial.next} "
end
puts
factorial.rewind
7.times do 
  print "#{factorial.next} "
end
puts

factorial.each_with_index do |num, index|
  puts "#{index}!: #{num}"
  break if index >= 7
end
