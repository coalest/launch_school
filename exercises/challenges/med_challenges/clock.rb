=begin
------------------------INSTRUCTIONS-------------------------------------

--------------------------PROBLEM----------------------------------------
Input: one or two integeters

Output: total number of seconds
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------
Clock.at(8,11)

-------------------------DATA/ALGO---------------------------------------

=end
require 'pry'

class Clock
  def initialize(minutes)
    @time = minutes % 2400
  end

  def self.at(hour, minutes = 0)
    time_in_min = hour * 60 + minutes 
    new(time_in_min)
  end

  def to_s
    hours, minutes = self.time.divmod(60)
    hours = to_s_with_zeroes(hours)
    minutes = to_s_with_zeroes(minutes)
    "#{hours}:#{minutes}"
  end
  
  def +(num_in_minutes)
    Clock.new((self.time + num_in_minutes) % 1440)
  end

  def -(num_in_minutes)
    new_time = self.time - num_in_minutes
    new_time += 1440 until new_time > 0
    Clock.new(new_time)
  end 

  def ==(other_clock)
    self.time == other_clock.time
  end

  protected

  attr_accessor :time

  private
  
  def to_s_with_zeroes(num)
    num.to_s.length == 1 ? num.to_s.prepend('0') : num.to_s
  end
end
