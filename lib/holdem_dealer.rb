class HoldemDealer
  include Dealer

  def initialize()
    @deck = Deck.new('holdem').deck
  end

  def deal_hole_cards
    @cards = Array.new(2) { random_card }
  end
end
