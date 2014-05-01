class RoyalDealer
  include Dealer

  def initialize()
    @deck = Deck.new('royal').deck
  end

  def deal_hole_cards
    @cards = (1..2).each_with_object([]) { |i, a| a << random_card}
  end
end
