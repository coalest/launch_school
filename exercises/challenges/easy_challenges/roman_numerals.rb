class RomanNumeral

  ROMAN_NUMERALS = %w(I V X L C D M)

  def initialize(num)
    raise ArgumentError, 'Number should be between 1 and 3000' if num < 0 || num > 3000

    @num = num
  end

  def to_roman
    result = ''
    ones, tens, hundreds, thousands = @num.digits
    result << 'M' * thousands if @num >= 1000
    order = 100
    [hundreds, tens, ones].each do |num|
      result << digit_to_roman(num, order).to_s
      order /= 10
    end
    result
  end

  private

  def digit_to_roman(num, order)
    case order
    when 100 then i = 4
    when 10  then i = 2
    when 1   then i = 0
    end

    case num
    when 0     then ''
    when 1..3  then ROMAN_NUMERALS[i] * num
    when 4     then ROMAN_NUMERALS[i] + ROMAN_NUMERALS[i + 1]
    when 5..8  then ROMAN_NUMERALS[i + 1] + ROMAN_NUMERALS[i] * (num - 5)
    when 9     then ROMAN_NUMERALS[i] + ROMAN_NUMERALS[i + 2]
    end
  end
end