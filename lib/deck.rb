
class Deck


  def initialize(variation)
    @variation = variation
    @cards = []
  end

  def full_deck
    Card::RANKS.product(Card::SUITS).map { |arr| Card.new(*arr)}
  end

  def royal_deck
    Card::ROYAL_RANKS.product(Card::SUITS).map { |arr| Card.new(*arr)}
  end

  def deck
    if @variation == "holdem" || @variation == "omaha"
      full_deck
    else
      royal_deck
    end
  end
end
