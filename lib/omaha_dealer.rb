class OmahaDealer
  include Dealer

  def initialize()
    @deck = Deck.new('omaha').deck
  end

  def deal_hole_cards
    @cards = []
      4.times { @cards << random_card }
    @cards
  end
end
