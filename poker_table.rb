require 'pry'


class PokerTable

    attr_accessor :variation, :betting_type, :competitions
    
    def initialize(variation, betting_type, competitions)  
      @variation = variation
      @betting_type = betting_type
      @competitions = competitions
      @deck = Deck.new(@variation).cards
    end

    def type
      @competitions
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
      # deck. pick 5 cards
    end

    private

    def random_card    
      deck.delete_at(rand(deck.size))
    end



    # def min_raise
    #   if type
    #     nl => 20
    #     pl => 20
    #     fl => 100
    # end

    # def max_raise
    #   if type
    #     nl => 300
    #     pl => 200
    #     fl => 100
    # end
 
end

class Deck

  attr_reader :cards

  def initialize(variation)
    @variation = variation
    @cards = []
  end

  def full_deck
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards
  end

  def royal_deck
    @cards = []
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

  # def random_card
  #   cards.delete_at(rand(cards.size))
  # end

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