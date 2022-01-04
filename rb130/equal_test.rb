require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'equal'

class EqualTest < MiniTest::Test
  def test_equal
    bob = Person.new("Bob")
    rob = Person.new("Bob")
    assert_equal rob, bob
  end
end