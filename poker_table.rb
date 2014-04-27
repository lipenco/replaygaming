require 'pry'


class PokerTable

    attr_reader :variation, :betting_type, :competitions
    
    def initialize(variation, betting_type, competitions)  
      @variation = variation
      @betting_type = betting_type
      @competitions = competitions
      @deck = Deck.new(@variation).cards
    end

    def type
      @competitions if ["mtt", "ring"].include?(@competitions)
    end

    def deck
      @deck
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
      else
        100
      end
    end

    def max_raise
      if @betting_type == "nl" 
        300
      elsif @betting_type == "pl" 
        200
      else
        100
      end
    end

    private

    def random_card    
      deck.delete_at(rand(deck.size))
    end
 
end

class Deck

  attr_reader :cards

  def initialize(variation)
    @variation = variation
    @cards = []
  end

  def full_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards
  end

  def royal_deck
    Card::SUITS.each do |suit|
      Card::ROYAL_RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards
  end

  def cards
    if @variation == "holdem" || @variation == "omaha"
      full_deck  
    else
      royal_deck
    end 
  end

end


class Card
  attr_reader :rank, :suit

  SUITS = [:hearts, :clubs, :spades, :diamonds]
  RANKS = [:"2",:"3",:"4",:"5",:"6",:"7",:"8",:"9",:"10", :J, :Q, :K, :A]
  ROYAL_RANKS = [:"9",:"10", :J, :Q, :K, :A]

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

end