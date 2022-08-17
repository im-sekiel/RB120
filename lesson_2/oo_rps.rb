# Game Orchestration Engine
class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    case value
    when 'rock' then Rock.new.win?(other_move)
    when 'paper' then Paper.new.win?(other_move)
    when 'scissors' then Scissors.new.win?(other_move)
    when 'lizard' then Lizard.new.win?(other_move)
    when 'spock' then Spock.new.win?(other_move)
    end
  end

  def <(other_move)
    case other_move.value
    when 'rock' then Rock.new.win?(self)
    when 'paper' then Paper.new.win?(self)
    when 'scissors' then Scissors.new.win?(self)
    when 'lizard' then Lizard.new.win?(self)
    when 'spock' then Spock.new.win?(self)
    end
  end

  def to_s
    @value
  end
end

class Rock
  def win?(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Paper
  def win?(other_move)
    other_move.rock? || other_move.spock?
  end
end

class Scissors
  def win?(other_move)
    other_move.paper? || other_move.lizard?
  end
end

class Lizard
  def win?(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Spock
  def win?(other_move)
    other_move.scissors? || other_move.rock?
  end
end

class Player
  attr_accessor :move, :name, :points, :moves

  def initialize
    set_name
    @points = 0
    @moves = []
  end

  def add_points
    self.points += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
    system("clear")
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    moves << choice
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    case name
    when 'R2D2'     then choice = r2d2
    when 'Hal'      then choice = hal
    when 'Chappie'  then choice = chappie
    when 'Sonny'    then choice = sonny
    when 'Number 5' then choice = number_5
    end

    self.move = Move.new(choice)
    moves << choice
  end

  def r2d2
    ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample
  end

  def hal
    'rock'
  end

  def chappie
    'paper'
  end

  def sonny
    ['lizard', 'spock'].sample
  end

  def number_5
    ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "First player to a score of 10, wins!"
  end

  def display_goodbye_message
    case human.points
    when 10 then puts "#{human.name} wins the game!"
    else         puts "#{computer.name} wins the game!"
    end
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock! Good bye!"
  end

  def display_winner
    display_moves

    if human.move > computer.move
      display_human_won
    elsif human.move < computer.move
      display_computer_won
    else
      puts ""
      puts "It's a tie!"
    end
  end

  def display_human_won
    human.add_points
    puts ""
    puts "#{human.name} won!".upcase
  end

  def display_computer_won
    computer.add_points
    puts ""
    puts "#{computer.name} won!".upcase
  end

  def display_moves
    puts "#{human.name}: #{human.move}."
    puts ' ' * (human.name.size) + "VS"
    puts "#{computer.name}: #{computer.move}."
  end

  def score
    puts ""
    puts "*******SCORE*******"
    puts "#{human.name}: #{human.points}"
    puts "#{computer.name}: #{computer.points}"
    puts ""
  end

  def ten?
    if human.points == 10 || computer.points == 10
      return "A player has reached 10 points!"
    end
    false
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    system("clear")
    return true if answer == 'y'
    false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      score
      break if ten? || !play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
