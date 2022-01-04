require 'pry'

class Card
  include Comparable
  SUIT_ORDER = ["Diamonds", "Clubs", "Hearts", "Spades"]
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
    if value == other_card.value
      SUIT_ORDER.find_index(suit) <=> SUIT_ORDER.find_index(other_card.suit)
    else
      value <=> other_card.value
    end
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new('Jack', 'Spades'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Clubs'),
         Card.new('Jack', 'Hearts')]
p cards.sort
puts cards.min.rank == 8
puts cards.max.rank == 8
