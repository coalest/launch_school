require 'pry'

def missing(arr)
  missing = []
  1.upto(arr.size - 1) do |i|
    missing << ((arr[i - 1] + 1)...arr[i]).to_a
  end
  missing.flatten
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4])== []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Further Exploration?
def missing(arr)
  missing = []
  diff = arr.last - arr.first
  arr.first.upto(arr.last) do |n|
    missing << n unless arr.include?(n)
  end
  missing
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4])== []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []