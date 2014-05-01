class Raise

  def initialize(betting_type)
    @betting_type = betting_type
  end


  def min_raise
    case @betting_type
    when 'nl', 'pl'
      20
    when 'fl'
      100
    else
      raise "Invalid betting type"
    end
  end


  def max_raise
    case @betting_type
    when 'nl'
      300
    when 'pl'
      200
    when 'fl'
      100
    else
      raise "Invalid betting type"
    end
  end
end
