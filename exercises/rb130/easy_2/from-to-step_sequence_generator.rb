
def step(first, last, increment)
  return nil unless block_given?
  value = first
  while value <= last
    yield(value)
    value += increment
  end
  # steps.each { |value| yield(value) } if block_given?
end

p step(1, 10, 3) { |value| puts "value = #{value}" }