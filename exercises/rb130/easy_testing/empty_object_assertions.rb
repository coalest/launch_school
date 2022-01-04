require 'minitest/autorun'
require_relative 'employee'

class Empty < Minitest::Test
  def test_empty_array
    list = []
    assert_equal(true, list.empty?)
  end

  def test_included_object
    list = [1,2,3,4, 'xyz']
    assert_includes(list, 'xyz')
  end

  def test_exception
    assert_raises(NoExperienceError) { Employee.new.hire }
  end

  def test_type
    assert_instance_of(Numeric, Numeric.new)
  end

  def test_kind
    assert_kind_of(Numeric, 1)
  end

  def test_same
    # assert_same(list, list.process)
  end

  def test_refutation
    list = ['xy']
    refute_includes(list, 'xyz')
  end
end