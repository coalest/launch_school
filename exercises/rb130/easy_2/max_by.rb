# def max_by(array)
#   return nil if array.empty?
#   max_array = []
#   array.each_with_index do |el, i|
#     max_array << [yield(el), i]
#   end
#   index = max_array.sort_by { |arr| arr.first }.last.last
#   array[index]
# end

require 'pry'
def max_by(array)
  return nil if array.empty?
  i = 0
  max_i = 0
  max_value = yield(array[i])
  until i == array.size - 1
    i += 1
    if (yield(array[i]) > max_value)
      max_value = yield(array[i])
      max_i = i
    end
  end
  array[max_i]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil