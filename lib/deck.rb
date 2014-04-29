
class Deck


  def initialize(variation)
    @variation = variation
    @cards = []
  end

  def full_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards
  end

  def royal_deck
    Card::SUITS.map do |suit|
      Card::ROYAL_RANKS.map do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards
  end

  def deck
    if @variation == "holdem" || @variation == "omaha"
      full_deck
    else
      royal_deck
    end
  end
end
