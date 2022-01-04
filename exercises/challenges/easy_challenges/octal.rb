=begin
PEDAC
P
E
any invalid inputs should return 0
the numbers 8 and 9 shouldnt appear in octal numbers so they are invalid
D/A

define the class Octal
the initialize method saves a string to an instance variable

define the method to_decimal

2047
7 * 1
4 * 8
0 * 64
2 * 64*8

iterate through the digits with a counter
if the digit isnt from 0-7 return 0
multiply the ones digit by the counter at 1 * 8^0
multiply the 8s digit by the counter time 1 * 8^1
so on
add up all those numbers
return the sum
=end

class Octal
  attr_reader :num

  def initialize(num_string)
    @num = num_string ? num_string : ''
  end

  def to_decimal
    sum = 0
    num.chars.reverse.each_with_index do |n, i|
      return 0 unless ('0'..'7').include?(n)
      sum += n.to_i * 8 ** (i)
    end
    sum
  end
end
