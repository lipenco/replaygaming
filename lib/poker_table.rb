require_relative 'card'
require_relative 'deck'

class PokerTable

  attr_reader :betting_type, :deck, :type, :variation
  
  def initialize(variation, betting_type, type)  
    @variation = variation
    @betting_type = betting_type
    self.type = type
    @deck = Deck.new(@variation).cards
  end

  def type=(type)
    unless ["mtt", "ring"].include?(type)
      raise "Invalid competition type"
    else
      @type = type
    end
  end

  def deal_hole_cards
    @cards = []
    if @variation == "holdem" || @variation == "royal"
      2.times { @cards << random_card }
    else
      4.times { @cards << random_card}
    end
    @cards
  end

  def deal_board_cards
    @cards = []
    5.times { @cards << random_card }
    @cards
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

  private

  def random_card    
    deck.delete_at(rand(deck.size))
  end
end
