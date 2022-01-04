class GuessingGame
  UPPER_LIMIT = 100

  def initialize
    reset
  end

  def play
    reset

    loop do
      display_num_guesses
      request_guess
      display_guess_result
      break if game_won? || no_guesses_left?
    end

    display_overall_result
  end

  private

  def reset
    @num = rand(1..UPPER_LIMIT)
    @guesses = 7
    @guess = nil
  end

  def display_num_guesses
    puts ""
    puts "You have #{@guesses} guesses remaining."
  end

  def request_guess
    loop do
      print "Enter a number between 1 and #{UPPER_LIMIT}: "
      @guess = gets.chomp.to_i
      break if (1..UPPER_LIMIT).to_a.include?(@guess)
      print "Invalid guess. "
    end
    @guesses -= 1
  end

  def display_guess_result
    case @guess <=> @num
    when -1
      puts "Your guess is too low"
    when 0
      puts "That's the number"
    when 1
      puts "Your guess is too high"
    end
  end

  def game_won?
    @num == @guess
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

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
