class Animal
  def a_public_method
    "Will this work? " + self.a_private_method
  end

  private

  def a_private_method
    "Yes, I'm private!"
  end
end

fido = Animal.new
puts fido.a_public_method    