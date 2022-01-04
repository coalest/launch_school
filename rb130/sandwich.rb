SPREADS = %w(Mustard Mayo Jelly Peanut\ Butter)

def make_sandwich(ingredients)
  puts "I'm making a sandwich!"
  puts "Start with a slice of bread."
  ingredients.each { |ingred| yield(ingred) }
  puts "Finish off with another slice of bread!"
  puts "Yum!"
end

recipe_1 = %w(Mustard Lettuce Sliced\ Ham Cheese Mayo)
recipe_2 = %w(Peanut\ Butter Jelly Sliced\ Banana)

make_sandwich(recipe_1) do |ingred|
  verb = SPREADS.include?(ingred) ? "Spread" : "Add"
  puts "#{verb} #{ingred}."
end

puts ''

make_sandwich(recipe_2) do |ingred|
  verb = SPREADS.include?(ingred) ? "Spread" : "Add"
  puts "#{verb} #{ingred}."
end
