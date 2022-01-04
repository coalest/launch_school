class SumOfMultiples
  def initialize(*nums)
    @set_of_nums = nums
  end

  def to(num)
    multiples = []
    set_of_nums.each do |multiplier|
      2.upto(num - 1) do |n|
        multiples << n if n % multiplier == 0
      end
    end
    multiples.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  private

  attr_reader :set_of_nums
end
