# Problem
def call_this
	yield(2)
end

to_s = Proc.new { |value| value }
to_i = Proc.new { |value| value.to_s }

# How to get the following return values with modifying the method invocation nor the method definition
p call_this(&to_s) # => returns 2
p call_this(&to_i) # => returns "2"