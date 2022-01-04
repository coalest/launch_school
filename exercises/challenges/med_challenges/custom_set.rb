class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.all? { |num| other.set.include?(num) }
  end

  def disjoint?(other)
    set.none? { |num| other.set.include?(num) }
  end

  def eql?(other)
    set.uniq.sort == other.set.uniq.sort
  end

  def add(num)
    @set.push(num) unless set.include?(num)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(other)
    arr = []
    set.each do |num|
      arr << num if other.set.include?(num)
    end
    CustomSet.new(arr)
  end

  def difference(other)
    CustomSet.new(set - other.set)
  end

  def union(other)
    arr = (set + other.set)
    CustomSet.new(arr.uniq.sort)
  end
end