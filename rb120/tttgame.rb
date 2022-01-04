require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).collect(&:marker)
      if markers.none?(Square::INITIAL_MARKER) && markers.uniq.count == 1
        return markers.uniq.first
      end
    end
    nil
  end

  # return the square key to defend the 3rd square before opponent wins
  def find_key_move(target_marker)
    WINNING_LINES.each do |line|
      markers = @squares.values_at(*line).collect(&:marker)
      if markers.count { |marker| marker == target_marker } == 2 &&
         markers.include?(Square::INITIAL_MARKER)
        return line[markers.find_index(" ")]
      end
    end
    nil
  end

  # return true if there are 2 squares marked by an opponent, otherwise false
  def immediate_threat?
    !!find_key_move("X")
  end

  def winning_move?
    !!find_key_move("O")
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :marker, :name

  def initialize
    @marker = nil
    @name = nil
  end
end

class TTTGame
  SCORE_TO_WIN = 5

  def play
    clear
    display_welcome_message
    ask_for_names
    request_markers
    who_should_go_first
    main_game
    display_grand_winner if grand_winner?
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_marker = nil
    @score = { human: 0, computer: 0 }
  end

  def request_markers
    ask_for_human_marker
    calc_computer_marker
  end

  def ask_for_names
    ask_name_of(human)
    ask_name_of(computer)
  end

  def ask_name_of(player)
    whose = player == human ? "your" : "the computer's"

    choice = nil
    loop do
      puts "What should #{whose} name be?"
      choice = gets.chomp
      break if !choice.empty?
    end
    player.name = choice
  end

  def display_welcome_message
    puts "=========== Welcome to Tic Tac Toe! ============"
    puts ""
    puts "To be the grand winner, you need to win #{SCORE_TO_WIN} games!"
    puts ""
  end

  def who_should_go_first
    choice = nil

    loop do
      puts "Who should go first?"
      puts "Options: #{human.name} (1), #{computer.name} (2), or random (3)"
      choice = gets.chomp
      break if %w(1 2 3).include?(choice)
      puts "Sorry, not a correct input. Please input 1, 2, or 3."
    end

    first_player_is(choice)
  end

  def first_player_is(choice)
    @current_marker = case choice
                      when '1' then human.marker
                      when '2' then computer.marker
                      when '3' then [human.marker, computer.marker].sample
                      end
  end

  def ask_for_human_marker
    choice = nil
    loop do
      puts "Which marker would you like to be?"
      choice = gets.chomp
      break if choice.length == 1
      puts "Please only input one character. We suggest an X or an O."
    end

    @human.marker = choice
  end

  def calc_computer_marker
    choice = if human.marker == "X"
               "O"
             else
               "X"
             end
    @computer.marker = choice
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "#{human.name}'s marker: #{human.marker}. " \
         "#{computer.name}'s marker: #{computer.marker}"
    board.draw
    puts ""
  end

  def display_score
    puts ""
    puts "The score is now"
    puts "#{human.name}: #{@score[:human]} " \
         "#{computer.name}: #{@score[:computer]}"
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def join_or(arr, delimiter=", ", conjunction = "or")
    case arr.size
    when 1
      arr.first
    when 2
      "#{arr[0]} or #{arr[1]}"
    else
      arr[0..-2].join(delimiter) + " #{conjunction} " + arr.last.to_s
    end
  end

  def human_moves
    puts "Choose a square: #{join_or(board.unmarked_keys)}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  # rubocop:disable Metrics/AbcSize
  def computer_moves
    square = if board.winning_move?
               board.find_key_move(computer.marker)
             elsif board.immediate_threat?
               board.find_key_move(human.marker)
             elsif board.unmarked_keys.include?(5)
               5
             else
               board.unmarked_keys.sample
             end

    board[square] = computer.marker
  end
  # rubocop:enable Metrics/AbcSize

  def display_result
    clear
    display_board
    update_score_and_display_winner
    display_score
  end

  def update_score_and_display_winner
    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
      @score[:human] += 1
    when computer.marker
      puts "#{computer.name} won!"
      @score[:computer] += 1
    else
      puts "The board is full! No one won."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    who_should_go_first
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def grand_winner?
    @score.values.any? { |score| score >= SCORE_TO_WIN }
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      display_board
      player_move
      display_result
      break if grand_winner? || !play_again?
      reset
      display_play_again_message
    end
  end

  def display_grand_winner
    if @score[:human] >= 5
      puts "#{human.name} is the grand winner! You were the first to " \
           "#{SCORE_TO_WIN}!"
    elsif @score[:computer] >= 5
      puts "#{computer.name} the grand winner! They were the first to " \
           "#{SCORE_TO_WIN}!"
    end
  end
end

game = TTTGame.new
game.play
