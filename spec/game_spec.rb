require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

RSpec.describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it 'has readable attributes' do
    game = Game.new
    expect(game.turn_count).to eq(0)
    expect(game.game_deck).to eq([])
  end

  # it 'can create a shuffled game deck' do
  #   deck1 = Deck.new([])
  #   deck2 = Deck.new([])
  #   player1 = Player.new("Megan", deck1)
  #   player2 = Player.new("Aurora", deck2)
  #   turn = Turn.new(player1, player2)
  #   game = Game.new
  #   game.compile_deck
  #   expect(game.game_deck.length).to eq(52)
  # end
  
  # # it 'can distribute game deck to players' do
  # #   deck1 = Deck.new([])
  # #   deck2 = Deck.new([])
  # #   player1 = Player.new("Megan", deck1)
  # #   player2 = Player.new("Aurora", deck2)
  # #   turn = Turn.new(player1, player2)
  # #   game = Game.new
  # #   game.compile_deck
  # #   game.deal_deck
  # #   expect(player1.deck.cards.length).to eq(26)
  # #   expect(player2.deck.cards.length).to eq(26)
  # # end
end
