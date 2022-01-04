require 'minitest/autorun'

class NilTest < Minitest::Test
  def test_nil
    value = false
    assert_nil(value)
  end
end