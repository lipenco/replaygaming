module Dealer

  attr_reader :deck

  def deal_board_cards
    @cards = Array.new(5) { random_card }
  end

  private

  def random_card
    @deck.delete_at(rand(@deck.size))
  end
end
