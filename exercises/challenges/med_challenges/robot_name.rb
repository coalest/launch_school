=begin
------------------------INSTRUCTIONS-------------------------------------


--------------------------PROBLEM----------------------------------------
Input: 

Output: 
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------


-------------------------DATA/ALGO---------------------------------------

=end

class Robot
  ALPHABET = ('A'..'Z').to_a

  @@names = []

  def name
    return @name if @name
    loop do
      @name = random_name
      break unless @@names.include?(name)
    end
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def random_name
    name = ''
    2.times { name << ALPHABET[rand(0..25)] }
    3.times { name << rand(0..9).to_s }
    name
  end
end

puts Robot.new.name