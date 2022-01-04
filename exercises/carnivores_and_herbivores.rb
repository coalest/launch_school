class Animal
  def carnivore?
    self.class.superclass == Carnivore
  end

  def herbivore?
    self.class.superclass == Herbivore
  end
end

class Herbivore < Animal; end
class Giraffe < Herbivore; end
class Elephant < Herbivore; end

class Carnivore < Animal; end
class Lion < Carnivore; end

class Habitat
  def initialize
    @animals = []
  end

  def <<(new_animal)
    if @animals.any? { |animal| animal.herbivore? } && new_animal.carnivore?
      puts "You shouldn't mix carnivores and herbivores!"
    elsif @animals.any? { |animal| animal.carnivore? } && new_animal.herbivore?
      puts "You shouldn't mix carnivores and herbivores!"
    else
      @animals << new_animal
      puts "#{new_animal.class} added to the #{self.class.to_s.downcase}."
    end
  end
end

=begin
The local zoo is creating an app to redesign their habitats and decide
which animals to put together. The first version of the app resulted in a
bloodbath. Please implement the following functionality so that herbivores
can't be placed in habitats with carnivores and vice versa.
=end

giraffe = Giraffe.new
elephant = Elephant.new
lion = Lion.new

savannah = Habitat.new

savannah << giraffe 
savannah << elephant
savannah << lion # => Don't put carnivores and herbivores in the same habitat!

prairie = Habitat.new

prairie << lion
prairie << elephant # => Don't put carnivores and herbivores in the same habitat!
