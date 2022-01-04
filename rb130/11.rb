class Rectangle
  attr_accessor :height, :width, :color

  def initialize
    @height = 50
    @width = 50
    @color = :red
    yield(self) if block_given?
  end

  def to_s
    "#{height}x#{width} #{color} rectangle"
  end
end

rect = Rectangle.new
puts rect # => 50x50 red rectangle

rect1 = Rectangle.new do |r|
  r.height = 400
  r.width = 300
  r.color = :black
end

puts rect1 # => 400x300 black rectangle