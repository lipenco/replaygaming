require_relative 'card'
require_relative 'deck'
require_relative 'dealer_factory'
require_relative 'dealer'
require_relative 'holdem_dealer'
require_relative 'royal_dealer'
require_relative 'omaha_dealer'
require_relative 'raise'

class PokerTable

  attr_reader :betting_type, :type, :variation

  def initialize(variation, betting_type, type)
    @variation = variation
    @betting_type = betting_type
    self.type = type
    @dealer = DealerFactory.game_dealer(@variation)
    @raise = Raise.new(@betting_type)
  end

  def type=(type)
    unless ["mtt", "ring"].include?(type)
      raise "Invalid competition type"
    else
      @type = type
    end
  end

  def deck
    @dealer.deck
  end

  def deal_hole_cards
    @cards = @dealer.deal_hole_cards
  end


  def deal_board_cards
    @cards = @dealer.deal_board_cards
  end

  def min_raise
    @raise.min_raise
  end

  def max_raise
    @raise.max_raise
  end
end
