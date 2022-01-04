require 'pry'

module Hand
  def busted?
    total > 21
  end

  def total
    sum = @hand.collect(&:value).sum
    sum = adjust_for_aces(sum) if @hand.any?(&:ace?)
    sum
  end

  def adjust_for_aces(sum)
    if sum > 21
      num_aces = @hand.count(&:ace?)
      loop do
        sum -= 10
        num_aces -= 1
        break if num_aces == 0 || sum < 21
      end
    end
    sum
  end
end

class Participant
  attr_accessor :name, :hand

  def initialize
    @hand = []
    @name = nil
  end
end

class Player < Participant
  include Hand
end

class Dealer < Participant
  include Hand

  def initialize
    @hand = []
    @name = 'R2D2'
  end
end

class Deck
  SUITS = ['Hearts', 'Spades', 'Diamonds', 'Clubs']
  CARD_NAMES = ['2', '3', '4', '5', '6', '7', '8', '9', '10'] +
               ['Jack', 'Queen', 'King', 'Ace']

  attr_accessor :deck

  def initialize
    @deck = create_new_deck
  end

  def create_new_deck
    deck = []
    CARD_NAMES.each do |name|
      SUITS.each do |suit|
        deck << Card.new(name, suit)
      end
    end
    deck.shuffle
  end

  def deal
    @deck.pop
  end
end

class Card
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]

  attr_reader :value

  def initialize(card_name, suit)
    @card_name = card_name
    @suit = suit
    @value = CARD_VALUES[Deck::CARD_NAMES.find_index(card_name)]
  end

  def to_s
    "#{@card_name} of #{@suit}"
  end

  def ace?
    @card_name == 'Ace'
  end
end

class Game
  def start
    display_welcome_message
    ask_player_name
    display_welcome_player
    main_game
    display_goodbye_message
  end

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @round = 1
  end

  def deal_initial_cards
    system 'clear'
    2.times do
      deal_card(@player)
      deal_card(@dealer)
    end
  end

  def deal_card(participant)
    participant.hand << @deck.deck.pop
  end

  def show_initial_cards
    show_hand(@player)
    show_dealer_flop
  end

  def show_hand(participant)
    puts "#{participant.name}'s hand: #{participant.hand.join(', ')}"
    puts "#{participant.name}'s total: #{participant.total}"
    puts ""
  end

  def show_dealer_flop
    puts "Dealer's hand: Unknown, #{@dealer.hand.last}"
    puts ""
  end

  def player_turn
    puts "First up, it's #{@player.name}'s turn."
    puts ""
    loop do
      choice = hit_or_stay
      hit(@player) if choice == 'hit'
      stay(@player) if choice == 'stay'
      break if @player.busted? || choice == 'stay'
    end
  end

  def hit_or_stay
    choice = nil
    loop do
      puts "Would you like to hit or stay?"
      choice = gets.chomp.downcase
      break if %w(hit stay).include?(choice)
      puts "Sorry, incorrect input. Must be 'hit' or 'stay'"
    end
    choice
  end

  def hit(participant)
    puts "#{participant.name} decided to hit!"
    deal_card(participant)
    show_hand(participant)
  end

  def stay(participant)
    puts "#{participant.name} decided to stay!"
  end

  def dealer_turn
    puts "Now it's #{@dealer.name}'s turn!"
    puts ""
    loop do
      deal_card(@dealer) if @dealer.total < 17
      break if @dealer.total <= 21 && @dealer.total >= 17
      break if @dealer.busted?
    end

    show_hand(@dealer)
  end

  def show_result
    if @player.busted?
      puts "Busted! You went over 21."
    elsif @dealer.busted?
      puts "You won! The dealer busted!"
    elsif @player.total > @dealer.total
      puts "You won!"
    elsif @player.total <= @dealer.total
      puts "You lost!"
    end
  end

  def display_welcome_message
    system 'clear'
    puts "Welcome to 21!"
    puts "The goal of the game is to get closer to 21 than the dealer " \
         "without going over!"
    puts "Face cards are worth 10 and aces are worth either 1 or 11."
    puts "Let's get started!"
    puts ""
  end

  def ask_player_name
    input = nil
    loop do
      puts "What should we call you?"
      input = gets.chomp
      break if !input.empty?
      puts "Sorry, your name has to be at least one character long."
    end
    @player.name = input
  end

  def display_welcome_player
    system 'clear'
    puts "Great, welcome to 21 #{@player.name}!"
    puts ""
    sleep 1
  end

  def display_goodbye_message
    puts "Thanks for playing 21! See you next time!"
  end

  def play_again?
    input = nil
    loop do
      puts "Want to play again? (y/n)"
      input = gets.chomp
      break if %w(y n yes no).include?(input)
    end
    input.include?('y')
  end

  def reset
    @player.hand = []
    @dealer.hand = []
    @deck = Deck.new
    @round += 1
  end

  def display_round
    puts "=============== Round #{@round} ==============="
  end

  def main_game
    loop do
      deal_initial_cards
      display_round
      show_initial_cards
      player_turn
      dealer_turn unless @player.busted?
      show_result
      break unless play_again?
      reset
    end
  end
end

Game.new.start
