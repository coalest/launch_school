class Triangle
  def initialize(a, b, c)
    raise ArgumentError.new "Invalid triangle" if invalid_triangle?(a, b, c)

    @a = a
    @b = b
    @c = c
  end

  def kind
    case
    when @a == @b && @b == @c && @a == @c
      'equilateral'
    when @a == @b || @a == @c || @b == @c
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def invalid_triangle?(a, b, c)
    a < 0 || b < 0 || c < 0 || 
    a + b <= c || a + c <= b || b + c <= a
  end
end