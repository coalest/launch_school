require 'pry'

class PokerHand
  def initialize(deck)
    @deck = deck
    @hand = Array.new(5) { @deck.draw }
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  def self.royal_flush?(cards)
    hand = PokerHand.new(cards)
    p self.class
    p hand.class
    hand.royal_flush?
  end

  

  def royal_flush?
    values.min == 10 && straight_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    num_kind?(4)
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    values[0..-2].each_with_index do |value, i|
      return false unless (values[i + 1] - value) == 1
    end
    true
  end

  def three_of_a_kind?
    num_kind?(3)
  end

  def two_pair?
    values.uniq.count { |card| values.count(card) == 2 } == 2
  end

  def pair?
    num_kind?(2)
  end

  def num_kind?(num)
    values.any? { |card| values.count(card) == num }
  end

  def values
    @hand.map(&:value).sort
  end

  def suits
    @hand.map(&:suit)
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = new_deck.shuffle
  end

  def draw
    @deck = new_deck if @deck.empty?
    @deck.pop
  end

  def new_deck
    arr = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        arr << Card.new(rank, suit)
      end
    end
    arr.shuffle
  end
end

class Card
  include Comparable
  SUITS = ["Hearts", "Spades", "Diamonds", "Clubs"]
  FACE_VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank} of #{@suit}"
  end

  def value
    return FACE_VALUES[rank] if FACE_VALUES.keys.include?(rank)
    rank
  end

  def <=>(other_card)
    value <=> other_card.value
  end
end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = [
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
]
puts PokerHand.royal_flush?(hand)