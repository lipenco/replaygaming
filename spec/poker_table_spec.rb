require 'pry'

require 'spec_helper'

describe 'PokerTable' do 

  describe '#deck' do     
    it 'returns the deck for holdem or omaha' do
      pkt = PokerTable.new("holdem", nil, "mtt")
      holdem_deck = pkt.deck
      holdem_deck.size.should eq 52
    end

    it 'returns the deck for royal' do
      pkt = PokerTable.new("royal", nil, "mtt")
      royal_deck = pkt.deck
      royal_deck.size.should eq 20
    end
  end

  describe '#deal_hole_cards' do 
    it 'returns 2 random cards for holdem and royal' do
      pkt = PokerTable.new("holdem", nil, "mtt")
      cards = pkt.deal_hole_cards
      cards.size.should eq 2
    end

    it 'returns 4 random cards from omaha' do
      pkt = PokerTable.new("omaha", nil, "mtt")
      cards = pkt.deal_hole_cards
      cards.size.should eq 4
    end

    it 'deletes distributed cards from deck array' do
      pkt = PokerTable.new("holdem", nil, "mtt")
      pkt.deal_hole_cards
      pkt.deck.size.should eq 50
    end

    # it 'deletes distributed cards from deck array2' do
    #   pkt = PokerTable.new("holdem", nil, "mtt")
    #   pkt.deal_hole_cards
    #   pkt.deck.size.should eq 50
    # end

  end


  describe '#deal_board_cards' do 
    it 'deletes distributed cards from deck array' do
      pkt = PokerTable.new("holdem", nil, "mtt")
      pkt.deal_board_cards
      pkt.deck.size.should eq 47
    end

    it 'returns 5 random cards from the deck' do
      pkt = PokerTable.new("omaha", nil, "mtt")
      cards = pkt.deal_board_cards
      cards.size.should eq 5
    end
  end


  describe '#min_raise' do 
    it 'it returns rinse value for nl' do
      pkt = PokerTable.new("holdem", "nl", "mtt")
      pkt.min_raise.should eq 20
    end

    it 'it returns rinse value for fl' do
      pkt = PokerTable.new("holdem", "fl", "mtt")
      pkt.min_raise.should eq 100
    end
  end

  describe '#max_raise' do 
    it 'it returns rinse value for nl' do
      pkt = PokerTable.new("holdem", "nl", "mtt")
      pkt.max_raise.should eq 300
    end

    it 'it returns rinse value for fl' do
      pkt = PokerTable.new("holdem", "fl", "mtt")
      pkt.max_raise.should eq 100
    end
  end

  describe '#type' do 
    it 'it returns type' do
      pkt = PokerTable.new("holdem", "nl", "mtt")
      pkt.type.should eq "mtt"
    end
  end

  describe '#type=' do
    let(:pkt) { PokerTable.new("holdem", "nl", "ring") }

    it 'accepts "mtt"' do
      expect { pkt.type = "mtt" }.to_not raise_error
    end

    it 'accepts "ring"' do
      expect { pkt.type = "ring" }.to_not raise_error
    end

    it 'raises an error on invalid types' do
      expect { pkt.type = "invalid type" }.to raise_error
    end

    it 'raises an error on nil type' do
      expect { pkt.type = nil }.to raise_error
    end
  end
end


