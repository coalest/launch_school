require 'pry'

class CircularQueue
  attr_accessor :queue

  def initialize(buffer_size)
    @queue = Array.new(buffer_size) { CircularObject.new }
  end

  def dequeue
    return nil if queue.all? { |el| el.value.nil? }

    i = oldest_index
    oldest_value = queue[i].value
    queue[i].value = nil
    oldest_value
  end

  def enqueue(object)
    dequeue if queue.none? { |el| el.value.nil? }
    first_nil_index = queue.index { |el| el.value.nil? }
    queue[first_nil_index].value = object
  end

  private

  def oldest_index
    oldest_time = Time.now
    queue.each do |el|
      next if el.value.nil?
      oldest_time = el.time if el.time < oldest_time
    end
    queue.index { |el| el.time == oldest_time }
  end
end

class CircularObject
  attr_accessor :time
  attr_reader :value

  def initialize
    @value = nil
    @time = Time.new
  end

  def value=(new_value)
    @value = new_value
    self.time = Time.new
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)

puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
