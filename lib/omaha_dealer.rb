class OmahaDealer
  include Dealer

  def initialize()
    @deck = Deck.new('omaha').deck
  end

  def deal_hole_cards
    @cards = (1..4).each_with_object([]) { |i, a| a << random_card}
  end
end
