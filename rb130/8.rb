def convert(string)
  return string unless block_given?
  string.chars.map do |char|
    yield(char)
  end.join('')
end

p convert('A simple string') { |char| char.upcase } # => "A SIMPLE STRING"
p convert('xyyz') { |char| char + char }            # => xxyyyyzz
p convert('Ready? Set. Go!') { |char| char == ' ' ? '' : char }
p convert('a string')                        # => a string