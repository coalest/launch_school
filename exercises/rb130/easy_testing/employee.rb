class NoExperienceError < StandardError
end

class Employee
  def initialize(yrs_experience = 0)
    @experience = yrs_experience
  end

  def hire
    raise NoExperienceError if @experience == 0
    puts "Hired!"
  end
end