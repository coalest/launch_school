=begin
------------------------INSTRUCTIONS-------------------------------------


--------------------------PROBLEM----------------------------------------
Input: two integers (year, month), and two strings (weekday, descriptor)

Output: a Date object with a year month and day
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------
  def test_first_monday_of_march_2013
    meetup = Meetup.new(2013, 3)
    assert_equal Date.civil(2013, 3, 4), meetup.day('Monday', 'first')
  end

  March 2013
  first Monday
  Date.new(2013, 3, 1).weekday = (0-6)

  helper method find all the given days of a month

  see what the first day is.
  Date.civil(2013, 3, 1).wday => 5 (tuesday)
  I'm looking for Mondays (1)
  March 4th is the first monday 1 - 5 + 7 = 3
  array of mondays => 4, 11, 18, 25
  n + 7 gets added to the array until dates are no longer valid

  if descriptor is first return the first number in the array, if last return last
    if teenth, return the number that is between 13 and 19

-------------------------DATA/ALGO---------------------------------------

=end
require 'date'
require 'pry'

class Meetup
  DESCRIPTORS = %w(first second third fourth fifth last teenth)
  WEEKDAYS = %w(monday tuesday wednesday thursday friday saturday sunday)

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, desc)
    arr = num_days_in_month(weekday)
    case desc.downcase
    when 'last'   then day = arr[-1]
    when 'teenth' then day = arr.find { |n| (13..19).include?(n) }
    else               day = arr[DESCRIPTORS.index(desc.downcase)]
    end
    Date.civil(year, month, day) if day
  end

  def num_days_in_month(weekday)
    diff = WEEKDAYS.index(weekday.downcase) - Date.civil(year, month, 1).wday + 1
    first_day = 1 + diff
    first_day += 7 if first_day < 1
    arr = [first_day]
    arr << arr.last + 7 until Date.valid_date?(year, month, arr.last + 7) == false
    arr
  end
end