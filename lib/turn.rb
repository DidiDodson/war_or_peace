class Turn
  attr_reader :player1, :player2, :spoils_of_war

  #initialize
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #type method(denotes type of turn)
  def type

    if (@player1.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)) == (@player2.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war

    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  #define identify methods for players 1 & 2, and spoils of war
  def player1
    @player1
  end

  def player2
    @player2
  end

  def spoils_of_war
    @spoils_of_war
  end


  # define winner method
  def winner
    if (@player1.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)) == (@player2.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(2))
      return "No Winner"

    elsif @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) || @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1

    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2) || @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    end
  end

  # define pile of cards method
  def pile_cards

    if (@player1.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)) == (@player2.deck.rank_of_card_at(0) && @player2.deck.rank_of_card_at(2))
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(1)
      @player1.deck.cards.delete_at(2)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(1)
      @player2.deck.cards.delete_at(2)
        return @spoils_of_war


    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(1)
      @player1.deck.cards.delete_at(2)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(1)
      @player2.deck.cards.delete_at(2)
        return @spoils_of_war


    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      @player1.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
        return @spoils_of_war
    end
  end

  #define award_spoils(winner) method
  def award_spoils(winner)
    if winner == @player1
      @player1.deck.cards.push(@spoils_of_war)
    elsif winner == @player2
      @player2.deck.cards.push(@spoils_of_war)
    end
  end
end
