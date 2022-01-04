require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'cash_register'
require_relative 'transaction'

Minitest::Reporters.use!

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(100.00)
    book_purchase = Transaction.new(10.00)
    book_purchase.amount_paid = 10.00
    register.accept_money(book_purchase)
    assert_equal(110, register.total_money)
  end

  def test_change
    register = CashRegister.new(100.00)
    
    purchase = Transaction.new(10.00)
    purchase.amount_paid = 21.37

    assert_equal(11.37, register.change(purchase))
  end

  def test_give_receipt
    register = CashRegister.new(100)
    
    purchase = Transaction.new(10)
    expected = "You've paid $10.\n"

    assert_output(expected) { register.give_receipt(purchase) }
  end
end