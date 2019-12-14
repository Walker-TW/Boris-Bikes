class Bike 
  attr_accessor :broken
  
  DEFAULT_VALUE = false
  
  def initialize(broken=DEFAULT_VALUE)
    @broken = broken
  end

  def broken?
    true
  end

  def report_broken
    @broken = true
  end
end
