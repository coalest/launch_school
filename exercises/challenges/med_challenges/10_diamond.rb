=begin
------------------------INSTRUCTIONS-------------------------------------


--------------------------PROBLEM----------------------------------------
Input:  

Output: 
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------
A 1 2n + 1
B 3 2n + 1
C 5
D 7
'C'
' ' ' ' 'A'
' ' 'B' ' ' 'B'
'C' ' ' ' ' ' ' 'C'
' ' 'B' ' ' 'B'
' ' ' ' 'A'

Spaces before and after:
2 # (char.ord - 65 - i).abs
1
0
1
2

Print character
once if character is A
twice otherwise
(65 + i).chr if this character <= character input
character.ord - 65

Spaces in the middle:
0 n/a
1 1 
2 3
3 1
4 n/a

0 n/a
1 1 
2 3
3 5
1 3
2 1
3 n/a

print nothing if i is the first or last
i*2 - 1

-------------------------DATA/ALGO---------------------------------------

print top_half including middle line
print bottom_half

=end


require 'pry'

class Diamond

  def self.make_top_half(input_char)
    top_size = input_char.ord - 65 + 1
    top = ''
    top_size.times do |i|
      bordering_spaces = " " * (top_size - i - 1).abs
      char = (65 + i).chr
      if i == 0
        top += bordering_spaces + char + bordering_spaces + "\n"
      else
        middle_spaces = ' ' * (i * 2 - 1)
        top += bordering_spaces + char + middle_spaces + char + bordering_spaces + "\n"
      end
    end
    top
  end
  
  def self.make_bottom_half(input_char)
    bottom_size = input_char.ord - 65
    bottom = ''
    1.upto(bottom_size) do |i|
      bordering_spaces = " " * i
      char = (input_char.ord - i).chr
      if i == bottom_size
        bottom += bordering_spaces + char + bordering_spaces + "\n"
      else
        middle_spaces = ' ' * ((char.ord - 65) * 2 - 1)
        bottom += bordering_spaces + char + middle_spaces + char + bordering_spaces + "\n"
      end
    end
    bottom
  end

  def self.make_diamond(letter)
    self.make_top_half(letter) + self.make_bottom_half(letter)
  end
end

Diamond.make_diamond('A')