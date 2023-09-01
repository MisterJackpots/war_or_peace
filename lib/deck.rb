class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    card = @cards[index]
    card.rank if card
  end

  def high_ranking_cards
    @cards.find_all { |card| card.rank > 10 }
  end
  
  def percent_high_ranking
    (self.high_ranking_cards.size / @cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(cards)
    cards.kind_of?(Array) ? @cards.concat(cards) : @cards.push(cards)
  end
end
