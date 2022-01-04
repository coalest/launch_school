def my_method(&proc)
  proc.call(rand(1..10))
end

my_proc = Proc.new { |n| n + 3 }

p my_method(&my_proc)
