require 'minitest/autorun'
# require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'

# Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  def test_prompt
    input = StringIO.new("10\n")
    output = StringIO.new
    purchase = Transaction.new(10)

    expected = "You owe $10.\nHow much are you paying?\n"
    assert_output(expected) { purchase.prompt_for_payment(input: input) }
    assert_equal(10, purchase.amount_paid)
  end

  def test_prompt_2
    input = StringIO.new("10\n")
    output = StringIO.new("Lol!")
    purchase = Transaction.new(10)

    expected = "You owe $10.\nHow much are you paying?\n"
               'That is not the correct amount. ' \
               'Please make sure to pay the full cost.\n'
               
    purchase.prompt_for_payment(input: input, output: output)
    # assert_output(expected) {  }
    assert_equal(10, purchase.amount_paid)
  end
end