class CircularQueue
  def initialize(num)
    @buffer = [nil] * num
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    dequeue if @buffer.none? { |el| el.nil? }

    @next_position = increment(@next_position) unless @buffer[@next_position].nil?

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    return nil if @buffer.all? { |el| el.nil? }

    @buffer[@oldest_position] = nil
    @oldest_position += 1
  end

  def increment(num)
    (num + 1 ) % @buffer.size
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