require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'text'

Minitest::Reporters.use!

class TextSwapTest < Minitest::Test
  def setup
    @sample_text = File.read('sample_text.txt')
    @text = Text.new(@sample_text)
  end

  def test_swap
    @text.swap('a', 'e')
    assert_equal(0, @sample_text.count('a'))
  end

  def teardown
  end
end

=begin 
require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, actual_text
  end

  def teardown
    @file.close
  end
end
=end