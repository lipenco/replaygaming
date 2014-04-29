module Dealer

  attr_reader :deck

  def self.game_dealer(game)
    case game
    when 'holdem'
      HoldemDealer.new
    when 'royal'
      RoyalDealer.new
    when 'omaha'
      OmahaDealer.new
    else
      raise 'Unknown game'
    end
  end


  def deal_board_cards
    @cards = []
    5.times { @cards << random_card }
    @cards
  end

  private

  def random_card
    @deck.delete_at(rand(@deck.size))
  end
end
