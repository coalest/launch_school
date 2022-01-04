require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'

Minitest::Reporters.use!

class TextSwapTest < Minitest::Test
  def setup
    @text = Text.new(File.read('sample_text.txt'))
  end

  def test_swap
    new_text = @text.swap('a', 'e')
    assert_equal(0, new_text.count('a'))
  end

  def test_word_count
    assert_equal 72, @text.word_count
  end

  def teardown
    # File.close('sample_text.txt')
  end
end