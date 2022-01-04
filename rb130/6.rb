def filter(arr, &block)
  puts block
  return [] unless block
  arr.each_with_object([]) do |el, result|
    result << el if block.call(el)
  end
end

arr = [1, 2, 3, 4, 5]

filtered_arr = filter(arr) { |el| el != 3 }
p filtered_arr                               # [1, 2, 4, 5]
p arr                                        # [1, 2, 3, 4, 5]

filtered_arr = filter(arr) { |el| el <= 3 }
p filtered_arr                               # [1, 2, 3]
p arr                                        # [1, 2, 3, 4, 5]

filtered_arr = filter(arr)
p filtered_arr                               # []
p arr                                        # [1, 2, 3, 4, 5]