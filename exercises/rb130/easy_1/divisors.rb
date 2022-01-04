def divisors(num)
  result = []
  arr = (1..(num/2)).to_a
  arr.each { |n| result << n if num % n == 0 }
  result + [num]
end

def time(&block)
  before = Time.now
  yield
  puts "That took me #{Time.now - before} seconds."
end
# [1, 2, 3, 4, 6, 12]

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
time { divisors(99400891) } #== [1, 9967, 9973, 99400891] # may take a minute
time { divisors(999962000357)}