require 'minitest/autorun'

class OddTest < MiniTest::Test
  def test_odd
    assert(2.odd?, "Value is not odd")
  end
end