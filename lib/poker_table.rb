require_relative 'card'
require_relative 'deck'
require_relative 'dealer'

class PokerTable

  attr_reader :betting_type, :type, :variation
  
  def initialize(variation, betting_type, type)  
    @variation = variation
    @betting_type = betting_type
    self.type = type
    @dealer = Dealer.new(@variation)
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
    if @betting_type == "nl" || @betting_type == "pl"
      20
    elsif @betting_type == "fl"
      100
    else
      raise "Invalid betting type"
    end
  end

  def max_raise
    if @betting_type == "nl" 
      300
    elsif @betting_type == "pl" 
      200
    elsif @betting_type == "fl"
      100
    else
      raise "Invalid betting type"
    end
  end

end
