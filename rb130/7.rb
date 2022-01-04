def do_something_silly(word)
  yield word, word
end

do_something_silly("hello") do |word, another_word|
  p word
  p another_word
end