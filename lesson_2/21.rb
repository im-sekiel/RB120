=begin
A = 1 || 11
J, Q, K = 10
52 Cards = Spades, Diamonds, Clubs, Hearts
Suit = 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A

Understanding the Problem:
Dealer
Player
Take turns, player goes first.
Both dealer and player are given 2 cards (1 card face up, 1 card face down).
Player chooses to stay or take a card.
We want to check if either player or dealer are over 21
  Player who is over 21 loses
If not over 21, we compare values/sum
Player with the highest sum wins

Welcome the player to start a game of 21.  Ask the player if s/he wants to play 1 game, or a set of games (5), or read instructions.  Play first game.  Players are dealt 2 cards.  User goes first and decides if s/he wants to hit or stay.  If user hits, the user is dealt another card.  Determine if the user's sum is over 21. If user stays, the turn is over, or if they go over 21. After the sum is determined, we have dealer decide if they want to hit. Check if their sum is over 21, if so they lose. We compare sums and highest sum wins.

Verbs:
"Hit"
"Stay"
"Bust"
"Win"
"Deal"
"Determine sum"
"Determine win"

Nouns:
Cards => 4 Suits
Suits => 13 Cards
Players => You and dealer
Game

Deck < Suits < Cards

Welcome to the Game

Explain Rules

Deal card
  - 1 to player
  - 1 to dealer, face down
  - 1 to player
  - 1 to dealer

Evaluate sum

Decide if 'Hit'
  - If hit, evaluate sum
  - If sum over 21, bust
  - else hit?
    - If not hit, dealers turn

Dealers turn
  - Evaluate sum
  - If sum >= 17, stay
  - else hit

Compare
  Dealer > Player
    Dealer wins!
  Player > Dealer
    Player wins!
  else
    tie!
  end

Ask to play again?


=end
class Cards
  attr_accessor :cards

  def initialize
    @cards =  ['2', '3', '4', '5'] +
              ['6', '7', '8', '9'] +
              ['10', 'J', 'Q', 'K', 'A']  
  end
end

class Spades < Cards
  def initialize
    super
  end
end

class Diamonds < Cards
  def initialize
    super
  end
end

class Hearts < Cards
  def initialize
    super
  end
end

class Clubs < Cards
  def initialize
    super
  end
end


class Suits
  attr_accessor :diamonds, :hearts, :spades, :clubs

  def initialize
    @diamonds = Diamonds.new.cards
    @hearts = Hearts.new.cards
    @spades = Spades.new.cards
    @clubs = Clubs.new.cards
  end
end

class Deck < Suits
  attr_accessor :deck, :all_cards

  def initialize
    super
    @all_cards = diamonds + spades + hearts + clubs
  end

  # def to_s
  #   @deck
  # end
end

class TwentyOne
  attr_accessor :deck

  def initialize
    @deck = Deck.new.all_cards
  end

  def greet
    puts "Welcome to the game of 21!"
    puts "The goal is to get 21 or close to it! If you go over, you lose!"
    puts "The player with the greater sum, wins!"
  end

  def play
    greet
    
  end
end

puts TwentyOne.new.play
