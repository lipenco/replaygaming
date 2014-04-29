class RoyalDealer
  include Dealer

  def initialize()
    @deck = Deck.new('royal').deck
  end

  def deal_hole_cards
    @cards = []
      2.times { @cards << random_card }
    @cards
  end
end
