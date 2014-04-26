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

    it 'it deletes distributed cards from deck array' do
      pkt = PokerTable.new("holdem", nil, nil)
      pkt.deal_hole_cards
      pkt.deck.size.should eq 50
    end
  end


  describe '#deal_board_cards' do 
    it 'it deal 5 random cards from the deck' do
      pkt = PokerTable.new("holdem", nil, nil)
      pkt.deal_board_cards
      pkt.deck.size.should eq 47
    end
  end


  describe '#min_raise' do 
    it 'it returns rinse value for nl' do
      pkt = PokerTable.new("holdem", "nl", nil)
      pkt.min_raise.should eq 20
    end

    it 'it returns rinse value for fi' do
      pkt = PokerTable.new("holdem", "fi", nil)
      pkt.min_raise.should eq 100
    end
  end

  describe '#max_raise' do 
    it 'it returns rinse value for nl' do
      pkt = PokerTable.new("holdem", "nl", nil)
      pkt.max_raise.should eq 300
    end

    it 'it returns rinse value for fi' do
      pkt = PokerTable.new("holdem", "fi", nil)
      pkt.max_raise.should eq 100
    end
  end

  describe '#type' do 
    it 'it returns type' do
      pkt = PokerTable.new("holdem", "nl", "mtt")
      pkt.type.should eq "mtt"
    end

    it 'it returns nil if type is invalid' do
      pkt = PokerTable.new("holdem", "fi", "invalid_type")
      pkt.type.should eq nil
    end
  end


end


