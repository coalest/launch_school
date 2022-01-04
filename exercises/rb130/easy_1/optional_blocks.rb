# def compute
#   block_given? ? yield : 'Does not compute.'
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further exploration
def compute(multiplier)
  return 'Does not compute.' unless block_given?
  yield(multiplier)
end

p compute(2) { |mult| (5 + 3) * mult} == 16
p compute(3) { |mult| ('a' + 'b') * mult } == 'ababab'
p compute(4) == 'Does not compute.'