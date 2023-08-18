class Turn
  attr_reader :player1, 
              :player2, 
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @card_rank1 = @player1.deck.rank_of_card_at(0)
    @card_rank2 = @player2.deck.rank_of_card_at(0)
    @war_rank1 = @player1.deck.rank_of_card_at(2)
    @war_rank2 = @player2.deck.rank_of_card_at(2)

    if @card_rank1 != @card_rank2
      :basic
    elsif !@war_rank1 || !@war_rank2 || @war_rank1 == @war_rank2
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      if @card_rank1 > @card_rank2
        then @player1
      else 
        @player2
      end
    elsif type == :war
      if @war_rank1 > @war_rank2
        then @player1
      else
        @player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    case type
    when :basic
      @spoils_of_war << @player1.deck.remove_card << @player2.deck.remove_card
    when :mutually_assured_destruction
      if !@war_rank1 || !@war_rank2
        @player1.deck.remove_card
        @player2.deck.remove_card
      else
        3.times do
          @player1.deck.remove_card
          @player2.deck.remove_card
        end
      end
    else
      3.times do
        @spoils_of_war << @player1.deck.remove_card << @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
  end
end
