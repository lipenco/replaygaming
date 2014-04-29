
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