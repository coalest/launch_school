=begin
------------------------INSTRUCTIONS-------------------------------------


--------------------------PROBLEM----------------------------------------
Input: array of strings

Output: array of strings (sorted)
---------------------------RULES-----------------------------------------
Explicit: 
constructor
accepts one string (the word)
identical words are not anagrams
output array is sorted
case insensitive

Implicit: 
must have same number of letters
--------------------------EXAMPLES---------------------------------------


-------------------------DATA/ALGO---------------------------------------

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word) }.sort
  end

  private

  def anagram?(string)
    @word.downcase.split('').sort == string.downcase.split('').sort &&
    @word.downcase != string.downcase
  end
end