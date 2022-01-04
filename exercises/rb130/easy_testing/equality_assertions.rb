require 'minitest/autorun'

class Equality < MiniTest::Test
  def test_equality
    value = "XYZ"
    assert_equal('xyz', value.downcase)
  end
end