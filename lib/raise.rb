class Raise

  def initialize(betting_type)  
    @betting_type = betting_type
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

