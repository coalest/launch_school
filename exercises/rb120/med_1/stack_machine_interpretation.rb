require 'pry'

class Minilang
  ACTIONS = %w(PUSH PRINT ADD SUB MULT DIV MOD POP)

  def initialize(string)
    @stack = []
    @register = 0
    @input = string.split
  end

  def eval
    @input.each do |word|
      check_validity(word)
      send(word.downcase)

      case word
      when 'PRINT' then puts @register
      when 'PUSH' then @stack.push(@register)
      when 'ADD' then @register += stack_pop_unless_empty
      when 'SUB' then @register -= stack_pop_unless_empty
      when 'MULT' then @register *= stack_pop_unless_empty
      when 'DIV' then @register /= stack_pop_unless_empty
      when 'MOD' then @register %= stack_pop_unless_empty
      when 'POP' then @register = stack_pop_unless_empty
      else
        @register = word.to_i
      end
    end
  end

  def stack_pop_unless_empty
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @stack.pop
  end

  def check_validity(word)
    if ACTIONS.none?(word) && !num?(word)
      raise TokenError, "Invalid token: #{word}" 
    end
  end

  def num?(word)
    word =~ /\A[-+]?\d+\z/
  end
end

class TokenError < StandardError; end
class EmptyStackError < StandardError; end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
