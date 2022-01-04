=begin
------------------------INSTRUCTIONS-------------------------------------
Write your own version of zip that does the same type of operation. It
should take two Arrays as arguments, and return a new Array (the original
Arrays should not be changed). Do not use the built-in Array#zip method.
You may assume that both input arrays have the same number of elements.

--------------------------PROBLEM----------------------------------------
Input: two arrays with the same number of elements

Output: one nested array
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------


-------------------------DATA/ALGO---------------------------------------

create a new result array
iterate trhough the first array with the element and index

=end


def zip(arr1, arr2)
  result = []
  arr1.each_with_index { |el, i| result << [el, arr2[i]] }
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]