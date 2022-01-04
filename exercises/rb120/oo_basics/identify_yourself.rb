class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
puts kitty.identify
puts kitty
p kitty.identify
p kitty