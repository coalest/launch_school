=begin
------------------------INSTRUCTIONS-------------------------------------
Write a program that will take a string of digits and return all the
possible consecutive number series of a specified length in that string.

--------------------------PROBLEM----------------------------------------
Input: a string

Output: array of array of integers
---------------------------RULES-----------------------------------------
Explicit: requesting a >n-digit series from a n-digit string should throw an error

Implicit: 
--------------------------EXAMPLES---------------------------------------
For example, the string "01234" has the following 3-digit series:

    012
    123
    234

Likewise, here are the 4-digit series:

    0123
    1234



-------------------------DATA/ALGO---------------------------------------

take a slice from index 0 to index of the 0 + num
take the next slice until the second index is the last index is the last one

take a slice from index 1 to the index of 1 + num
take slices till you reach the end

=end


class Series
  def initialize(str_of_digits)
    @str = str_of_digits
  end

  def slices(num)
    raise ArgumentError if num > @str.length
    arr = []
    0.upto(@str.length - num) do |i|
      arr << @str.slice(i, num).split('').map(&:to_i)
    end
    arr
  end
end