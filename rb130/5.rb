# name = "Alice"

def run
  name = "Cassidy"
  yield
end

puts run { "Hey there, #{name}" }
name = "Bill"

