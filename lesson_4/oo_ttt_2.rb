class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
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

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
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

  def square_5_open?
    @squares[5].marker == Square::INITIAL_MARKER
  end

  def two_identical_human_markers?
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      next if squares.any? { |square| square.marker == TTTGame::O_MARKER }
      if (squares.count { |square| square.marker == TTTGame::X_MARKER }) == 2
        self.last_key = line
        return true
      end
    end
    nil
  end

  def two_identical_computer_markers?
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      next if squares.any? { |square| square.marker == TTTGame::X_MARKER }
      if (squares.count { |square| square.marker == TTTGame::O_MARKER }) == 2
        self.last_key = line
        return true
      end
    end
    nil
  end

  def extract_key
    last_key.each do |key|
      next if @squares[key].marker != Square::INITIAL_MARKER
      return key if @squares[key].marker == Square::INITIAL_MARKER
    end
  end

  private

  attr_accessor :last_key

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
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

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
    @score = 0
  end
end

class TTTGame
  X_MARKER = "X" # HUMAN_MARKER
  O_MARKER = "O" # COMPUTER_MARKER
  WINNING_SCORE = 5
  COMPUTER_NAMES = ["Chappie", "Rob_Ot", "Jack", "Adam", "Lawton"]

  attr_reader :board, :human, :computer, :first_to_move

  def initialize
    @board = Board.new
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    assign_state
    loop do
      display_board
      player_move
      display_result
      if score_is_5?
        announce_winner
        break unless play_again?
        assign_state
      end
      reset
      display_play_again_message
    end
  end

  def assign_marker(human_name, computer_name)
    puts "Would you like to be 'X' or 'O'? type 'x' or 'o'"
    choice = nil
    loop do
      choice = gets.chomp
      break if %w(x o).include? choice
      puts "Sorry, that's not a valid choice."
    end

    if choice == 'x'
      @human = Player.new(X_MARKER, human_name)
      @computer = Player.new(O_MARKER, computer_name)
    else
      @human = Player.new(O_MARKER, human_name)
      @computer = Player.new(X_MARKER, computer_name)
    end
  end

  def assign_name
    puts "What is your name?"
    gets.chomp
  end

  def assign_first_player
    puts "Would you like to go first? (y/n)"
    choice = nil
    loop do
      choice = gets.chomp
      break if %w(y n).include? choice
      puts "Sorry, that's not a valid choice."
    end

    case choice
    when 'y' then @first_to_move = @human.marker
    else          @first_to_move = @computer.marker
    end
    @current_marker = @first_to_move
  end

  def assign_state
    computer_name = COMPUTER_NAMES.sample
    human_name = assign_name
    assign_marker(human_name, computer_name)
    assign_first_player
  end

  def player_move
    loop do
      current_player_moves
      if board.someone_won? || board.full?
        add_to_score
        break
      end
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts "A couple questions before we begin.."
    puts ""
    sleep(2)
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
    display_score
  end

  def display_score
    puts " #{score_padding}***SCORE***"
    puts "#{human.name}:#{human.score} #{computer.name}:#{computer.score}"
    puts ""
  end

  def score_padding
    size = (human.name.size + computer.name.size) / 4
    " " * size
  end

  def add_to_score
    case board.winning_marker
    when human.marker     then human.score += 1
    when computer.marker  then computer.score += 1
    end
  end

  def score_is_5?
    (WINNING_SCORE == human.score) || (WINNING_SCORE == computer.score)
  end

  def human_moves
    puts "Choose a square (#{joinor}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def announce_winner
    case WINNING_SCORE
    when human.score then puts "You won the game!"
    when computer.score then puts "Computer won the game!"
    end
  end

  def joinor(punct = ',', conj = 'or')
    string = ""

    return board.unmarked_keys.join(' or ') if board.unmarked_keys.size <= 2

    board.unmarked_keys.each.with_index do |key, index|
      case index
      when (board.unmarked_keys.size - 1) then string << "#{conj} #{key}"
      else                                     string << "#{key}#{punct} "
      end
    end

    string
  end

  def computer_moves
    if board.square_5_open?
      board[5] = computer.marker
    elsif board.two_identical_computer_markers?
      computer_offense
    elsif board.two_identical_human_markers?
      computer_defense
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def computer_offense
    board[board.extract_key] = computer.marker
  end

  def computer_defense
    board[board.extract_key] = computer.marker
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

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
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
    system "clear"
  end

  def reset
    sleep(0.7)
    board.reset
    reset_score if score_is_5?
    @current_marker = @first_to_move
    clear
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
