
# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

def my_method(array)
  yield(*array)
end

my_method(%w(raven finch hawk eagle)) do |_, _, *args|
  p args
end
