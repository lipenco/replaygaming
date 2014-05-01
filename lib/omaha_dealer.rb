class OmahaDealer
  include Dealer

  def initialize()
    @deck = Deck.new('omaha').deck
  end

  def deal_hole_cards
    @cards = Array.new(4) { random_card }
  end
end
