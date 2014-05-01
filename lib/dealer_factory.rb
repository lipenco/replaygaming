class DealerFactory

  def self.game_dealer(game)
    case game
    when 'holdem'
      HoldemDealer.new
    when 'royal'
      RoyalDealer.new
    when 'omaha'
      OmahaDealer.new
    else
      raise 'Unknown game'
    end
  end

end
