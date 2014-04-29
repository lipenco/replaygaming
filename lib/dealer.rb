class Dealer

  attr_reader :deck


  def initialize(variation)  
    @variation = variation
    @deck = Deck.new(@variation).deck
    
  end


  def deal_hole_cards
    @cards = []
    if @variation == "holdem" || @variation == "royal"
      2.times { @cards << random_card }
    else
      4.times { @cards << random_card }
    end
    @cards
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



