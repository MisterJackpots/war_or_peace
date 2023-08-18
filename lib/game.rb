require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :turn_count, 
              :game_deck,
              :player1,
              :player2

  def initialize
    @turn_count = 0
    @game_deck = []
  end

  def start
    self.game_message

    if gets.chomp.downcase == 'go'
      self.begin_game
    else
      self.abort('Veni, Vidi, Vici, baby!!!')
    end
  end

  def begin_game
    self.create_players
    self.compile_deck
    self.deal_deck
    self.run_game
  end

  def run_game
    while @turn_count < 1000000
      self.new_turn
      self.check_for_winner
    end

    self.abort('---- DRAW ----')
  end
  
  def game_message
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are Megan and Aurora."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
  end

  def create_players
    deck1 = Deck.new([])
    deck2 = Deck.new([])
    @player1 = Player.new('Megan', deck1)
    @player2 = Player.new('Aurora', deck2)
  end

  def compile_deck
    card1 = Card.new(:club, '2', 2)
    card2 = Card.new(:club, '3', 3)
    card3 = Card.new(:club, '4', 4)
    card4 = Card.new(:club, '5', 5)
    card5 = Card.new(:club, '6', 6)
    card6 = Card.new(:club, '7', 7)
    card7 = Card.new(:club, '8', 8)
    card8 = Card.new(:club, '9', 9)
    card9 = Card.new(:club, '10', 10)
    card10 = Card.new(:club, 'Jack', 11)
    card11 = Card.new(:club, 'Queen', 12)
    card12 = Card.new(:club, 'King', 13)
    card13 = Card.new(:club, 'Ace', 14)
    card14 = Card.new(:diamond, '2', 2)
    card15 = Card.new(:diamond, '3', 3)
    card16 = Card.new(:diamond, '4', 4)
    card17 = Card.new(:diamond, '5', 5)
    card18 = Card.new(:diamond, '6', 6)
    card19 = Card.new(:diamond, '7', 7)
    card20 = Card.new(:diamond, '8', 8)
    card21 = Card.new(:diamond, '9', 9)
    card22 = Card.new(:diamond, '10', 10)
    card23 = Card.new(:diamond, 'Jack', 11)
    card24 = Card.new(:diamond, 'Queen', 12)
    card25 = Card.new(:diamond, 'King', 13)
    card26 = Card.new(:diamond, 'Ace', 14)
    card27 = Card.new(:heart, '2', 2)
    card28 = Card.new(:heart, '3', 3)
    card29 = Card.new(:heart, '4', 4)
    card30 = Card.new(:heart, '5', 5)
    card31 = Card.new(:heart, '6', 6)
    card32 = Card.new(:heart, '7', 7)
    card33 = Card.new(:heart, '8', 8)
    card34 = Card.new(:heart, '9', 9)
    card35 = Card.new(:heart, '10', 10)
    card36 = Card.new(:heart, 'Jack', 11)
    card37 = Card.new(:heart, 'Queen', 12)
    card38 = Card.new(:heart, 'King', 13)
    card39 = Card.new(:heart, 'Ace', 14)
    card40 = Card.new(:spade, '2', 2)
    card41 = Card.new(:spade, '3', 3)
    card42 = Card.new(:spade, '4', 4)
    card43 = Card.new(:spade, '5', 5)
    card44 = Card.new(:spade, '6', 6)
    card45 = Card.new(:spade, '7', 7)
    card46 = Card.new(:spade, '8', 8)
    card47 = Card.new(:spade, '9', 9)
    card48 = Card.new(:spade, '10', 10)
    card49 = Card.new(:spade, 'Jack', 11)
    card50 = Card.new(:spade, 'Queen', 12)
    card51 = Card.new(:spade, 'King', 13)
    card52 = Card.new(:spade, 'Ace', 14)

    @game_deck = card1, card2, card3, card4, card5, card6, card7, card8, card9,
      card10, card11, card12, card13, card14, card15, card16, card17, card18,
      card19, card20, card21, card22, card23, card24, card25, card26, card27,
      card28, card29, card30, card31, card32, card33, card34, card35, card36,
      card37, card38, card39, card40, card41, card42, card43, card44, card45,
      card46, card47, card48, card49, card50, card51, card52

    
    @game_deck.shuffle!
  end

  def deal_deck
    26.times do
      @player1.deck.cards << @game_deck.shift
      @player2.deck.cards << @game_deck.shift
    end
  end

  def new_turn
    @turn_count += 1
    @turn = Turn.new(@player1, @player2)
    winner = @turn.winner
    self.turn_message

    @turn.pile_cards

    @turn.award_spoils(winner) unless winner == "No Winner"
  end

  def check_for_winner
    if @player1.has_lost?
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      exit
    elsif @player2.has_lost?
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      exit
    end
  end

  def turn_message
    current_turn = @turn.type
    removed_count = [@player1.deck.cards.size, @player2.deck.cards.size].min > 2 ? 6 : 2

    case current_turn
    when :basic
      puts "Turn #{@turn_count}: #{@turn.winner.name} won 2 cards"
    when :war
      puts "Turn #{@turn_count}: WAR - #{@turn.winner.name} won 6 cards"
    else
      puts "Turn #{@turn_count}: *mutually assured destruction* #{removed_count} cards removed from play"
    end
  end
end
