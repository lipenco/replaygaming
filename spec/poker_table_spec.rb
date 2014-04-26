require 'pry'

require 'spec_helper'

describe 'PokerTable' do 

  describe '#deck' do 
    it 'returns the deck for holdem or omaha' do
      pkt = PokerTable.new("holdem", nil, nil)
      holdem_deck = pkt.deck
      holdem_deck.size.should eq 52
    end

    it 'returns the deck for royal' do
      pkt = PokerTable.new("royal", nil, nil)
      royal_deck = pkt.deck
      royal_deck.size.should eq 24
    end
  end

  describe '#deal_hole_cards' do 
    it 'returns 2 random cards for holdem and royal' do
      pkt = PokerTable.new("holdem", nil, nil)
      cards = pkt.deal_hole_cards
      cards.size.should eq 2
    end

    it 'returns 4 random cards from omaha' do
      pkt = PokerTable.new("omaha", nil, nil)
      cards = pkt.deal_hole_cards
      cards.size.should eq 4
    end
  end

end


