def preserve_punctuation(arr)
  all_alphachars = ("a".."z").to_a + ("A".."Z").to_a
  new_array = []
  arr.each do |string|
    new_string = ''
    chars_from_string = string.chars
    only_alpha_chars = string.gsub(/[^a-zA-Z]/,'').chars
    chars_from_string.each do |current_char|
      if all_alphachars.include?(current_char)
        new_string << only_alpha_chars.pop
      else
        new_string << current_char
      end
    end
    new_array << new_string
  end
  new_array
end

p preserve_punctuation(["shan't", "won't", "y'all'rn't", "fixin'"]) == ["tnah's", "tno'w", "t'nrl'la'y", "nixif'"]
p preserve_punctuation(["'eard", "why??", "peter", "rabbit", '']) == ["'drae", "yhw??", "retep", "tibbar", '']
p preserve_punctuation(["peter", "rabbit"]) == ["retep", "tibbar"]
p preserve_punctuation(["..."]) == ["..."]
p preserve_punctuation(['']) == ['']
