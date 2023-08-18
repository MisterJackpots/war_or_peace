class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    # @cards[index].rank
    card = @cards[index]
    card.rank if card
  end

  # Method high_ranking_cards should read rank of each card in the cards array, if the
  # card rank is greater than 10, the card should go into the high_rank_cards array


  def high_ranking_cards
    @high_rank_cards = []
    @cards.each do |card|
      if card.rank > 10
        then @high_rank_cards << card
      end
    end
    @high_rank_cards
  end

  def percent_high_ranking
    (@high_rank_cards.length.to_f / @cards.length.to_f * 100).round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(cards)
    cards.kind_of?(Array) ? @cards.concat(cards) : @cards.push(cards)
  end
end
