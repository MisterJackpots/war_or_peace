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
    @play_card1 = @player1.deck.rank_of_card_at(0)
    @play_card2 = @player2.deck.rank_of_card_at(0)
    @war_card1 = @player1.deck.rank_of_card_at(2)
    @war_card2 = @player2.deck.rank_of_card_at(2)

    if @play_card1 != @play_card2
      :basic
    elsif !@war_card1 || !@war_card2 || @war_card1 == @war_card2
      :mutually_assured_destruction
    else
      :war
    end
  end

  def winner
    if type == :basic
      if @play_card1 > @play_card2
        then @player1
      else 
        @player2
      end
    elsif type == :war
      if @war_card1 > @war_card2
        then @player1
      else
        @player2
      end
    else type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    else
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
  end
end
