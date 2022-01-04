require 'pry'

class GuessingGame
  def initialize(lower_limit, upper_limit)
    @secret_num = nil
    @lower = lower_limit
    @upper = upper_limit
  end

  def play
    reset(@lower, @upper)

    loop do
      display_num_guesses
      request_guess
      display_guess_result
      break if game_won? || no_guesses_left?
    end

    display_overall_result
  end

  private

  def reset(lower_limit, upper_limit)
    @secret_num = rand(lower_limit..upper_limit)
    @guesses = Math.log2(upper_limit - lower_limit).to_i + 1
  end

  def display_num_guesses
    case @guesses
    when 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{@guesses} guesses remaining."
    end
  end

  def request_guess
    loop do
      print "Enter a number between #{@lower} and #{@upper}: "
      @guess = gets.chomp.to_i
      break if (@lower..@upper).to_a.include?(@guess)
      print "Invalid guess. "
    end
    @guesses -= 1
  end

  def display_guess_result
    # binding.pry
    case @guess <=> @secret_num
    when -1
      puts "Your guess is too low"
    when 0
      puts "That's the number!"
    when 1
      puts "Your guess is too high"
    end
  end

  def game_won?
    @secret_num == @guess
  end

  def no_guesses_left?
    @guesses == 0
  end

  def display_overall_result
    if game_won?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play

game.play