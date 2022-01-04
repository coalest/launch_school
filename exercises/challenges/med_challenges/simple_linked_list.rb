=begin
------------------------INSTRUCTIONS-------------------------------------


--------------------------PROBLEM----------------------------------------
Input: one or two integers

Output: the integer, or hte next integer in the 
---------------------------RULES-----------------------------------------
Explicit: 

Implicit: 
--------------------------EXAMPLES---------------------------------------

[1, link to next]

-------------------------DATA/ALGO---------------------------------------

=end

require 'pry'

class Element
  attr_reader :datum, :link
  
  def initialize(datum, link = nil)
    @datum = datum
    @link = link
  end

  def tail?
    link.nil?
  end

  def next
    link
  end
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @head = nil
  end

  def empty?
    @list.size == 0
  end

  def push(datum)
    if @list.empty?
      @list.prepend(Element.new(datum))
    else
      @list.prepend(Element.new(datum, @list.first))
    end
  end

  def size
    @list.size
  end

  def peek
    @list.first.datum unless @list.empty?
  end

  def head
    @list.first
  end

  def pop
    @list.shift.datum
  end

  def self.from_a(arr)
    return SimpleLinkedList.new unless arr.is_a? Array

    new_list = SimpleLinkedList.new
    (arr.size - 1).downto(0) do |i|
      new_list.push(arr[i])
    end
    new_list
  end

  def to_a
    @list.each_with_object([]) do |element, arr|
      arr << element.datum
    end
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end
end

list = SimpleLinkedList.from_a((1..10).to_a)
# p list.to_a
# p list
# p list.head.next.next.next.next.next.next.next.next.next.datum