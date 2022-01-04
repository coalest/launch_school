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

class PerfectNumber
  def self.classify(num)
    raise StandardError, "number must be positive" if num < 1

    case sum_of_divisors(num) <=> num
    when -1; then 'deficient'
    when  0; then 'perfect'
    when  1; then 'abundant'
    end
  end

  class << self
    private

    def sum_of_divisors(num)
      divisors = []          
      (1..(num - 1)).each do |divisor|
        if num % divisor == 0         
          divisors << divisor
        end
      end
      divisors.reduce(:+)
    end
  end
end
